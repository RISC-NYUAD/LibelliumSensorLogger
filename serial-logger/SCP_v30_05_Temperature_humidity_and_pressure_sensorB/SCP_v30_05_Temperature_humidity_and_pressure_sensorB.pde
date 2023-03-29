/*
    -------  [SCP_v30_05] - Temperature, humidity and pressure sensor  ---------

    Explanation: This is the basic code to manage and read the temperature,
    humidity and pressure sensor.  Cycle time: 3 minutes

    Copyright (C) 2017 Libelium Comunicaciones Distribuidas S.L.
    http://www.libelium.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    Version:           3.2
    Design:            David Gascón
    Implementation:    Alejandro Gállego
*/

#include <WaspSensorCities_PRO.h>
#include <WaspSensorAmbient.h>

uint32_t digitalLuxes; 
float analogLDRvoltage;
/*
   Waspmote OEM. Possibilities for this sensor:
    - SOCKET_1
    - SOCKET_2
    - SOCKET_3
    - SOCKET_4
    - SOCKET_5
   P&S! Possibilities for this sensor:
    - SOCKET_A
    - SOCKET_B
    - SOCKET_C
    - SOCKET_E
    - SOCKET_F
*/
bmeCitiesSensor  bme(SOCKET_A);

float temperature;	// Stores the temperature in ºC
float humidity;		// Stores the realitve humidity in %RH
float pressure;		// Stores the pressure in Pa


void setup()
{
   USB.ON();
  USB.println(F("Temperature, Humidity, Pressure, Luminosity, Luxes"));
}


void loop()
{
  ///////////////////////////////////////////
  // 1. Turn on the sensor
  ///////////////////////////////////////////

  bme.ON();


  ///////////////////////////////////////////
  // 2. Read sensors
  ///////////////////////////////////////////

  temperature = bme.getTemperature();
  humidity = bme.getHumidity();
  pressure = bme.getPressure();
  digitalLuxes = SensorAmbient.getLuxes(OUTDOOR);
  analogLDRvoltage = SensorAmbient.getLuminosity();

  // And print the values via USB
  USB.printFloat(temperature, 2);
  USB.print(F(","));
  USB.printFloat(humidity, 2);
  USB.print(F(","));
  USB.printFloat(pressure, 2);
  //USB.println(humidity); 
  USB.print(F(","));
  USB.printFloat(analogLDRvoltage,2);
  USB.print(F(","));
  USB.println(digitalLuxes);
  
  //char number[2];
  //Utils.float2String(pressure, number, 3);
  //USB.print((number + ","));


  ///////////////////////////////////////////
  // 3. Turn off the sensor
  ///////////////////////////////////////////

  bme.OFF();


  ///////////////////////////////////////////
  // 4. Sleep
  ///////////////////////////////////////////

  // Go to deepsleep
  // After 10 seconds, Waspmote wakes up thanks to the RTC Alarm
  //USB.println(F("Go to deep sleep mode..."));
  PWR.deepSleep("00:00:00:01", RTC_OFFSET, RTC_ALM1_MODE1, ALL_OFF);
  //USB.println(F("\r\n"));

}


