/*
 * Jeopardy controller interface thats 
 * finds which user has buzzed in first
 * 
 * Usage: Interface waits for a signal from serial to start polling
 * Sends a serial command back indicating which control buzzed in first
 * Message is sent back in ASCII eg ("1\n" if Control 1 buzzed in first)
 */

int player1 = 13;              // Switch connected to digital pin 2
int player2 = 12;
int player3 = 11;
int player4 = 10;
int player5 = 9;

void setup()                    // run once, when the sketch starts
{
  Serial.begin(9600);           // set up Serial library at 9600 bps
  pinMode(player1, INPUT);    // sets the digital pin as input to read switch
  pinMode(player2, INPUT);    // sets the digital pin as input to read switch
  pinMode(player3, INPUT);    // sets the digital pin as input to read switch
  pinMode(player4, INPUT);    // sets the digital pin as input to read switch
  pinMode(player5, INPUT);    // sets the digital pin as input to read switch
}


void loop()                     // run over and over again
{
  // send data only when you receive data:
  int incomingByte = 0;
  while (incomingByte == 0) {
    if(Serial.available() > 0) {
      incomingByte = Serial.read();
    }
  }
  
  int player1Read = 0;  
  int player2Read = 0;
  int player3Read = 0;
  int player4Read = 0;
  int player5Read = 0;
  
  while (player1Read == 0 
    && player2Read == 0 
    && player3Read == 0
    && player4Read == 0
    && player5Read == 0) {
    player1Read = digitalRead(player1);
    player2Read = digitalRead(player2);
    player3Read = digitalRead(player3);
    player4Read = digitalRead(player4);
    player5Read = digitalRead(player5);
    delay(10);      
  }
  
  if (player1Read != 0) {
    Serial.println("1");
  } else if (player2Read != 0) {
    Serial.println("2");
  } else if (player3Read != 0) {
    Serial.println("3");
  } else if (player4Read != 0) {
    Serial.println("4");
  } else if (player5Read != 0) {
    Serial.println("5");
  }

}
