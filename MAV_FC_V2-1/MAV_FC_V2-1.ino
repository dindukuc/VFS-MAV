//******************************************************************//
// MAV_FC V2-1
// 2020 OSUAIAA MAV Flight Control Firmware
// Firmware intended to control flight of a small coaxial helicopter
// Features:
//  -Remote yaw, pitch, and roll control
//  -Kill switch to remotely disable MAV
//  -Auto stabilization for pitch and roll
//
// Written by 2020 VFS MAV Electrical Subteam
//  Authors: Chetan Dindukurthi, Cody McCall, and Matt Guo
// 
// Github: https://github.com/dindukuc/VFS-MAV
//******************************************************************//

#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>
#include <math.h>
#include <PID_v1.h>
#include <Servo.h>

#define DEBUG                   //comment to 1 to not print debug information

#include "Globals.h"            //defines all variables
#include "Initialization.h"     //defines initialization routines
#include "Flight.h"             //defines core flight functions
#include "Stabilization.h"      //defines auto stabilization functions

void setup(){
  // int temp = 0;
  // int duration = 0;
  // int channel = 0;
  Serial.begin(115200);

  initIMU();

  initControlRX();
  
  initServos();
  
  initESCs();

  Serial.println("-Boot Complete-");  
}

 

void loop()
{
  
  while(1){
  controlRXRead();              //store input from remote tx in channel_data[] array

  killSwitchLoop();             //blocks code if kill switch is set

  updateThrottle();             //update esc duty cycle based on left control stick
    
  //updateServos();             //update servo positions based on right control stick

  updateStabilization();        //update servo positions based on IMU PID loop on pitch and roll and right control stick

  delay(DELAY);
  }
}
