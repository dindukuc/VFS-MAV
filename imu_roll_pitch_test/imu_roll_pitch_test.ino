#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>
#include <math.h>
#include <PID_v1.h>
#include <Servo.h>

#define OFFSET_PITCH .11
#define ALPHA .75

double prev_roll = -255;
double prev_pitch = -255;

int servoValL = 0;
int servoValR = 0;

//PID stuff
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


//servo stuff
Servo servoL;
Servo servoR;


/**************************************************************************/
/*
    Arduino setup function (automatically called at startup)
*/
/**************************************************************************/
void setup(void)
{
  Serial.begin(115200);
  Serial.println("Orientation Sensor Raw Data Test"); Serial.println("");

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

  Serial.println("Calibration status values: 0=uncalibrated, 3=fully calibrated");

  servoL.attach(4);
  servoR.attach(5);
  
  servoL.write(90);
  servoR.write(90);


  input_pitch = 0;
  setpoint_pitch = 0;

  //stable_pitch.SetSampleTime(40);

  stable_pitch.SetOutputLimits(-90, 90);
  stable_pitch.SetSampleTime(50);
  stable_pitch.SetMode(AUTOMATIC);

  stable_roll.SetOutputLimits(-180, 180);
  stable_roll.SetSampleTime(50);
  stable_roll.SetMode(AUTOMATIC);

  
}

/**************************************************************************/
/*
    Arduino loop function, called once 'setup' is complete (your own code
    should go here)
*/
/**************************************************************************/
void loop(void){
  double temp = 0;
  // Possible vector values can be:
  // - VECTOR_ACCELEROMETER - m/s^2
  // - VECTOR_MAGNETOMETER  - uT
  // - VECTOR_GYROSCOPE     - rad/s
  // - VECTOR_EULER         - degrees
  // - VECTOR_LINEARACCEL   - m/s^2
  // - VECTOR_GRAVITY       - m/s^2
  //imu::Vector<3> euler = bno.getVector(Adafruit_BNO055::VECTOR_EULER);
  //imu::Vector<3> mag = bno.getVector(Adafruit_BNO055::VECTOR_MAGNETOMETER);
  //imu::Vector<3> gyro = bno.getVector(Adafruit_BNO055::VECTOR_GYROSCOPE);
  
  stable_pitch.Compute();
  stable_roll.Compute();
  
  imu::Vector<3> grav = bno.getVector(Adafruit_BNO055::VECTOR_GRAVITY);

  
  double roll = 0;
  double pitch = 0;


  Serial.print("grav: ");
  Serial.print("X: ");
  Serial.print(grav.x());
  Serial.print(" Y: ");
  Serial.print(grav.y());
  Serial.print(" Z: ");
  Serial.println(grav.z());
  Serial.println("\t\t");

  pitch = calc_pitch(grav.x(), grav.y(), grav.z());
  roll = calc_roll(grav.x(), -(grav.z()));

  pitch = filter_val(pitch, prev_pitch, ALPHA);
  roll = filter_val(roll, prev_roll, ALPHA);

  Serial.print("Pitch value: ");
  Serial.print(pitch);

  Serial.print("  Roll value: ");
  Serial.println(roll);

  temp = zero_pitch(pitch);
  temp = conv_rads_to_degs( temp );
  input_pitch = temp;
//  Serial.print("input_PID_pitch: ");
//  Serial.println(input_pitch);

  
  
  write_pitch( output_pitch );
  Serial.print("output_PID_pitch: ");
  Serial.println(output_pitch);


  temp = conv_rads_to_degs( roll );
  input_roll = temp;
//  Serial.print("input_PID_roll: ");
//  Serial.println(input_roll);

  write_roll( output_roll );
  Serial.print("output_PID_roll: ");
  Serial.println(output_roll);


  servoL.write(servoValL);
  servoR.write(servoValR);
  Serial.println((String)"Servo Data L: " + servoValL);
  Serial.println((String)"Servo Data R: " + servoValR);

  delay(BNO055_SAMPLERATE_DELAY_MS);
}




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
  
  servoValL = map(pitch, -90, 90, 120, 60);
  servoValR = map(pitch, -90, 90, 120, 60);
  
}

double zero_pitch(double val){
  val += OFFSET_PITCH;

  if((val > -.02) && (val < .02)){
    val = 0;
  }

  return val;
}

void write_roll(double roll){
  double temp = map(roll, -180, 180, 0, 8);
  
  
  servoValL += temp;
  servoValR -= temp;
}
