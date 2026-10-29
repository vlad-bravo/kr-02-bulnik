@echo off

del bul_mod.gam 2>nul
del *.o 2>nul

C:\dev\wla_dx_v10.6_Win64\wla-8080.exe -i -o bulnik.o bulnik.asm

C:\dev\wla_dx_v10.6_Win64\wlalink.exe link.cfg bul_mod.gam

del *.o 2>nul

fc /b bul_mod.gam bulnik.gam
