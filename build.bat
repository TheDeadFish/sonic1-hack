@echo off

IF EXIST s1built.bin move /Y s1built.bin s1built.prev.bin >NUL
set A68K_OPTS= /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+
asm68k /k /p /o ae- %OPTS% sonic.asm, s1built.bin >errors.txt, , sonic.lst
fixheadr.exe s1built.bin
