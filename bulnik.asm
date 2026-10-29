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
   .stringmap symbols,"______________________{LF}Ш__Ш{CR}"
   .stringmap symbols,"{LF}____________________ШШШШШШШШ{CR}"
   .stringmap symbols,"{LF}____________________Ш______Ш{CR}"
   .stringmap symbols,"{LF}____________________ШШШШШШШШ{CR}"
   .stringmap symbols,"{LF}__________________ШШ________ШШ"
   .stringmap symbols,"{LF}<<<<<<<<<<<<<<<ШШШ____________ШШШ{LF}<<<<<<<<<<<<<<<<<<<<<"
   .stringmap symbols,"<<<<<<<<ШШШШ_____ШШ__________________ШШ<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>_____ШШШШ__________{CR}{CR}"
   .stringmap symbols,"_{LF}___Ш__Ш___ШШШ____________________ШШШ___Ш__Ш__________{CR}"
   .stringmap symbols,"{LF}_____Ш__Ш__ШШ___ООО_________ООО____ШШ__Ш__Ш___________{CR}{CR}"
   .stringmap symbols,"{LF}_____Ш__Ш__Ш____ООО_________ООО_____Ш__Ш__Ш_____________{CR}"
   .stringmap symbols,"{LF}______Ш__Ш_ШШ____О___________О_____ШШ_Ш__Ш______________{CR}{CR}"
   .stringmap symbols,"_{LF}_____ШШ__ШШШШ______ШШШШШШШ_______ШШШШ__ШШ____________{CR}"
   .stringmap symbols,"{LF}_______ШШШШШШШШ____ШШШ___ШШШ_____ШШШШШШШШ_____________{CR}"
   .stringmap symbols,"{LF}_____________ШШШ________________ШШШ_____________________{CR}"
   .stringmap symbols,"{LF}_______________ШШШ___ООООО____ШШШ_____________________{CR}"
   .stringmap symbols,"{LF}________________ШШШ___ООО____ШШШ______________________{CR}"
   .stringmap symbols,"{LF}__________________ШШ___О____ШШ{CR}"
   .stringmap symbols,"{LF}____________________ШШ____ШШ{LF}"
   .stringmap symbols,                  "<<<<<<<ШШШШШШ__________________________{CR}"
   .stringmap symbols,"{LF}ХХХХХХХХХХХХХХХХХХХХ________ХХХХХХХХХХХХХХХХХ!!!!!!!!{LF}{LF}<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<_______________________."

; Zeroes to 0x04ff
   .dsb 183, 0

;           00 00 - Junk bytes, may be absant
_JUNC_BYTES:
   .byte 0x00, 0x00
;           0xE6  - Syncronization byte
_SYNCRO:
   .byte 0xe6
;           XX XX - Check summ, High byte First
_CHECKSUM:
   .byte 0xc6, 0x03
