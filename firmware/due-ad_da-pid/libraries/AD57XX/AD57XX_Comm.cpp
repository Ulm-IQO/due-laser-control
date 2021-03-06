/***************************************************************************//**
 *   @file   Communication.c
 *   @brief  Implementation of Communication Driver.
 *   @author DBogdan (dragos.bogdan@analog.com)
********************************************************************************
 * Copyright 2012(c) Analog Devices, Inc.
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *  - Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  - Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *  - Neither the name of Analog Devices, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *  - The use of this software may or may not infringe the patent rights
 *    of one or more patent holders.  This license does not release you
 *    from the requirement that you obtain separate licenses from these
 *    patent holders to use this software.
 *  - Use of the software either in source or binary form, must be run
 *    on or directly connected to an Analog Devices Inc. component.
 *
 * THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT,
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, INTELLECTUAL PROPERTY RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
********************************************************************************
 *   SVN Revision: 812
*******************************************************************************/

/******************************************************************************/
/* Include Files                                                              */
/******************************************************************************/
#include <SPI.h>
#include <stdint.h>
#include "AD57XX_Comm.h"

SPISettings AD57XX_spisettings;
/***************************************************************************//**
 * @brief Initializes the SPI communication peripheral.
 *
 * @param lsbFirst - Transfer format (0 or 1).
 *                   Example: 0x0 - MSB first.
 *                            0x1 - LSB first.
 * @param clockFreq - SPI clock frequency (Hz).
 *                    Example: 1000 - SPI clock frequency is 1 kHz.
 * @param clockPol - SPI clock polarity (0 or 1).
 *                   Example: 0x0 - Idle state for clock is a low level; active
 *                                  state is a high level;
 *	                      0x1 - Idle state for clock is a high level; active
 *                                  state is a low level.
 * @param clockEdg - SPI clock edge (0 or 1).
 *                   Example: 0x0 - Serial output data changes on transition
 *                                  from idle clock state to active clock state;
 *                            0x1 - Serial output data changes on transition
 *                                  from active clock state to idle clock state.
 *
 * @return status - Result of the initialization procedure.
 *                  Example: 1 - if initialization was successful;
 *                           0 - if initialization was unsuccessful.
*******************************************************************************/
uint8_t AD57XX_COMM_Init(uint8_t lsbFirst,
                       uint32_t clockFreq,
                       uint8_t clockPol,
                       uint8_t clockEdg)
{
    // Add your code here.
    SPI.begin();
    AD57XX_spisettings = SPISettings(
        clockFreq,
        lsbFirst ? LSBFIRST : MSBFIRST,
        clockPol ? ( clockEdg ? SPI_MODE1 : SPI_MODE0) : (clockEdg ? SPI_MODE3 : SPI_MODE2)
        );
   // SPI.beginTransaction(AD57XX_spisettings);

    Serial.print("SPI: ");
    Serial.print(clockFreq);
    Serial.print(" ");
    Serial.print(lsbFirst ? LSBFIRST : MSBFIRST);
    Serial.print(" ");
    Serial.println(clockPol ? ( clockEdg ? SPI_MODE1 : SPI_MODE0) : (clockEdg ? SPI_MODE3 : SPI_MODE2));
    return 1;
}

/***************************************************************************//**
 * @brief Reads data from SPI.
 *
 * @param slaveDeviceId - The ID of the selected slave device.
 * @param data - Data represents the write buffer as an input parameter and the
 *               read buffer as an output parameter.
 * @param bytesNumber - Number of bytes to read.
 *
 * @return Number of read bytes.
*******************************************************************************/
uint8_t AD57XX_Read(uint8_t slaveDeviceId,
                       uint8_t* data,
                       uint8_t bytesNumber)
{
    // Add your code here.
    digitalWrite(AD57XX_SYNC_PIN, LOW);
    SPI.beginTransaction(AD57XX_spisettings);
    for (uint8_t i = 0; i < bytesNumber; ++i){
        data[i] = SPI.transfer(data[i]);
    }
    digitalWrite(AD57XX_SYNC_PIN, HIGH);
    SPI.endTransaction();
    return bytesNumber;
}

/***************************************************************************//**
 * @brief Writes data to SPI.
 *
 * @param slaveDeviceId - The ID of the selected slave device.
 * @param data - Data represents the write buffer.
 * @param bytesNumber - Number of bytes to write.
 *
 * @return Number of written bytes.
*******************************************************************************/
uint8_t AD57XX_Write(uint8_t slaveDeviceId,
                        uint8_t* data,
                        uint8_t bytesNumber)
{
    // Add your code here.
    digitalWrite(AD57XX_SYNC_PIN, LOW);
    SPI.beginTransaction(AD57XX_spisettings);
    for (uint8_t i = 0; i < bytesNumber; ++i){
        data[i] = SPI.transfer(data[i]);
    }
    digitalWrite(AD57XX_SYNC_PIN, HIGH);
    SPI.endTransaction();
    return bytesNumber;
}
