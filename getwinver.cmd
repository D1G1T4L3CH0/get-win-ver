@echo off
:: Get-Win-Ver
:: Just a simple script to determine the windows version. You can call this from your own scripts. It sets three variables, win_v, win_v_name, and win_v_build. win-v is the version number #.#. win_v_name is the name of the operating system in a string. win_v_build is the build number. Feel free to modify this any way you like or just copy/paste it to your own script. Your welcome. :)
:: If you need a more specific answer, it might be possible to determine exact version with the build number. This stript is not setup to do that.

:: Information below from: http://msdn.microsoft.com/en-us/library/windows/desktop/ms724832%28v=vs.85%29.aspx
:: Windows 10					10.0
:: Windows 8.1					6.3
:: Windows 8					6.2
:: Windows Server 2012			6.2
:: Windows 7					6.1
:: Windows Server 2008 R2		6.1
:: Windows Server 2008			6.0
:: Windows Vista				6.0
:: Windows Server 2003 R2		5.2
:: Windows Server 2003			5.2
:: Windows XP 64-Bit Edition	5.2
:: Windows XP					5.1
:: Windows 2000					5.0

:: Get the version numebrs from the ver command.
for /f "tokens=2 delims=[]" %%x in ('ver') do (
	for /f "tokens=2-4 delims=. " %%a in ("%%x") do (
		set win_v=%%a.%%b
		set win_v_build=%%c
	)
)

:: Set the win_v_name variable.
if %win_v% EQU 5.0 set win_v_name=Windows 2000
if %win_v% EQU 5.1 set win_v_name=Windows XP
if %win_v% EQU 5.2 set win_v_name=Windows Server 2003 / Server 2003 R2 / XP 64-Bit Edition
if %win_v% EQU 6.0 set win_v_name=Windows Vista / Server 2008
if %win_v% EQU 6.1 set win_v_name=Windows 7 / Server 2008 R2
if %win_v% EQU 6.2 set win_v_name=Windows 8 / Server 2012
if %win_v% EQU 6.2 set win_v_name=Windows 8.1 / Server 2012 R2
if %win_v% EQU 10.0 set win_v_name=Windows 10 / Windows Server 2016

:: If you would like the build number in the same variable as the regular version, just uncomment the following line. Or you could modify the above.
:: The script cannot set the name if you modify it above. The if statements require a number with one decimal or less.
REM set win_v=%win_v%.%win_v_build%

:: Uncomment the below two lines for a test.
REM echo Version: %win_v% Build %win_v_build% ^(%win_v_name%^)
REM pause
