#include "boardsetup.h"

uint8_t due_board[][2] = {
//    {0, INPUT},
//    {1, OUTPUT},
    {2, OUTPUT},
    {3, OUTPUT},
    {4, OUTPUT},
    {5, OUTPUT},
    {6, OUTPUT},
    {7, OUTPUT},
    {8, OUTPUT},
    {9, OUTPUT},
    {10, OUTPUT},
    {11, OUTPUT},
    {12, OUTPUT},
    {13, OUTPUT},
    {14, OUTPUT},
    {15, INPUT},
    {16, OUTPUT},
    {17, INPUT},
    {18, OUTPUT},
    {19, INPUT},
    {20, OUTPUT},
    {21, OUTPUT},
    {22, OUTPUT},
    {23, OUTPUT},
    {24, OUTPUT},
    {25, INPUT},
    {26, INPUT},
    {27, INPUT},
    {28, INPUT},
    {29, INPUT},
    {30, INPUT},
    {31, INPUT},
    {32, INPUT},
    {33, INPUT},
    {34, INPUT},
    {35, INPUT},
    {36, INPUT},
    {37, OUTPUT},
    {38, OUTPUT},
    {39, OUTPUT},
    {40, OUTPUT},
    {41, OUTPUT},
    {42, OUTPUT},
    {43, OUTPUT},
    {44, OUTPUT},
    {45, OUTPUT},
    {46, OUTPUT},
    {47, OUTPUT},
    {48, OUTPUT},
    {49, OUTPUT},
    {50, OUTPUT},
    {51, OUTPUT},
    {52, OUTPUT},
    {53, OUTPUT},
    {A0, INPUT},
    {A1, INPUT},
    {A2, INPUT},
    {A3, OUTPUT},
    {A4, OUTPUT},
    {A5, OUTPUT},
    {A6, OUTPUT},
    {A7, OUTPUT},
    {A8, OUTPUT},
    {A9, OUTPUT},
    {A10, OUTPUT},
    {A11, OUTPUT},
    {DAC0, OUTPUT},
    {DAC1, OUTPUT},
//    {CANRX, INPUT},
//   {CANTX, OUTPUT}
};

void pinsetup_due_levelconverter(uint8_t boardstate[][2]) {
    for(uint8_t i=0; i<66; ++i){
        pinMode(boardstate[i][0], boardstate[i][0]);
        //Serial.print("Pin ");
        //Serial.print(boardstate[i][0]);
        //Serial.print(" set to ");
        //Serial.println(boardstate[i][1]);
        //delay(100);
    }
    
}
