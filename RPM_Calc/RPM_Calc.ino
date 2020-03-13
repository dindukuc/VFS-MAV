
#define CPR 250
#define MAGNITUDE 1000;
double interval_time_us = 1000000;
double enc_count = 0;
double current_rpm = 0;

int enc_pin = 23;

IntervalTimer rpmTimer;

void pulse_count(){
  enc_count++;
}

void calc_rpm(){
  //double ms = 1000;          //evaluate rpm every ms
  double ms = interval_time_us/MAGNITUDE;          //evaluate rpm every ms
  double rot = (enc_count/CPR);
  current_rpm = (rot*60000)/ms;
  Serial.print("Encoder count: ");
  Serial.println(enc_count);
  Serial.print("Current rpm: ");
  Serial.println(current_rpm);
  enc_count = 0;
}

void setup() {
  // put your setup code here, to run once:
  attachInterrupt(digitalPinToInterrupt(enc_pin), pulse_count, RISING);
  rpmTimer.begin(calc_rpm, interval_time_us);
}

void loop() {
  // put your main code here, to run repeatedly:
}
