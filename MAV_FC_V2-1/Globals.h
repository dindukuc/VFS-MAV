//******************************************************************//
// Globals.h
// All global variables used in MAV firmware.
// Pin assignments are initialized in this file and defined
// in PinAssignments.h
//******************************************************************//

#include "PinAssignments.h"
#define SERVO_ZERO 90
#define OFFSET_PITCH .11
#define ALPHA .75

//Hardware connections
const int num_channels = USED_CHANNELS;
int channel_data[num_channels];
const int pins[8] = {CH1_PIN, CH2_PIN, CH3_PIN, CH4_PIN, CH5_PIN, CH6_PIN, CH7_PIN, CH8_PIN}; 
const byte escA = ESCA_PIN;                           
const byte escB = ESCB_PIN;                           
const byte servoA = SERVOA_PIN;
const byte servoB = SERVOB_PIN;
byte debugLEDstate = 0;

//Motor power variables
int throttle = 55;
int throttle_step = 0;
int throttleA = 0;
int throttleB = 0;
int rot = 0;
const int yaw_scale = 64; //128;
const byte max_offset = 2;
const int min_throttle = 550;
const int max_throttle = 1000;

//Servo variables
Servo servoL;
Servo servoR;
const int max_servo_val = 105;
const int min_servo_val = 75;
const int turn_scale = 64;
int servoValL = 0;
int servoValR = 0;

//Pitch and roll variables
double prev_roll = -255;
double prev_pitch = -255;
const int max_pitch = 10;
const int min_pitch = -10;
const int max_roll = 10;
const int min_roll = -10;

//PID variables and objects
double setpoint_pitch, input_pitch, output_pitch;
double kp_pitch=2, ki_pitch=0.1, kd_pitch=0.25; //tuning values to change here

PID stable_pitch(&input_pitch, &output_pitch, &setpoint_pitch, kp_pitch, ki_pitch, kd_pitch, DIRECT); //pitch pid loop


double setpoint_roll, input_roll, output_roll;
double kp_roll=8, ki_roll=0.1, kd_roll=0.25; //tuning values to change here

PID stable_roll(&input_roll, &output_roll, &setpoint_roll, kp_roll, ki_roll, kd_roll, DIRECT); //roll pid loop

/* This driver reads raw data from the BNO055

   Connections
   ===========
   Connect SCL to analog 5
   Connect SDA to analog 4
   Connect VDD to 3.3V DC
   Connect GROUND to common ground

*/

/* Set the delay between fresh samples */
#define BNO055_SAMPLERATE_DELAY_MS (50)

// Check I2C device address and correct line below (by default address is 0x29 or 0x28)
//                                   id, address
Adafruit_BNO055 bno = Adafruit_BNO055(-1, 0x28);
