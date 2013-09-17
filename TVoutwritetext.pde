#include <TVout.h>
#include <fontALL.h>
TVout TV;

void setup() {
  TV.begin(_PAL,128,96);
  TV.clear_screen();
  TV.select_font(font8x8ext);
  TV.print(0,44,"serial text");
  delay(1500);
  TV.clear_screen();
  Serial.begin(115200);
}

void loop() {
  if (Serial.available() > 0) {
    // get incoming byte:
    unsigned char inByte = Serial.read();
    Serial.print(inByte);
    TV.print(inByte);
  }
}
