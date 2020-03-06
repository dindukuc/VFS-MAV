
#include "PinAssignments.h"
#define SERVO_ZERO 90


const int num_channels = USED_CHANNELS;
int channel_data[num_channels];
int pins[8] = {CH1_PIN, CH2_PIN, CH3_PIN, CH4_PIN, CH5_PIN, CH6_PIN, CH7_PIN, CH8_PIN};    // Check what pin to use
byte escA = ESCA_PIN;                              // change this
byte escB = ESCB_PIN;                           //change this
byte servoA = 4;
byte servoB = 5;
int throttle = 55;
int throttle_step = 0;
int throttleA = 0;
int throttleB = 0;
int rot = 0;
int yaw_scale = 64; //128;
byte max_offset = 2;
int min_throttle = 550;
int max_throttle = 1000;
byte debugLEDstate = 0;

//servo stuff
Servo servoL;
Servo servoR;
int max_servo_val = 105;
int min_servo_val = 75;
int turn_scale = 64;
