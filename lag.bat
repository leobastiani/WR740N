@ECHO OFF
if NOT EXIST %~dp0\lag.txt (
	echo.>%~dp0\lag.txt
	call hide me
	call netlimiter 1
	nircmdc waitprocess "League of Legends.exe"
	call netlimiter 0
	rm %~dp0\lag.txt
	call show me
	exit
)