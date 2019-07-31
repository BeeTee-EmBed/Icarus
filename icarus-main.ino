#include <SparkFunMMA8452Q.h>
#include <math.h>
#include "Adafruit_GFX.h"
#include "Adafruit_PCD8544.h"

Adafruit_PCD8544 display = Adafruit_PCD8544(SS, D2, D3);                                                            //initializes the display object for the LCD screen
MMA8452Q accel;                                                                                                     //initializes the accelerometer object

const int thermistorInput = A0;                                                                                     //the thermistor is connected via ADC pin A0
const int ambientOutput = A1;                                                                                       //the ambient temp sensor is connected via ADC pin A1
const int refCellOutput = A6;                                                                                       //the reference cell is connected via ADC pin A2
const int mainButton = D4;                                                                                          //this input button turns the wifi on and off
const int tempButton = D5;                                                                                          //this input button switches the LCD back to the main display screen
const int maxButton = D6;                                                                                           //this input button switches the LCD screen to display the temperatures
const int thermocouplePin = WKP;

double supplyVoltage = 3.3;                                                                                         //the supply voltage for the different compentents is 3.3 volts
int adcLevel = 4095;                                                                                                //as the ADC is a 12-bit ADC, has 0-4095 discrete levels of values
double ambientTemp = 0;
double thermistorTemp = 0.0;
double irradiance = 0.0;
double theta = 0.0;                                                                                                 //the degree value for the Y-axis of the Icarus instrument
double adcRange = -1024;
int degreeRange = 90;
double maxAngle = 0.0;
double maxIrradiance = 0.0;

bool wifiFlag = false;
bool mainScreen = true;
bool tempScreen = false;
bool maxScreen = false;

SYSTEM_MODE(SEMI_AUTOMATIC);                                                                                        //enables manual control of wifi on or off

void setup()   {
    pinMode(A0, INPUT);                                                                                             //this is for the thermistor
    pinMode(A1, INPUT);                                                                                             //this is for the TMP36 ambient temp sensor
    pinMode(A6, INPUT);                                                                                             //reference cell input assignment
    pinMode(D4, INPUT);
    pinMode(D5, INPUT);
    pinMode(D6, INPUT);
    pinMode(D7, INPUT);
    pinMode(WKP, INPUT);
    
    accel.begin(SCALE_2G, ODR_1);                                                                                   //begins the accelerometer object, with a scale of +-2g's, and a 1Hz refresh rate
    
    Serial.begin(9600);                                                                                             //begins the serial
    display.begin();                                                                                                //initializes the display
    display.setContrast(55);                                                                                        //changes the contrast to ease reading
    display.display();                                                                                              //show opening screen ni the buffer
    delay(1000);
    display.clearDisplay();                                                                                         // clears the screen and buffer
    display.setTextSize(1);                                                                                         //changes text size in buffer
    display.setTextColor(BLACK);                                                                                    //sets the text color
    display.setCursor(0,0);                                                                                         //sets the location of printing to 0,0 pixel
    display.display();                                                                                              //displays all text in the buffer and clears the buffer
    delay(1000);
    display.clearDisplay();
  
}

void loop() {
    accel.read();                                                                                                   //reads the accelerometer data
    irradiance = getIrradiance();
    thermistorTemp = getThermistorTemp(getThermistorVoltage());
    ambientTemp = getAmbientTemp();
    
    if (wifiFlag == true) {
        Particle.publish("Thermistor_Temperature", String(thermistorTemp, 2));                                      //stores the thermistor temperature variable in the cloud
        Particle.publish("Ambient_Temperature", String(ambientTemp,2));                                             //stores the ambient temperature variable in the cloud
        Particle.publish("Irradiance", String(irradiance,2));                                                       //stores the irradiance variable in the cloud
        Particle.publish("Incline", String(theta,2));                                                               //sores the incline degree in the cloud
    }
    
    theta = accel.x / adcRange * degreeRange;                                                                       //scales the ADC value read from accelerometer to an angle measurement in positive
    irradiance = round(irradiance * 10) / 10;                                                                       //rounds the degrees to the nearest tenth
    theta = round(theta * 10) / 10;
    ambientTemp = round(ambientTemp * 10) / 10;
    thermistorTemp = round(thermistorTemp * 10) / 10;
    
    String screen = "";
    
    if (digitalRead(mainButton) == 0) {                                                                             //these if/else if conditionals check for if a button is pressed, and if so 
        screen = "main";
    }
    else if (digitalRead(tempButton) == 0) {
        screen = "temp";
    }
    else if (digitalRead(maxButton) == 0) {
        screen = "max";
    }
    
    setScreen(screen);
    
    if (mainScreen == true) {
        display.println("Degrees: " + String(theta, 2));                                                            //truncates the extraneos zeroes in the float, so as to not imply a greater degree of precision
        display.println();
        display.println(String(irradiance, 1) + "  W/m^2");
    }
    else if (tempScreen == true) {
        display.println("Temp: " + String(ambientTemp, 2));
        display.println();
        display.println("Therm: " + String(thermistorTemp, 2));
    }
    else if (maxScreen == true) {
        findMax();
    }
    display.display();
    delay(1000);
    display.clearDisplay();
}

//returns the value of the irradiance in Watts/m^2, as a double to one decimal point
double getIrradiance() {
  double thermistorVoltage, measuredShortCurrent;
  double referenceShortCurrent = 0.0586;
  double tempCoefficient = 0.0000265;
  int refThermTemp = 25;
  int refIrradiance = 1000;

  thermistorVoltage = getThermistorVoltage();                                                                       //gets the voltage across the thermistor
  thermistorTemp = getThermistorTemp(thermistorVoltage);                                                            //gets the temperature of the thermistor by passing in the current voltage across the thermistor
  measuredShortCurrent = getShortCurrent();                                                                         //gets the short-circuit current across the solar cell

  irradiance = refIrradiance * measuredShortCurrent / referenceShortCurrent * (1 - tempCoefficient * (thermistorTemp - refThermTemp));
                                                                                                                    //uses the measured current across the reference cell, the voltage from the cell,
                                                                                                                    //and the reference and measured temperature from the thermistor to calculate irradiance
  irradiance = round(irradiance * 10) / 10;                                                                         //rounds irradiance off to one decimal point
  return irradiance;
}

//reads the analog input from the thermistor, and returns the temperature in Celsius
double getThermistorTemp(double thermistorVoltage) {
  int voltDivResistor = 10000;                                                                                      //our resistror used in the voltage divider is a 10k Ohm resistor
  double thermB = 3428;                                                                                             //example value; 
  int refTemp = 25;                                                                                                 //the reference temperature is give nas 25 degrees Celsius

  double thermValue, thermResistance, temp;

  thermResistance = (supplyVoltage - thermistorVoltage) / (thermistorVoltage / voltDivResistor);
                                                                                                                    //gets the thermistor resistance by using the 
  temp = thermB * (refTemp + 273.15) / (log(thermResistance / voltDivResistor) * (refTemp + 273.15) + thermB) - 273.15;
  temp = round(temp * 10) / 10;                                                                                     //this rounds the temp value to one decimal place
  return temp;
}

//reads the analog input from the TMP36 analog sensor, and returns the temperature in Celsius
double getAmbientTemp() {
  double analogTempValue = analogRead(ambientOutput);
  return ((analogTempValue * 3.3 / 4096) / .03 - 50);                                                               //this is the temperature equation for the TMP36 sensor
}

//gets the voltage reading from the thermistor
double getThermistorVoltage() {
  return analogRead(thermistorInput) * supplyVoltage / adcLevel;
}

//gets the short circuit current reading from the reference cell
double getShortCurrent() {
  double shuntResistance = 0.08;
  double gain = 500.0;
  double cellVoltage = analogRead(refCellOutput) * 3.3 / 4096;                                                      //reads analog reading and converts ADC value to voltage using max volts and the 12-bit value
  return ((cellVoltage / gain) / shuntResistance);
}

//finds the max irradiance and angle associated with that irradiance when rotating the instrument about the x-axis for 5 seconds
void findMax() {
    display.println("Please rotate Icarus around its X-axis in 5...");
    display.display();
    delay(3000);
    display.clearDisplay();
    display.println("4...");
    display.display();
    delay(1000);
    display.clearDisplay();
    display.println("3...");
    display.display();
    delay(1000);
    display.clearDisplay();
    display.println("2...");
    display.display();
    delay(1000);
    display.clearDisplay();
    display.println("1...");
    display.display();
    delay(1000);
    display.clearDisplay();
    display.println("Calculating...");
    display.display();
    
    for (int i = 0; i < 10; i++) {
        irradiance = getIrradiance();
        theta = accel.x / adcRange * degreeRange;                                                                       //scales the ADC value read from accelerometer to an angle measurement in positive
        
        irradiance = round(irradiance * 10) / 10;                                                                       //rounds the degrees to the nearest tenth
        theta = round(theta * 10) / 10;
        
        if (irradiance > maxIrradiance) {                                                                               //compares the values read with the current, and saves as new max and angle if the values are greate
            maxIrradiance = irradiance;
            maxAngle = theta;
        }
        
        delay(250);
    }
    
    display.println("Max: " + String(maxIrradiance, 2));
    display.println("Angle: " + String(maxAngle, 2));
    display.display();
    delay(10000);
    display.clearDisplay();
    setScreen("main");
}

//compares the string parameter passed in, and depending on the value will set the boolean flags to correspond with the button pressed
void setScreen(String screen) {
    if (screen == "main") {
        mainScreen = true;
        tempScreen = false;
        maxScreen = false;
    }
    else if (screen == "temp") {
        mainScreen = false;
        tempScreen = true;
        maxScreen = false;
    }
    else if (screen == "max") {
        mainScreen = false;
        tempScreen = false;
        maxScreen = true;
    }
}