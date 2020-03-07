

void initControlRX(){
  pinMode(13, OUTPUT);                      //LED Debug Pin
  for(int i = 0; i < num_channels; i++){
      pinMode(pins[i], INPUT);              //PWM input pins (outlined in pins array from ch 1-8)
    }
}

void initServos(){        // init the two servos
  servoL.attach(servoA);
  servoR.attach(servoB);
  
  servoL.write(SERVO_ZERO);     //move both servos to zero position
  servoR.write(SERVO_ZERO);

  /*
  pinMode(servoA, OUTPUT);
  pinMode(servoB, OUTPUT);
  analogWriteFrequency(servoA, 50);     //set pin 0 frequency to 16kHz
  analogWriteFrequency(servoB, 50);     //set pin 1 frequency to 16kHz
  analogWriteResolution(10);
  analogWrite(servoA, 512);
  analogWrite(servoB, 512);
  
  */
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

void initIMU(){
  /* Initialise the sensor */
  if(!bno.begin())
  {
    /* There was a problem detecting the BNO055 ... check your connections */
    Serial.print("Ooops, no BNO055 detected ... Check your wiring or I2C ADDR!");
    while(1);
  }
  delay(1000);
    
  /* Display the current temperature */
  int8_t temp = bno.getTemp();
  Serial.print("Current Temperature: ");
  Serial.print(temp);
  Serial.println(" C");
  Serial.println("");

  bno.setExtCrystalUse(true);

  input_pitch = 0;
  input_roll = 0;

  //stable_pitch.SetSampleTime(40);

  stable_pitch.SetOutputLimits(-90, 90);
  stable_pitch.SetSampleTime(50);
  stable_pitch.SetMode(AUTOMATIC);

  stable_roll.SetOutputLimits(-180, 180);
  stable_roll.SetSampleTime(50);
  stable_roll.SetMode(AUTOMATIC);

}