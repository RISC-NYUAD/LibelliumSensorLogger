# LibelliumSensorLogger
Libellium Sensors Logger in Python

Requirement installation (pyserial):
> pip install pyserial

Run the logger after connect Libellium to the PC USB port
> cd serial-logger
> python serial_logger.py -d /dev/ttyUSB0 -s 115200
(or > python3 serial_logger.py -d /dev/ttyUSB0 -s 115200)

The data (Temperature, Humidity, Pressure, Luminosity, Luxes) is logged in the created .bin file inside the "serial-logger" folder

The file "SCP_v30_05_Temperature_humidity_and_pressure_sensorB.pde" is the code uploaded to the Libellium to produce the specific sensor readings output in the serial port.

