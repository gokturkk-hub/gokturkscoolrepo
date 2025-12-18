
@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
cls
echo(:'######:::'########:::'#######::'##::::'##:
echo('##... ##:: ##.... ##:'##.... ##:. ##::'##::
echo( ##:::..::: ##:::: ##: ##:::: ##::. ##'##:::
echo( ##::'####: ########:: ##:::: ##:::. ###::::
echo( ##::: ##:: ##.. ##::: ##:::: ##::: ## ##:::
echo( ##::: ##:: ##::. ##:: ##:::: ##:: ##:. ##::
echo(. ######::: ##:::. ##:. #######:: ##:::. ##:
echo(:......::::..:::::..:::.......:::..:::::..::
timeout 3
cls
color a
@mode con cols=100 lines=80
title internetsiz yapay zeka
@echo off
:somewhere
color 0e

:menu
cls
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)
title Komut ˜stemi Ara‡lar
color 0e
echo ----------------------------------------------------------------------------------------------------
echo Komut ˜stemi Ara‡lar                                 %mydate% - %mytime%  iyi gunler %username%
echo ----------------------------------------------------------------------------------------------------
echo.
echo Bir ara‡ se‡in
echo ==============
echo.
echo  [0] €kŸ
echo  [1] Hakknda
echo  [2] A§ Sorun Gidericisi
echo  [3] €alŸan ˜Ÿlemler ve Hizmetler Listesi
echo  [4] Bitlocker Src Kilitleme
echo  [5] Windows Update Temizleme
echo  [6] Windows Update Hizmetini Durdur/BaŸlat
echo  [7] Gereksiz Nvidia Dosyalarn Temizle
echo  [8] IP Adresi ve A§ Yaplandrmas Bilgileri
echo  [9] Ykl Srcler Listesi
echo [10] Yant Vermeyen Bir Uygulamay Sonlandr
echo [11] Sistem Bilgisi
echo [12] Yazdrma Kuyru§unu Temizle
echo [13] Windows 10 i‡in Veri Toplama ve Telemetri Hizmetleri Ayarlar
echo [14] yeni cmd
echo [15] havali mod :)
echo.
set /p "op=€alŸtr:"
if %op%==-1 goto -1
if %op%==0 exit > nul 2>&1
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto 3
if %op%==4 goto 4
if %op%==5 goto 5
if %op%==6 goto 6
if %op%==7 goto 7
if %op%==8 goto 8
if %op%==9 goto 9
if %op%==10 goto 10
if %op%==11 goto 11
if %op%==12 goto 12
if %op%==13 goto 13
if %op%==13 goto 14
if %op%==15 goto 15
cls
goto menu

:-1
@title Tetris v 1
@mode con cols=28 lines=24

:: Batch Game - Tetris v 1
:: Proof Of Concept
:: Coded by SmartGenius
:: SmartGenius, Corp. 2010

Choice /N /T:Y,1 >Nul 2>&1
If "%Errorlevel%"=="9009" (Echo. CHOICE command not found&Pause&Exit)

Set "Game=%0"

Call :Logo

:Easteregg
Cls
Echo.
Echo.
Echo. Tetris v 1 by SmartGenius
Echo. ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
Echo. ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo. ³1.³ ³Play TETRIS ³
Echo. ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo. ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo. ³2.³ ³How to Play ³
Echo. ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo. ÚÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo. ³3.³ ³Exit Game   ³
Echo. ÀÄÄÙ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
CHOICE /C:123 /N >nul
If "%errorlevel%"=="1" (Goto :Load)
If "%errorlevel%"=="2" (Goto :Help)
If "%errorlevel%"=="3" (Goto :End)
Goto :Easteregg

:Load
Setlocal enabledelayedexpansion
Set /a "LimX=18","LimY=16","TBound=1","LBound=0","Turn=1","Points=0"
Set /a "RBound=%LimX%","BBound=%LimY%"

:Init
For /l %%a in (0,1,%LimX%) do (
For /l %%b in (0,1,%LimY%) do (
Set "X%%aY%%b= "))
Set "Bound=Û"
Set "Bound2=²"

:Main
Set /a "L=(%Random% %% 7)+1"
Call :Figure%L%
Call :Graphic
Goto :Main

:Graphic
If "%New_F%"=="True" (
Call :Solid
Set "New_F=False"
Goto :Eof
)
Call :Clear
Cls
Echo.
Echo.  Tetris v 1 by SmartGenius
Echo.
Echo.   Points:%Points%
Echo.   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
For /l %%f in (0,1,%LimY%) do (Echo.   º!Lin_%%f!º)
Echo.   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
Call :Move
Goto :Graphic

:Move
:: Normal CHOICE (provided into ZIP package)
CHOICE /C:SADRXC /N >nul
:: Windows 7 or x64 system CHOICE (uncomment)
REM CHOICE /C SADRXC /N
If "%errorlevel%"=="1" (Call :Down)
If "%errorlevel%"=="2" (Call :Left)
If "%errorlevel%"=="3" (Call :Rigth)
If "%errorlevel%"=="4" (Call :Rotate)
If "%errorlevel%"=="5" (Goto :Easteregg)
If "%errorlevel%"=="6" (Call :MovCR)
::You can not move in 2 different directions at the same time.
REM Call :Down
Call :CheckL2
Goto :Eof

::::::::::::::::::::::::::::::::::::::::
:Solid
For %%a in (%Table%) do (Set "%%a=%Bound2%")
Goto :Eof

:Rotate
Set "TmpTB="
If "%XToken%"=="11" (Set "XToken=10")
If "%YToken%"=="15" (Set "XToken=14")
Set /a "NextRotate=(%RotateLevel% %% 4)+1"
Set "TmpTable=!Figure%CurFig%_Pos%NextRotate%!
For %%R in (%TmpTable%) do (
Call :MovR "%YToken%" "%XToken%" "%%R" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
For %%a in (%Table%) do (Set "%%a= ")
Set "Table=%TmpTB:~1%"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "RotateLevel+=1"
Goto :Eof

:MovR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~3") do (
Set /a MovY=%%q+%~1
Set /a MovX=%%p+%~2
Set "%~4=X!MovX!Y!MovY!"
Set "%~3= ")
Goto :Eof

:::::::::::::::::::::::::::::::::::::::::::
:Down
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|**** "Y%BBound%">nul
If !Errorlevel! EQU 0 (Set "New_F=True"&Goto :Eof)
Call :MovYR "1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
Set "New_F=True"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "YToken+=1"
Goto :Eof

:MovYR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~2") do (
Set /a MovY=%%q+%~1
Set "%~3=X%%pY!MovY!"
Set "%~2= ")
Goto :Eof

:MovCR
Cls
Echo.
Echo.
Call :L2 "Goto :Eof"
Echo.
For /f "tokens=2 skip=3" %%c in ('**** "::_0" %Game%') do (
Set "Tmp_Var=%%c"
Call :Key.A Tmp_Var
Echo. !Tmp_Var!
)
Pause >nul
Goto :Eof
::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::
:Rigth
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|**** "X%RBound%">nul
If !Errorlevel! EQU 0 (Goto :Eof)
Call :MovXR "+1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "XToken+=1"
Goto :Eof

:Left
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|**** "X%LBound%">nul
If !Errorlevel! EQU 0 (Goto :Eof)
Call :MovXR "-1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "XToken-=1"
Goto :Eof

:MovXR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~2") do (
Set /a MovX=%%p%~1
Set "%~3=X!MovX!Y%%q"
Set "%~2= ")
Goto :Eof

::::::::::::::::::::::::::::::::::::::::

:CheckL2
If "!Lin_1!"=="²²²²²²²²²²²²²²²²²²²" (Goto :Lost)
If "!Lin_%LimY%!"=="²²²²²²²²²²²²²²²²²²²" (
Call :Clear
For /l %%x in (0,1,%LimX%) do (
For /l %%y in (%LimY%,-1,1) do (
Set /a "UpLine=%%y-1"
Call Set "X%%xY%%y=%%X%%xY!UpLine!%%"
))
Set /a "Points+=100"
For /l %%d in (0,1,%LimX%) do (Set "X%%dY0= ")
Goto :CheckL2
)
Goto :Eof

:::::::::::::::::::::::::::::::::::::::::

:Key.A
If not defined %1 Goto:Eof
Set "c="
Set "d=0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz =/\()[]{}_-.:,;* @#"
:Key.B
Set "chr=!%1:~,1!"
For /l %%l in (0 1 80) do if "!chr!" equ "!d:~%%l,1!" (
  set /a "x=%%l^5"
  call set "c=!c!%%d:~!x!,1%%"
)
Set "%1=!%1:~1!"
If defined %1 goto:Key.B
Set "%1=!c!"
Goto :Eof
:::::::::::::::::::::::::::::::::::::::::

:Clear
For /l %%m in (0,1,%LimY%) do (Set Lin_%%m=)
For /l %%d in (0,1,%LimY%) do (
For /l %%e in (0,1,%LimX%) do (
Set Lin_%%d=!Lin_%%d!!X%%eY%%d!))
Goto :Eof

:Lost
Cls
Echo.
Echo.  Tetris v 1 by SmartGenius
Echo.
Echo.     Points:%Points%
Echo.        You lose!
Goto :End

:Win
Cls
Echo.
Echo.  Tetris v 1 by SmartGenius
Echo.
Echo.     Points:%Points%
Echo.         You win!  
Goto :End

:End
Echo.    Thanks for playing.
Echo.  Tetris v1 by SmartGenius
Endlocal
Ping -n 3 localhost >nul
Exit

::::::::::::::::::::::::::::::::::::::::::
:Figure1
Set Figure1_Pos1=X6Y2,X6Y1,X7Y1,X7Y0
Set Figure1_Pos2=X7Y1,X8Y1,X6Y0,X7Y0
Set Figure1_Pos3=X6Y2,X6Y1,X7Y1,X7Y0
Set Figure1_Pos4=X7Y1,X8Y1,X6Y0,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure1_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=1","RotateLevel=%R%"
Goto :Eof

:Figure2
Set Figure2_Pos1=X7Y2,X6Y1,X7Y1,X6Y0
Set Figure2_Pos2=X6Y1,X7Y1,X7Y0,X8Y0
Set Figure2_Pos3=X7Y2,X6Y1,X7Y1,X6Y0
Set Figure2_Pos4=X6Y1,X7Y1,X7Y0,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure2_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=2","RotateLevel=%R%"
Goto :Eof

:Figure3
Set Figure3_Pos1=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos2=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos3=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos4=X7Y1,X8Y1,X7Y0,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set "Table=!Figure3_Pos%R%!"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=3","RotateLevel=%R%"
Goto :Eof

:Figure4
Set Figure4_Pos1=X6Y1,X7Y1,X8Y1
Set Figure4_Pos2=X7Y2,X7Y1,X7Y0
Set Figure4_Pos3=X6Y1,X7Y1,X8Y1
Set Figure4_Pos4=X7Y2,X7Y1,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure4_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=4","RotateLevel=%R%"
Goto :Eof

:Figure5
Set Figure5_Pos1=X6Y1,X7Y1,X8Y1,X7Y0
Set Figure5_Pos2=X7Y2,X7Y1,X8Y1,X7Y0
Set Figure5_Pos3=X7Y1,X6Y0,X7Y0,X8Y0
Set Figure5_Pos4=X8Y2,X7Y1,X8Y1,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure5_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=5","RotateLevel=%R%"
Goto :Eof

:Figure6
Set Figure6_Pos1=X6Y1,X6Y0,X7Y0,X8Y0
Set Figure6_Pos2=X8Y2,X8Y1,X8Y0,X7Y0
Set Figure6_Pos3=X6Y1,X7Y1,X8Y1,X8Y0
Set Figure6_Pos4=X6Y2,X7Y2,X6Y1,X6Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure6_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=6","RotateLevel=%R%"
Goto :Eof

:Figure7
Set Figure7_Pos1=X8Y1,X6Y0,X7Y0,X8Y0
Set Figure7_Pos2=X7Y2,X8Y2,X8Y1,X8Y0
Set Figure7_Pos3=X6Y1,X7Y1,X8Y1,X6Y0
Set Figure7_Pos4=X6Y2,X6Y1,X6Y0,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure7_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=7","RotateLevel=%R%"
Goto :Eof

::_0 xx9tYjYxWvxPrXmoLjqfzpxx
::_0 xxxxxXhXxLBINRPFGBaxxxxxx
::_0 xxxxxxxxxxxxxxxxxxxxxxxxx
::_0 xPrXmoLjqfzpx9tms-x7545xxx

:Help
Cls
Echo.
Call :L2 "Goto :Eof"
Echo.
Echo. How to Play Batch Tetris ?
Echo.
Echo. Use keys A,S,D,R,X
Echo.
Echo. A = Move Shape Left
Echo. S = Move Shape Down
Echo. D = Move Shape Rigth
Echo. R = Rotate Shape
Echo. X = Back to Menu Game
Echo.
Echo.
Pause >nul
Goto :Easteregg

:Logo
Cls
Color 0b
Echo.
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
:L2
Echo. °°ÛÛÛ°ÛÛÛ°ÛÛÛ°ÛÛ°°Û°°ÛÛ°°°
Echo. °°°Û°°Û°°°°Û°°Û°Û°Û°Û°°°°°
Echo. °°°Û°°ÛÛÛ°°Û°°ÛÛ°°Û°°Û°°°°
Echo. °°°Û°°Û°°°°Û°°Û°Û°Û°°°Û°°°
Echo. °°°Û°°ÛÛÛ°°Û°°Û°Û°Û°ÛÛ°°°°
%~1
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
Echo. °°±°°°°°°°°°²°°°°°°°°°°±°°
Echo. °°±°²°°°²²°°²²°°°²²²°°°±°°
Echo. °°±°²²°°°²°°²°°°°°°°°°°±°°
Echo. °°±°°²°°°²°°°°°°²²°°°°°±°°
Echo. °°±°°°°°°°°°°°°°°²²°°°°±°°
Echo. °°±°°°°°°°°²°°°°°°°°°°°±°°
Echo. °°±²°°°°°°°²²²°°°°°°°°°±°°
Echo. °°±²°°²²°°°°°°°²°°°°°°²±°°
Echo. °°±²°°²²°°°°°°²²²°°°²²²±°°
Echo. °°±±±±±±±±±±±±±±±±±±±±±±°°
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
Echo. °°°°°: SmartGenius :°°°°°°
Echo. °°°°°  Corp.  2010  °°°°°°
Echo. °°°°°°°°°°°°°°°°°°°°°°°°°°
Ping -n 3 0.0.0.0 >nul
Goto :Eof


:1
cls
echo Gizli ”zelli§i g”rmek i‡in ana mendeyken -1 yazn.
color 0a
echo.
echo                          -:///:-                
echo                         ./oNNmy/:                
echo                         ./oNNNmy/-              
echo                         ./oNNNmm+/.              
echo                         -/sNNNmmy/-              
echo                        -/sNNNmmms/.              
echo                       -/yNNNmmmm+/              
echo                     `:/dNNNmmmmh/:.............  
echo                    ./omNNNNNNNNyoooooooooooooo+/-
echo .-----------------:/yNNNNNNNNNNNNNNNNNNNNmmmmmmy/-
echo //+++++++++++++//ohNNNNNNNNNNNNNNNNNNNNNNmmmmmmo/.
echo :/ooooooooooooo//mNNNNNNNNNNNNNNNNNNNNNNmmmmmh//`
echo -/ooooooooooooo//mNNNNNNNNNNNNNNNNNNNNNNmmmmmmo/`
echo -/+oooooooooooo//mNNNNNNNNNNNNNNNNNNNNNmmmmmho/-
echo ./+oooooooooooo//mNNNNNNNNNNNNNNNNNNNNNmmmmmy/:  
echo `/+oooooooooooo//mNNNNNNNNNNNNNNNNNNNNNmmmmmy/-  
echo  //oooooooooooo//mNNNNNNNNNNNNNNNNNNNNmmmmh+/-  
echo  //ooooooooysoo//mNNNNNNNNNNNNNNNNNNNNmmmmmo/.  
echo  :/ooooooodmmoo//syhNNNNNNNNNNNNNNNNNmmmmmy/:    
echo  -/+ooooooooooo///::/++++++++++++++++++++/:.    
echo  `::::::::::::::::`  ````````````````````        
echo.
echo Komut ˜stemi Ara‡lar
echo.
echo Basit ve kullanŸl kodlar bir araya getiren bir yazlm. Telif hakk bulunmamaktadr.
echo.
echo Srm Notlar
echo.
echo v0.3.2
echo -5 yeni ara‡ eklendi.
echo -Se‡im ekranlarnda de§iŸiklik yapld.
echo -Saat ve tarih eklendi.
echo -K‡k hata dzeltmeleri yapld.
echo.
echo v0.1.8.tx
echo -Srpriz bir ”zellik eklendi. [˜yi bakn, bulacaksnz :) ]
echo -A§ yaplandrmasn ve IP adresini g”steren bir ara‡ eklendi.
echo -K‡k hata dzeltmeleri yapld.
echo.
echo v0.1.4
echo -Yazlmn ismi de§iŸtirildi.
echo.
echo v0.1.3
echo -Gereksiz Nvidia dosyalarn temizleme arac eklendi.
echo -K‡k hata dzeltmeleri yapld.
echo.
echo v0.1
echo -Yazlmn ilk srm yaynland.

goto choice

:2
cls
echo --------------------------------------------------------------------------------
echo.
echo Uyar: Bu iŸlem baz a§ ayarlarn ve ”nbelleklerini sfrlayacaktr.
echo.
CHOICE /C EH /M "Devam etmek istiyor musunuz"
IF ERRORLEVEL 2 goto menu
echo.
echo --------------------------------------------------------------------------------
echo.
netsh int ip reset reset.txt
netsh winsock reset
netsh advfirewall reset
netsh winhttp reset proxy
route -f
ipconfig /release
ipconfig /renew
netsh interface ip delete arpcache
nbtstat -R
nbtstat -RR
ipconfig /flushdns
ipconfig /registerdns
echo.
echo De§iŸikliklerin etkili olabilmesi i‡in bilgisayar yeniden baŸlatmalsnz.
echo.
CHOICE /C EH /M "žimdi yeniden baŸlatmak ister misiniz"
IF ERRORLEVEL 2 goto choice
goto netboot

:3
cls
echo €alŸan ˜Ÿlemler ve Hizmetler Listesi
echo.
echo --------------------------------------------------------------------------------
echo Ltfen bir se‡enek belirleyin.
echo --------------------------------------------------------------------------------
echo.
echo [0] Ana Men
echo [1] ˜Ÿlemler
echo [2] Hizmetler
echo.
set /p op=€alŸtr:
if %op%==0 goto menu
if %op%==1 goto 3tasklst
if %op%==2 goto 3netserv
cls
goto 3

:3tasklst
echo.
echo --------------------------------------------------------------------------------
tasklist
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 3

:3netserv
echo.
echo.
echo --------------------------------------------------------------------------------
sc query type= service
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 3

:4
cls
echo =====================================
echo Bu ara‡, Bitlocker ile ŸifrelenmiŸ ve kilidi a‡lmŸ srcleri tekrar kilitlemenizi sa§lar.
echo =====================================
echo.
echo [0] Ana Men
echo.
echo --------------------------------------------------------------------------------
echo Ltfen kilitlemek istedi§iniz srcnn harfini girin.
echo.
set /p "DriveLetter=> "
if %DriveLetter% EQU 0 goto menu
echo.
manage-bde -lock -ForceDismount %DriveLetter% > nul

if %errorlevel% EQU 0 goto nfo (
if %errorlevel% EQU -2147217405 goto admin
if %errorlevel% EQU -2144272384 goto error
if %errorlevel% EQU -2144272383 goto ntencrypt
) else (
  echo Bilinmeyen bir hata oluŸtu. Src harfinin hatal olmad§ndan emin olun.
  echo.
  echo --------------------------------------------------------------------------------
  echo.
  echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
  echo.
  pause > nul
  goto 4
)

:nfo
echo ˜Ÿlem tamamland. Src baŸaryla kilitlendi.
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 4

:error
echo ˜Ÿlem baŸarsz. Src zaten kilitli.
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 4

:admin
echo Hata. Program y”netici ayrcalklarna sahip de§il.
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 4

:ntencrypt
echo ˜Ÿlem baŸarsz. Src Ÿifreli de§il.
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 4

:5
cls
echo --------------------------------------------------------------------------------
echo.
echo Uyar: Bu iŸlem Windows Update ge‡miŸini temizleyecektir.
echo.
CHOICE /C EH /M "Devam etmek istiyor musunuz"
IF ERRORLEVEL 2 goto menu
echo.
echo --------------------------------------------------------------------------------
taskkill /fi "Services eq wuauserv" /F > nul 2>&1
rmdir %windir%\softwaredistribution /s /q > nul 2>&1
rmdir %windir%\system32\softwaredistribution /s /q > nul 2>&1
regsvr32 /s wuaueng.dll
regsvr32 /s wuaueng1.dll
regsvr32 /s atl.dll
regsvr32 /s wups.dll
regsvr32 /s wups2.dll
regsvr32 /s wuweb.dll
regsvr32 /s wucltui.dll
echo.
CHOICE /C EH /M "Windows Update ge‡miŸi temizlendi. Bu hizmeti Ÿimdi baŸlatmak ister misiniz"
IF ERRORLEVEL 2 goto choice
echo.
net start wuauserv
goto wuchoice

:6
cls
echo Ltfen bekleyin...
echo.
sc query "wuauserv" | **** "RUNNING" > nul
if %ErrorLevel% EQU 0 goto askstop (
if %ErrorLevel% EQU 1 goto askstart
) else (
  echo --------------------------------------------------------------------------------
  echo.
  echo Bilinmeyen bir hata oluŸtu.
  goto choice
)

:askstop
echo --------------------------------------------------------------------------------
echo.
echo Windows Update hizmeti ‡alŸyor. Durdurmak i‡in Y, ana menye d”nmek i‡in N tuŸuna basn.
echo.
set /P c=">"
if /I "%c%" EQU "Y" goto stop
if /I "%c%" EQU "N" goto menu
cls
goto askstop

:askstart
echo --------------------------------------------------------------------------------
echo.
echo Windows Update hizmeti ‡alŸmyor. BaŸlatmak i‡in Y, ana menye d”nmek i‡in N tuŸuna basn.
echo.
set /P c=">"
if /I "%c%" EQU "Y" goto start
if /I "%c%" EQU "N" goto menu
cls
goto askstart

:stop
taskkill /fi "Services eq wuauserv" /F > nul
echo.
echo Windows Update hizmeti durduruldu.
goto choice

:start
net start wuauserv > nul
echo.
echo Windows Update hizmeti baŸlatld.
goto choice

:7
cls
echo --------------------------------------------------------------------------------
echo.
echo Uyar: Bu iŸlem sisteminizdeki gereksiz Nvidia dosyalarn temizleyecektir. E§er sisteminizde Nvidia ekran kart bulunmuyorsa bu arac kullanmayn.
echo.
CHOICE /C EH /M "Devam etmek istiyor musunuz"
IF ERRORLEVEL 2 goto menu
echo.
echo --------------------------------------------------------------------------------
echo.
echo Ltfen bekleyin...
RD /S /Q "C:\PROGRAM FILES\NVIDIA CORPORATION\INSTALLER2" > nul 2>&1
RD /S /Q "C:\NVIDIA" > nul 2>&1
echo.
echo ˜Ÿlem tamamland.
goto choice

:8
cls
echo --------------------------------------------------------------------------------
echo Ltfen bir se‡enek belirleyin.
echo --------------------------------------------------------------------------------
echo.
echo [0] Ana Men
echo [1] Windows A§ Yaplandrmas ve Yerel IP Adresi
echo [2] Global IP Adresi
echo.
set /p op=€alŸtr:
if %op%==0 goto menu
if %op%==1 goto lip
if %op%==2 goto gip
cls
goto 8

:lip
echo.
ipconfig /all
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 8

:gip
echo.
echo --------------------------------------------------------------------------------
echo.
echo Ltfen bekleyin, bu iŸlem biraz uzun srebilir.
echo.
powershell -command " (Invoke-WebRequest https://wtfismyip.com/text).Content "
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 8

:9
cls
echo Bu ara‡ sisteminizde ykl olan tm srclerin bir listesini oluŸturacaktr.
echo.
echo --------------------------------------------------------------------------------
driverquery
goto choice

:10
cls
echo =====================================
echo Bu ara‡, yant vermeyen bir uygulamay sonlandrmanz sa§lar.
echo =====================================
echo.
echo [0] Ana Men
echo.
echo --------------------------------------------------------------------------------
echo Ltfen sonlandrmak istedi§iniz uygulamann ismini yazn. (”rn, explorer.exe)
echo.
set /p "app=> "
if %app% EQU 0 goto menu
taskkill /im %app% /f > nul 2>&1
if %errorlevel% EQU 128 goto tkrrr
echo.
echo ˜Ÿlem sonlandrld.
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn.
pause > nul
goto 10

:tkrrr
echo.
echo Hata oluŸtu. Uygulamann ismini do§ru yazd§nzdan emin olun.
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn.
pause > nul
goto 10

:11
cls
echo Ltfen bekleyin.
echo.
echo --------------------------------------------------------------------------------
systeminfo
goto wuchoice

:12
echo.
echo --------------------------------------------------------------------------------
echo Yazdrma biriktiricisi hizmeti durduruluyor.
taskkill /fi "Services eq spooler" /F > nul 2>&1
echo Hizmet durduruldu.
echo.
echo Yazdrma kuyru§u temizleniyor.
del %systemroot%\System32\spool\printers\* /Q /F /S  > nul 2>&1
echo Tamamland.
echo.
echo Hizmet yeniden baŸlatlyor.
net start spooler  > nul 2>&1
echo Hizmet baŸlatld.
goto choice

:13
cls
echo --------------------------------------------------------------------------------
echo Windows 10 i‡in Veri Toplama ve Telemetri Hizmetleri
echo --------------------------------------------------------------------------------
echo.
echo [0] Ana Men
echo [1] Devre DŸ Brak
echo [2] EtkinleŸtir
echo.
set /p op=€alŸtr:
if %op%==0 goto menu
if %op%==1 goto teldis13
if %op%==2 goto telen13
cls
goto 13

:15
:starttt
color a 
dir/b
dir/s
tree
color 4
dir/s
color a
dir/s
dir/b
goto :starttt

:teldis13
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bu iŸlem, Windows 10 i‡in Veri Toplama ve Telemetri Hizmetlerini devre dŸ brakacaktr.
echo.
CHOICE /C EH /M "Devam etmek istiyor musunuz"
IF ERRORLEVEL 2 goto 13menu
sc config dmwappushservice start= disabled > nul 2>&1
sc stop "dmwappushservice" > nul 2>&1
sc config diagtrack start= disabled > nul 2>&1
sc stop "DiagTrack" > nul 2>&1
start reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v AllowTelemetry /t REG_DWORD /d 0 /f > nul 2>&1
start reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection /v AllowTelemetry /t REG_DWORD /d 0 /f > nul 2>&1
echo.
echo ˜Ÿlem tamamland.
goto 13menu

:telen13
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bu iŸlem, Windows 10 i‡in Veri Toplama ve Telemetri Hizmetlerini etkinleŸtirecektir.
echo.
CHOICE /C EH /M "Devam etmek istiyor musunuz"
IF ERRORLEVEL 2 goto 13menu
sc config dmwappushservice start= auto > nul 2>&1
sc start "dmwappushservice" > nul 2>&1
sc config diagtrack start= auto > nul 2>&1
sc start "DiagTrack" > nul 2>&1
start reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v AllowTelemetry /t REG_DWORD /d 1 /f > nul 2>&1
start reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection /v AllowTelemetry /t REG_DWORD /d 1 /f > nul 2>&1
ping localhost -n 5 > nul
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /f > nul 2>&1
echo.
echo ˜Ÿlem tamamland.
goto 13menu

:choice
echo.
echo --------------------------------------------------------------------------------
echo.
echo Ana menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto menu

:wuchoice
echo --------------------------------------------------------------------------------
echo.
echo Ana menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto menu

:netboot
shutdown /r /t 0
exit

:officemainmenu
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 3

:13menu
echo.
echo --------------------------------------------------------------------------------
echo.
echo Bir ”nceki menye d”nmek i‡in herhangi bir tuŸa basn...
echo.
pause > nul
goto 13

:14
start


:somewhere_else

echo "TAMAM."
pause


exit