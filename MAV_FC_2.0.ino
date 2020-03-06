// Firmware for 2020 MAV Flight Controller
// includes yaw, pitch, and roll control

#include <Servo.h>

#include "Globals.h"

void initControlRX(){
  for(int i = 0; i < num_channels; i++){
      pinMode(pins[i], INPUT);    //PWM input pins (outlined in pins array from ch 1-8)
    }
}

void initServos(){        // init the two servos
  servoL.attach(servoA);
  servoR.attach(servoB);
  
  servoL.write(SERVO_ZERO);     //move both servos to zero position
  servoR.write(SERVO_ZERO);
}

void initESCs(){
  pinMode(escA, OUTPUT);
  pinMode(escB, OUTPUT);
  analogWriteFrequency(escA, 16000);     //set pin 0 frequency to 16kHz
  analogWriteFrequency(escB, 16000);     //set pin 1 frequency to 16kHz
  analogWriteResolution(10);
  analogWrite(escA, 1024);
  analogWrite(escB, 1024);
  delay(1000);
}

void controlRXRead(){
  int duration; // Duration of the pulse
  int temp;

  for(int i = 1; i < num_channels+1; i++){
      duration = pulseIn(pins[i-1], HIGH);  
       temp = duration - 990;
      
      if(temp < 0){
         temp = 0;
      }
      else if(temp > 1024){
        temp = 1024;
      }
      channel_data[i-1] = temp;
      //Serial.println((String)"Channel " + (i-1) + (String)": " + channel_data[i-1]);
    }
}

void updateThrottle(){
  int offset = 0;
  

  rot = (channel_data[3] - 512)/yaw_scale;
  //Serial.println((String)"Rotation Value " + rot);

  throttleA = map(channel_data[0], 0, 1024, min_throttle, max_throttle) + rot;
  throttleB = map(channel_data[0], 0, 1024, min_throttle, max_throttle) - rot;

  offset = map(throttleB, 550, 1000, 0, max_offset); //should be sort of linearly scaling. Change bounds to macros later
  throttleB += offset;
  //Serial.println((String)"Offset Value " + offset);


  //Serial.println((String)"Throttle throttleA: " + throttleA);
  //Serial.println((String)"Throttle throttleB: " + throttleB);

  //data = 170;
  analogWrite(escA,throttleA);
  analogWrite(escB,throttleB);
}

void updateServos(){
  int servoValL;
  int servoValR;
  int turn;
  int turn_scale = 16;

  turn = (channel_data[1] - 512)/turn_scale;

  servoValL = channel_data[2]; //forward and back channel
  servoValR = channel_data[2]; //forward and back channel

  //Serial.println((String)"Channel Data: " + channel_data[1]); //prints the turn data

  //this returns it in terms of an angle from 0 to 180
  servoValL = map(servoValL, 0, 1024, max_servo_val, min_servo_val); //used to be:  servoValL = (servoValL*180)/1024; changed to make left and right turn correctly
  servoValR = map(servoValR, 0, 1024, min_servo_val, max_servo_val);//(servoValR*180)/1024; //used to be:  servoValR = 180 - (servoValR*180)/1024; changed to make left and right turn correctly

  servoValL -= turn;
  servoValR -= turn;

  //Serial.println((String)"Servo Data L: " + servoValL);
  //Serial.println((String)"Servo Data R: " + servoValR);

  servoL.write(servoValL);
  servoR.write(servoValR);
}

// setup serial and input, output pins
void setup(){
  int temp = 0;
  int duration = 0;
  int channel = 0;
  pinMode(13, OUTPUT);
  Serial.begin(9600);

  initControlRX();
  
  initServos();
  
  initESCs();

  Serial.println("-Boot Complete-");  
}

 

void loop()
{
  
  while(1){
  controlRXRead();    //store input from remote tx in channel_data[] array

  while(channel_data[4] < 512){
    Serial.println("MAV IS DEAD");
    servoL.write(90);
    servoR.write(90);
    analogWrite(escA, min_throttle);
    analogWrite(escB, min_throttle);
    controlRXRead();
    debugLEDstate ^= 1;
    digitalWrite(13, debugLEDstate);
    delay(100);
  }
  if(debugLEDstate == 1){
    debugLEDstate = 0;
    digitalWrite(13, debugLEDstate);
  }

  updateThrottle();   //update esc duty cycle based on left control stick
    
  updateServos();     //update servo positions based on right control stick

  delay(50);          //teensy2fast
  }
}
