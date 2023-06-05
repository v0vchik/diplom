@echo off

set pythonScriptPath=C:\BotPython\main.py
set pythonExecutable=C:\Users\Администратор.WS2019.000\AppData\Local\Programs\Python\Python311\python.exe

REM Проверяем, существует ли указанный путь к Python скрипту
if exist "%pythonScriptPath%" (
    REM Запускаем Python скрипт в скрытом режиме
    start /B "" "%pythonExecutable%" "%pythonScriptPath%"
) else (
    echo Ошибка: Указанный путь "%pythonScriptPath%" не существует.
)

REM Ждем нажатия клавиши, чтобы окно cmd не закрылось сразу
pause
