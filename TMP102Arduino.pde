#include <Wire.h>

int tmp102Address = 0x48;

void setup()
{
	Serial.begin(9600);
	Wire.begin();
}

void loop()
{
  float celsius = getTemperature();
  Serial.println(celsius,4);
  delay(1000); 
}

float getTemperature()
{
  Wire.requestFrom(tmp102Address,2);

  byte MSB = Wire.read();
  byte LSB = Wire.read();

  int TemperatureSum = ((MSB << 8) | LSB) >> 4;

  float celsius = TemperatureSum*0.0625;
  return celsius;
}
