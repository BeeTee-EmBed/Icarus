#include <math.h>
#include <algorithm>
#include <array>
#include "Adafruit_GFX.h"
#include "Adafruit_PCD8544.h"
#include <SparkFunMMA8452Q.h>


using namespace std;

Adafruit_PCD8544 display = Adafruit_PCD8544(SS, D2, D3);                                                            
MMA8452Q accel;                                                                                             

static const int THERMISTOR_INPUT = A0;                                                                                   
static const int AMBIENT_OUTPUT = A1;                                                                                     
static const int REFERENCE_CELL_OUTPUT = A6;                                                                                      
static const int MAIN_BUTTON = D4;                                                                                          
static const int TEMPERATURE_BUTTON = D5;                                                                                          
static const int MAX_BUTTON = D6;                                                                                           
static const int THERMOCOUPLE_PIN = WKP;

static const int numValues = 11;
static const int medianLocation = 5;
static const int factorRound = 10;
static const double supplyVoltage = 3.3;                                                                                        
static const int adcLevel = 4095;                                                                                        
static const double adcRange = -1024;


double values[numValues];
double sortedValues[numValues];
int arrIndex = 0;
double total = 0;
double median = 0;
double ambientTemp = 0;
double thermistorTemp = 0.0;
double irradiance = 0.0;
double theta = 0.0;                                                                                                
int degreeRange = 90;
double maxAngle = 0.0;
double maxIrradiance = 0.0;
int screen = 1;

bool wifiFlag = false;
bool mainScreen = true;
bool tempScreen = false;
bool maxScreen = false;
enum menuLists {MAIN = 1, TEMPERATURE, MAX};

//enables manual control of wifi on or off
SYSTEM_MODE(SEMI_AUTOMATIC);                                                                                       

void setup()   {
    pinMode(A0, INPUT);                                                                                             
    pinMode(A1, INPUT);                                                                                             
    pinMode(A6, INPUT);                                                                                             
    pinMode(D4, INPUT);
    pinMode(D5, INPUT);
    pinMode(D6, INPUT);
    pinMode(D7, INPUT);
    pinMode(WKP, INPUT);
    
    accel.begin(SCALE_2G, ODR_1);
    
    Serial.begin(9600);                                                                                            
    display.begin();                                                                                           
    display.setContrast(55);                                                                                      
    display.setTextSize(1);                                                                                        
    display.setTextColor(BLACK);                                                                                  
    display.setCursor(0,0);                                                                                     

    //fills the array for moving average with zeroes
    for (int thisValue = 0; thisValue < numValues; thisValue++) {
        values[thisValue] = 0;
    }
    display.display();
    delay(2000);
    display.clearDisplay();
}

void loop() {
    accel.read();    
    irradiance = getIrradiance();
    ambientTemp = getAmbientTemp();
    theta = accel.x / adcRange * degreeRange * -1;         
    
    irradiance = round(irradiance * factorRound) / factorRound;                                     
    theta = round(theta * factorRound) / factorRound;
    ambientTemp = round(ambientTemp * factorRound) / factorRound;
    thermistorTemp = round(thermistorTemp * factorRound) / factorRound;

    setScreen();
    
    display.display();
    delay(250);
    display.clearDisplay();
}

//returns the value of the irradiance in Watts/m^2, as a double to one decimal point
double getIrradiance() {
  double thermistorVoltage;
  double measuredShortCurrent;
  double referenceShortCurrent = 0.0586;
  double tempCoefficient = 0.0000265;
  int refThermTemp = 25;
  int refIrradiance = 1000;

  thermistorVoltage = getThermistorVoltage();
  thermistorTemp = getThermistorTemp(thermistorVoltage);
  measuredShortCurrent = getShortCurrent();   
  irradiance = refIrradiance * measuredShortCurrent / referenceShortCurrent * (1 - tempCoefficient * (thermistorTemp - refThermTemp));
                                                                                                                    
  irradiance = round(irradiance * factorRound) / factorRound;                                                      
  return irradiance;
}

//reads the analog input from the thermistor, and returns the temperature in Celsius
double getThermistorTemp(double thermistorVoltage) {
  int voltDivResistor = 10000;                                                                                     
  double thermB = 3428;                                                                                           
  int refTemp = 25;                                                                                              
  double thermValue;
  double thermResistance;
  double temp;
  const double kelvinConversion = 273.15;

  thermResistance = (supplyVoltage - thermistorVoltage) / (thermistorVoltage / voltDivResistor);
  temp = thermB * (refTemp + kelvinConversion) / (log(thermResistance / voltDivResistor) * (refTemp + kelvinConversion) + thermB) - kelvinConversion;
  temp = round(temp * factorRound) / factorRound;                                                                      
  return temp;
}

//reads the analog input from the TMP36 analog sensor, and returns the temperature in Celsius
double getAmbientTemp() {
  double analogTempValue = analogRead(AMBIENT_OUTPUT);
  return ((analogTempValue * supplyVoltage / adcLevel) / .03 - 50);                                                               //this is the temperature equation for the TMP36 sensor
}

//gets the voltage reading from the thermistor
double getThermistorVoltage() {
  return analogRead(THERMISTOR_INPUT) * supplyVoltage / adcLevel;
}

//gets the short circuit current reading from the reference cell
double getShortCurrent() {
  const double shuntResistance = 0.08;
  const double gain = 500.0;

  total -= values[arrIndex];
  double cellVoltage = analogRead(REFERENCE_CELL_OUTPUT) * supplyVoltage / adcLevel;                                        //reads analog reading and converts ADC value to voltage using max volts and the 12-bit value
  values[arrIndex] = cellVoltage;
  total += cellVoltage;
  arrIndex++;
  if (arrIndex >= numValues) {
      arrIndex = 0;
  }
  
  copy(begin(values), end(values), begin(sortedValues));
  sort(begin(sortedValues), end(sortedValues));                                                                                 //the built in sort from  <algorithm> is O(n * log n) complexity, and sorts from the beginning of the array to the end
  
  return ((sortedValues[medianLocation] / gain) / shuntResistance);
}

//finds the max irradiance and angle associated with that irradiance when rotating the instrument about the x-axis for 5 seconds
void findMax() {
    display.println("Please rotate Icarus around its X-axis in 5...");
    display.display();
    delay(4000);
    display.clearDisplay();
    
    for (int i = 4; i > 0; i--) {
        display.println("" + String(i) + "...");
        display.display();
        delay(1000);
        display.clearDisplay();
    }
    display.println("Calculating...");
    display.display();
    display.clearDisplay();
    
    for (int i = 0; i < 10; i++) {
        irradiance = getIrradiance();
        theta = accel.x / adcRange * degreeRange;                                                                       //scales the ADC value read from accelerometer to an angle measurement in positive
        
        irradiance = round(irradiance * factorRound) / factorRound;                                                                       //rounds the degrees to the nearest tenth
        theta = round(theta * factorRound) / factorRound;
        
        if (irradiance > maxIrradiance) {                                                                               //compares the values read with the current, and saves as new max and angle if the values are greate
            maxIrradiance = irradiance;
            maxAngle = theta;
        }
        
        delay(250);
    }
    
    display.println("Max: " + String(maxIrradiance, 0));
    display.println("Angle: " + String(maxAngle, 0) + (char)247);
    display.display();
    delay(10000);
    display.clearDisplay();
    screen = MAIN;
    setScreen();
}

//compares the string parameter passed in, and depending on the value will set the boolean flags to correspond with the button pressed
void setScreen() {
    bool mainScreen = false;
    bool tempScreen = false;
    bool maxScreen = false;
    
    if (0 == digitalRead(MAIN_BUTTON)) {
        screen = MAIN;
    }
    else if (0 == digitalRead(TEMPERATURE_BUTTON)) {
        screen = TEMPERATURE;
    }
    else if (0 == digitalRead(MAX_BUTTON)) {
        screen = MAX;
    }
    //if screen is MAIN (1), display's main screen info; if TEMP(2), temperature info
    switch (screen) {                                      
        case MAIN:
            mainScreen = true;
            display.println("Angle: " + String(theta, 0) + (char)247);                                                           
            display.println();
            display.println(String(irradiance, 0) + "  W/m^2");
            break;
        case TEMPERATURE:
            tempScreen = true;
            display.println("Temp: " + String(ambientTemp, 0) + " " + (char)247 + "C");
            display.println();
            display.println("Therm: " + String(thermistorTemp, 0) + " " + (char)247 + "C");
            break;
        case MAX:
            maxScreen = true;
            findMax();
            break;
    }
}