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
#include <EEPROM.h>

//#define DEBUG                   //comment to not print debug information

#include "Globals.h"            //defines all variables
#include "Initialization.h"     //defines initialization routines
#include "Flight.h"             //defines core flight functions
#include "Stabilization.h"      //defines auto stabilization functions
#include "Tachometer.h"         //rpm measurement functions

IntervalTimer yawstep;
int test_throttle = 600;

void inc_yaw(){
  if((rot < 20) && (test_state)) 
    rot++;
}

void setup(){
  // int temp = 0;
  // int duration = 0;
  // int channel = 0;
  Serial.begin(115200);
  
  //initIMU();
  delay(600);
//  imu::Vector<3> grav = bno.getVector(Adafruit_BNO055::VECTOR_GRAVITY); 
//  set_init_vals(grav.x(), grav.y(), grav.z());
  
  
  initControlRX();
  
  initServos();
  
  initESCs();

  //attachInterrupt(digitalPinToInterrupt(encA_pin), pulse_countA, RISING);
  //attachInterrupt(digitalPinToInterrupt(encB_pin), pulse_countB, RISING);
  //rpmTimer.begin(calc_rpm, interval_time_us);
  yawstep.begin(inc_yaw, 2000000);

  Serial.println("-Boot Complete-");  
}

 

void loop()
{
  rot = -20;
  int test_state=0;
  while(1){
    controlRXRead();              //store input from remote tx in channel_data[] array

    killSwitchLoop();             //blocks code if kill switch is set

    if(channel_data[0]>=test_throttle){
      if(test_state == 0){
        test_state = 1;
        rot = -20
      }
      analogWrite(escA,test_throttle + rot);
      analogWrite(escB,test_throttle - rot);
    }
    else{
      test_state=0;
      updateThrottle();             //update esc duty cycle based on left control stick
    }
    
    updateServos();             //update servo positions based on right control stick

//  updateStabilization();        //update servo positions based on IMU PID loop on pitch and roll and right control stick

    delay(DELAY);
  }
}
