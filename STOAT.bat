@ECHO OFF
REM GREASY-STOAT, A SIMPLE GREASEWEAZEL TERMINAL SCRIPT (c) CARL HOPKINS 2023
REM SEE README FOR MORE INFO.

REM ------------------------------------------------------------------------------
REM STARUP WARNING MESSAGE
ECHO WARNING: THIS SCRIPT IS A WORK IN PROGRESS. PLEASE DO NOT USE BLINDLY WITHOUT REVEWING FIRST!
TIMEOUT 8 > NUL
GOTO MAIN_MENU

REM ------------------------------------------------------------------------------
REM MAIN MENU ROUTINE

:MAIN_MENU
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .    A SIMPLE GREASEWEAZEL TERMINAL SCRIPT      .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 )  BULK ERASE TOOL                         .
ECHO .                                               .
ECHO .  2 )  IBM 1.44 FLOPPY IMAGE TOOL              .
ECHO .                                               .
ECHO .  3 )  IBM 720K FLOPPY IMAGE TOOL              .
ECHO .                                               .
ECHO .  4 )  AMIGA FLOPPY IMAGE TOOL                 .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1234E /M "OPTION: "
GOTO MENU_%ERRORLEVEL%

:MENU_1
REM TIMEOUT 1 > NUL
GOTO ERASE_MENU

:MENU_2
REM TIMEOUT 1 > NUL
GOTO IBM_MENU

:MENU_3
REM TIMEOUT 1 > NUL
GOTO IBMDD_MENU

:MENU_4
REM TIMEOUT 1 > NUL
GOTO AMIGA_MENU

:MENU_5
REM TIMEOUT 1 > NUL
GOTO EXIT_MENU

:MENU_255
CLS
ECHO ERROR......RESTARTING SCRIPT, PLEASE WAIT
TIMEOUT 1 > NUL
GOTO MAIN_MENU

REM ------------------------------------------------------------------------------
REM ERASE TOOL ROUTINE

:ERASE_MENU
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .                BULK ERASE TOOL                .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 ) INSERT FIRST FLOPPY AND ERASE            .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  R )  RETURN TO MAIN MENU                     .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1RE /M "OPTION: "
GOTO ERASE_%ERRORLEVEL%

:ERASE_LOOP
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .                BULK ERASE TOOL                .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 ) INSERT NEXT FLOPPY AND ERASE             .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  R )  RETURN TO MAIN MENU                     .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1RE /M "OPTION: "
GOTO ERASE_%ERRORLEVEL%

:ERASE_1
CLS
gw.exe erase
ECHO +===============================================+
ECHO .  COMPLETE ============ PLEASE EJECT FLOPPY    .
ECHO +===============================================+
TIMEOUT 3 > NUL
GOTO ERASE_LOOP

:ERASE_2
REM TIMEOUT 1 > NUL
GOTO MAIN_MENU

:ERASE_3
REM TIMEOUT 1 > NUL
GOTO EXIT_MENU

:ERASE_255
CLS
ECHO ERROR......RESTARTING SCRIPT, PLEASE WAIT
TIMEOUT 1 > NUL
GOTO MAIN_MENU

REM ------------------------------------------------------------------------------
REM IBM 1.44 TOOL ROUTINE

:IBM_MENU
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .             IBM 1.44 IMAGE TOOL               .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 ) INSERT FIRST FLOPPY TO IMAGE             .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  R )  RETURN TO MAIN MENU                     .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1RE /M "OPTION: "
GOTO IBM_%ERRORLEVEL%

:IBM_LOOP
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .             IBM 1.44 IMAGE TOOL               .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 ) INSERT NEXT FLOPPY TO IMAGE              .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  R )  RETURN TO MAIN MENU                     .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1RE /M "OPTION: "
GOTO IBM_%ERRORLEVEL%

:IBM_1
CLS
REM GET TIME FOR FILENAME
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
SET SUBFILENAME=%CUR_HH%%CUR_NN%

gw.exe read --diskdefs "diskdefs.cfg" --format=ibm.1440 "IBM144_%SUBFILENAME%.img"
ECHO +===============================================+
ECHO .  COMPLETE ============ PLEASE EJECT FLOPPY    .
ECHO +===============================================+
TIMEOUT 3 > NUL
GOTO IBM_LOOP

:IBM_2
REM TIMEOUT 1 > NUL
GOTO MAIN_MENU

:IBM_3
REM TIMEOUT 1 > NUL
GOTO EXIT_MENU

:IBM_255
CLS
ECHO ERROR......RESTARTING SCRIPT, PLEASE WAIT
TIMEOUT 1 > NUL
GOTO MAIN_MENU

REM ------------------------------------------------------------------------------
REM IBM 720K TOOL ROUTINE

:IBMDD_MENU
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .             IBM 720K IMAGE TOOL               .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 ) INSERT FIRST FLOPPY TO IMAGE             .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  R )  RETURN TO MAIN MENU                     .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1RE /M "OPTION: "
GOTO IBMDD_%ERRORLEVEL%

:IBMDD_LOOP
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .             IBM 720K IMAGE TOOL               .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 ) INSERT NEXT FLOPPY TO IMAGE              .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  R )  RETURN TO MAIN MENU                     .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1RE /M "OPTION: "
GOTO IBMDD_%ERRORLEVEL%

:IBMDD_1
CLS
REM GET TIME FOR FILENAME
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
SET SUBFILENAME=%CUR_HH%%CUR_NN%

gw.exe read --diskdefs "diskdefs.cfg" --format=ibm.720 "IBM720_%SUBFILENAME%.img"
ECHO +===============================================+
ECHO .  COMPLETE ============ PLEASE EJECT FLOPPY    .
ECHO +===============================================+
TIMEOUT 3 > NUL
GOTO IBMDD_LOOP

:IBMDD_2
REM TIMEOUT 1 > NUL
GOTO MAIN_MENU

:IBMDD_3
REM TIMEOUT 1 > NUL
GOTO EXIT_MENU

:IBMDD_255
CLS
ECHO ERROR......RESTARTING SCRIPT, PLEASE WAIT
TIMEOUT 1 > NUL
GOTO MAIN_MENU

REM ------------------------------------------------------------------------------
REM AMIGA TOOL ROUTINE

:AMIGA_MENU
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .              AMIGA DD IMAGE TOOL              .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 ) INSERT FIRST FLOPPY TO IMAGE             .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  R )  RETURN TO MAIN MENU                     .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1RE /M "OPTION: "
GOTO AMIGA_%ERRORLEVEL%

:AMIGA_LOOP
CLS
ECHO +===============================================+
ECHO .                 GREASY-STOAT                  .
ECHO .                                               .
ECHO .              AMIGA DD IMAGE TOOL              .
ECHO +===============================================+
ECHO .                                               .
ECHO .  1 ) INSERT NEXT FLOPPY TO IMAGE              .
ECHO .                                               .
ECHO .  OR...                                        .
ECHO .                                               .
ECHO .  R )  RETURN TO MAIN MENU                     .
ECHO .                                               .
ECHO .  E )  EXIT TO SHELL                           .
ECHO .                                               .
ECHO +===============================================+

CHOICE /C 1RE /M "OPTION: "
GOTO AMIGA_%ERRORLEVEL%

:AMIGA_1
CLS
REM GET TIME FOR FILENAME
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
SET SUBFILENAME=%CUR_HH%%CUR_NN%

gw.exe read --diskdefs "diskdefs.cfg" --format=amiga.amigados "AMIGA_%SUBFILENAME%.ADF"
ECHO +===============================================+
ECHO .  COMPLETE ============ PLEASE EJECT FLOPPY    .
ECHO +===============================================+
TIMEOUT 3 > NUL
GOTO AMIGA_LOOP

:AMIGA_2
REM TIMEOUT 1 > NUL
GOTO MAIN_MENU

:AMIGA_3
REM TIMEOUT 1 > NUL
GOTO EXIT_MENU

:AMIGA_255
CLS
ECHO ERROR......RESTARTING SCRIPT, PLEASE WAIT
TIMEOUT 1 > NUL
GOTO MAIN_MENU

REM ------------------------------------------------------------------------------
REM EXIT TO SHELL ROUTINE

:EXIT_MENU
CLS
ECHO BYE!
ECHO REMEMBER TO GREASE THAT WEAZEL!
TIMEOUT 2 > NUL
EXIT /b