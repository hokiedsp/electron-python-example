REM if exist venv rmdir /s /q venv
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
if exist pretty-calculator-win32-x64 rmdir /q /s pretty-calculator-win32-x64

REM Python - create new virtual environment 
REM python -m venv .\venv

REM Python - activate the new virtual environment
REM venv/Scripts/activate

REM Python - make sure all the required packages are installed
pip install -r pycalc\requirements.txt

REM Python build - just includes .pyc not source code ok
pyinstaller pycalc\api.py

REM remove temporary build directory
if exist build rmdir /s /q build

REM Run - test final application
npm run electron-package 
echo The exe is built and lives in the pretty-calculator-win32-x64\pretty-calculator.exe

echo Next run inno script, result typically is Output/setup.exe
