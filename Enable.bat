@ECHO OFF

if [%1]==[] (
	echo usage: Enable.bat 0 ou Enable.bat 1
	goto:eof
)

pushd %~dp0


call EstouEmSaoCarlos
set /p EstouEmSaoCarlos=<EstouEmSaoCarlos.txt
set /p gateway=<gateway.txt


echo EstouEmSaoCarlos: %EstouEmSaoCarlos%
echo gateway: %gateway%

if [%gateway%]==[192.168.1.1] (
	call v3\Enable.bat %1
	popd
	goto:eof
)


if [%EstouEmSaoCarlos%] NEQ [1] (

	goto:eof

)


bash Login.sh
getSID.py
set /p SID=<sid.txt
bash ControleBanda.sh %SID% %1
bash Regra.sh %SID% %1


popd