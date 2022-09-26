#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sun Sep  5 07:37:35 2021

@author: ge24yah
"""

import aes
import random


key = 0x000102030405060708090a0b0c0d0e0f
aesmod = aes.AES(key)

# aesmod.PrintLastRoundKey

myfile = open('HW_power_trace.csv', 'w')

for i in range(10000):
    if (i % 100 == 0):
        print(i)
    plaintext = random.randint(0, 2**128-1)
    CT = aesmod.encrypt(plaintext, 0, myfile)
    # print hex(CT)
    myfile.write(str(plaintext)+","+str((CT))+",")
    # myfile.write=(plaintext)

    CT = aesmod.encrypt(plaintext, 1, myfile)
    #myfile = open('HW_power_trace.csv', 'a')
    myfile.write("\n")
    # myfile.close()

myfile.close()
