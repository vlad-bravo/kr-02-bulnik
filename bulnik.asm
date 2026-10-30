.include "memorymap.inc"

.stringmaptable symbols "symbols.tbl"

.BANK 0 SLOT 0
.ORGA 0x00FB

;           0xE6  - Syncronization byte
   .byte 0xe6
;           XX XX - Start address of memory allocation, High byte First
   .byte hibyte(ENTRY_POINT)
   .byte lobyte(ENTRY_POINT)
;           XX XX - End address of memory allocation, High byte First
   .byte hibyte(_JUNC_BYTES-ENTRY_POINT)
   .byte lobyte(_JUNC_BYTES-1)

ENTRY_POINT:
   lxi h,@MSG     ; #0100 21 09 01
   call $f818     ; #0103 cd 18 f8
   hlt            ; #0106 76      
   nop            ; #0107 00      
   nop            ; #0108 00      

@MSG:
   .stringmap symbols,"{CLS}______________________ШШШШ{CR}"
   .stringmap symbols,"______________________{DOWN}Ш__Ш{CR}"
   .stringmap symbols,"{DOWN}____________________ШШШШШШШШ{CR}"
   .stringmap symbols,"{DOWN}____________________Ш______Ш{CR}"
   .stringmap symbols,"{DOWN}____________________ШШШШШШШШ{CR}"
   .stringmap symbols,"{DOWN}__________________ШШ________ШШ"
   .stringmap symbols,"{DOWN}<<<<<<<<<<<<<<<ШШШ____________ШШШ{DOWN}<<<<<<<<<<<<<<<<<<<<<"
   .stringmap symbols,"<<<<<<<<ШШШШ_____ШШ__________________ШШ<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>_____ШШШШ__________{CR}{CR}"
   .stringmap symbols,"_{DOWN}___Ш__Ш___ШШШ____________________ШШШ___Ш__Ш__________{CR}"
   .stringmap symbols,"{DOWN}_____Ш__Ш__ШШ___ООО_________ООО____ШШ__Ш__Ш___________{CR}{CR}"
   .stringmap symbols,"{DOWN}_____Ш__Ш__Ш____ООО_________ООО_____Ш__Ш__Ш_____________{CR}"
   .stringmap symbols,"{DOWN}______Ш__Ш_ШШ____О___________О_____ШШ_Ш__Ш______________{CR}{CR}"
   .stringmap symbols,"_{DOWN}_____ШШ__ШШШШ______ШШШШШШШ_______ШШШШ__ШШ____________{CR}"
   .stringmap symbols,"{DOWN}_______ШШШШШШШШ____ШШШ___ШШШ_____ШШШШШШШШ_____________{CR}"
   .stringmap symbols,"{DOWN}_____________ШШШ________________ШШШ_____________________{CR}"
   .stringmap symbols,"{DOWN}_______________ШШШ___ООООО____ШШШ_____________________{CR}"
   .stringmap symbols,"{DOWN}________________ШШШ___ООО____ШШШ______________________{CR}"
   .stringmap symbols,"{DOWN}__________________ШШ___О____ШШ{CR}"
   .stringmap symbols,"{DOWN}____________________ШШ____ШШ{DOWN}"
   .stringmap symbols,                  "<<<<<<<ШШШШШШ__________________________{CR}"
   .stringmap symbols,"{DOWN}ХХХХХХХХХХХХХХХХХХХХ________ХХХХХХХХХХХХХХХХХ!!!!!!!!"
   .stringmap symbols,"{DOWN}{DOWN}"
   .stringmap symbols,"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<_______________________."

; Zeroes to 0x04ff
   .dsb 183, 0

;           00 00 - Junk bytes, may be absent
_JUNC_BYTES:
   .byte 0x00, 0x00
;           0xE6  - Syncronization byte
_SYNCRO:
   .byte 0xe6
;           XX XX - Check summ, High byte First
_CHECKSUM:
   .byte 0xc6, 0x03
