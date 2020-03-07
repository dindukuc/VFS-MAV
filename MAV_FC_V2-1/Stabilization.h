
//IMU Stuff
double calc_pitch(double x, double y, double z){
   double denom = pow(x, 2) + pow(z, 2);
   denom = sqrt(denom);

   double pitch = atan2(y, denom);

   return pitch;
}

double calc_roll(double x, double z){
  double numen = -x;

  double roll = atan2(numen, z);

  return roll;

}

double filter_val(double curr, double prev, float alpha){
  float a = 1;
  if(prev != -255){
    a = alpha;
  }
  
  
  double filter_curr = a*curr;
  double filter_prev = (1-a)*prev;
 
  return filter_curr + filter_prev;
}

double conv_rads_to_degs(double val){

  double degs = val * 57296 / 1000;

  return degs;
  
}

double conv_degs_to_rads(double val){

  double rads = val * 1000 / 57296;

  return rads;
  
}

void write_pitch(double pitch){
  
  servoValL = map(pitch, min_pitch, max_pitch, max_servo_val, min_servo_val);
  servoValR = map(pitch, min_pitch, max_pitch, min_servo_val, max_servo_val);
  
}

double zero_pitch(double val){
  val -= init_pitch;

  if((val > -.02) && (val < .02)){
    val = 0;
  }

  return val;
}

double zero_roll(double val){
  val -= init_roll;

  if((val > -.02) && (val < .02)){
    val = 0;
  }

  return val;
  
}

void write_roll(double roll){
  double temp = map(roll, min_roll, max_roll, min_turn, max_turn);
  
  
  servoValL -= temp;
  servoValR -= temp;
}

void set_init_vals(double x, double y, double z){
  init_pitch = calc_pitch(x, y, z);
  init_roll = calc_roll(x, -z);

}




void updateStabilization(){
    double temp = 0;

    setpoint_pitch = map(channel_data[2], 0, 1024, min_pitch, max_pitch);
    setpoint_roll = map(channel_data[1], 0, 1024, min_roll, max_roll);

    #ifdef DEBUG
    Serial.print("Setpoint Pitch value: ");
    Serial.print(setpoint_pitch);

    Serial.print("  Setpoint Roll value: ");
    Serial.println(setpoint_roll);
    #endif
    
    
    
    
    stable_pitch.Compute();
    stable_roll.Compute();



    imu::Vector<3> grav = bno.getVector(Adafruit_BNO055::VECTOR_GRAVITY);

    double roll = 0;
    double pitch = 0;

    #ifdef DEBUG
    Serial.print("grav: ");
    Serial.print("X: ");
    Serial.print(grav.x());
    Serial.print(" Y: ");
    Serial.print(grav.y());
    Serial.print(" Z: ");
    Serial.println(grav.z());
    Serial.println("\t\t");
    #endif

    Serial.print("Pitch value: ");
    Serial.print(init_pitch);

    Serial.print("  Roll value: ");
    Serial.println(init_roll);


    
    pitch = calc_pitch(grav.x(), grav.y(), grav.z());
    roll = calc_roll(grav.x(), -(grav.z()));

    pitch = filter_val(pitch, prev_pitch, ALPHA);
    roll = filter_val(roll, prev_roll, ALPHA);

    #ifdef DEBUG
    Serial.print("Pitch value: ");
    Serial.print(pitch);

    Serial.print("  Roll value: ");
    Serial.println(roll);
    #endif

    temp = zero_pitch(pitch);
    temp = conv_rads_to_degs( temp );
    input_pitch = temp;

    #ifdef DEBUG
    Serial.print("input_PID_pitch: ");
    Serial.println(input_pitch);
    #endif

  
    write_pitch( output_pitch );

    #ifdef DEBUG
    Serial.print("output_PID_pitch: ");
    Serial.println(output_pitch);
    #endif

    temp = zero_roll( roll );
    temp = conv_rads_to_degs( temp );
    input_roll = temp;
    #ifdef DEBUG
    Serial.print("input_PID_roll: ");
    Serial.println(input_roll);
    #endif

    write_roll( output_roll );

    #ifdef DEBUG
    Serial.print("output_PID_roll: ");
    Serial.println(output_roll);
    #endif

    servoL.write(servoValL);
    servoR.write(servoValR);

    #ifdef DEBUG
    Serial.println((String)"Servo Data L: " + servoValL);
    Serial.println((String)"Servo Data R: " + servoValR);
    #endif
}
