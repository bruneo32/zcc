@echo off

for /f %%G IN ('dir /b /s *.z') do (
	
	echo ^> Compiling %%~nxG to %%~nG.exe
	zcc %%G %%~nG.exe -c -win32
	
	echo.
)

echo ^> Ok!
pause>nul
exit
