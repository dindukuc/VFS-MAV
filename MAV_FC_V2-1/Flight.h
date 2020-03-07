

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

  #ifdef DEBUG
  Serial.println((String)"Throttle throttleA: " + throttleA);
  Serial.println((String)"Throttle throttleB: " + throttleB);
  #endif

  //data = 170;
  analogWrite(escA,throttleA);
  analogWrite(escB,throttleB);
}

void updateServos(){
  int servoValL;
  int servoValR;
  int turn;
  

  turn = (channel_data[1] - 512)/turn_scale;

  servoValL = channel_data[2]; //forward and back channel
  servoValR = channel_data[2]; //forward and back channel

  #ifdef DEBUG
  Serial.println((String)"Channel Data: " + channel_data[1]); //prints the turn data
  Serial.println((String)"Turn value: " + turn); //prints the turn data
  #endif

  //this returns it in terms of an angle from 0 to 180
  servoValL = map(servoValL, 0, 1024, max_servo_val, min_servo_val); //used to be:  servoValL = (servoValL*180)/1024; changed to make left and right turn correctly
  servoValR = map(servoValR, 0, 1024, min_servo_val, max_servo_val);//(servoValR*180)/1024; //used to be:  servoValR = 180 - (servoValR*180)/1024; changed to make left and right turn correctly

  servoValL -= turn;
  servoValR -= turn;

  #ifdef DEBUG
  Serial.println((String)"Servo Data L: " + servoValL);
  Serial.println((String)"Servo Data R: " + servoValR);
  #endif

  servoL.write(servoValL);
  servoR.write(servoValR);
}

/*
void updateServos_v2(){
  int servoValL;
  int servoValR;
  int turn;
  

  turn = (channel_data[1] - 512)/turn_scale;

  servoValL = channel_data[2]; //forward and back channel
  servoValR = channel_data[2]; //forward and back channel

  #ifdef DEBUG
  Serial.println((String)"Channel Data: " + channel_data[1]); //prints the turn data
  Serial.println((String)"Turn value: " + turn); //prints the turn data
  #endif

  //for 10 bits at 50hz:
  //0.5ms pulse = 26
  //2.5ms pulse = 128
  //for 11 bits at 50hz:
  //0.5ms pulse = 52
  //2.5ms pulse = 204
  //for 12 bits at 50hz:
  //0.5ms pulse = 104
  //2.5ms pulse = 512
  max_servo_val = 128;
  min_servo_val = 26
  //this returns it in terms of an angle from 0 to 180
  servoValL = map(servoValL, 0, 1023, max_servo_val, min_servo_val); //used to be:  servoValL = (servoValL*180)/1024; changed to make left and right turn correctly
  servoValR = map(servoValR, 0, 1023, max_servo_val, min_servo_val);//(servoValR*180)/1024; //used to be:  servoValR = 180 - (servoValR*180)/1024; changed to make left and right turn correctly

  servoValL += turn;
  servoValR -= turn;

  #ifdef DEBUG
  Serial.println((String)"Servo Data L: " + servoValL);
  Serial.println((String)"Servo Data R: " + servoValR);
  #endif

  servoL.write(servoValL);
  servoR.write(servoValR);
}*/

void killSwitchLoop(){
  while(channel_data[4] < 512){
  #ifdef DEBUG
    Serial.println("MAV IS DEAD");
  #endif
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
}

