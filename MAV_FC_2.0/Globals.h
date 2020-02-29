
#include "PinAssignments.h"
#define SERVO_ZERO 90


const int num_channels = USED_CHANNELS;
int channel_data[num_channels];
int pins[num_channels] = {15, 14, 9, 10};    // Check what pin to use
byte escA = ESCA_PIN;                              // change this
byte escB = 3;                              //change this
byte servoA = 4;
byte servoB = 5;
int throttle = 55;
int throttle_step = 0;
int throttleA = 0;
int throttleB = 0;
int rot = 0;
int yaw_scale = 64; //128;

//servo stuff
Servo servoL;
Servo servoR;
