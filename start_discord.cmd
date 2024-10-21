@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM Author: YanGusik v.3.0.0
REM https://github.com/YanGusik/FuckDiscordPI

cd /d "%~dp0"

set ROOT=%~dp0
set BIN=%~dp0\bin\
set ARGS=%~dp0\args\

REM Файл для хранения последнего выбора
set "last_choice_file=last_choice.txt"

REM Переменная по умолчанию
set "default_choice=1"

REM Загрузка последнего выбора из файла, если он существует
if exist "%last_choice_file%" (
    set /p last_choice=<"%last_choice_file%"
    echo Последний выбор: !last_choice!
) else (
    echo Нет предыдущего выбора. Установка по умолчанию: !default_choice!
    set "last_choice=!default_choice!"
)

REM Удаление лишних пробелов
set "last_choice=!last_choice: =!"

REM Запрос выбора пользователя
echo Выберите опцию:
echo 1 - Discord new
echo 2 - Discord old
echo 3 - Discord (MGTS) 1
echo 4 - Discord (MGTS) 2
echo 5 - Discord (MGTS) 3
echo 6 - Discord alternative 1
echo 7 - Discord alternative 2
echo 8 - Discord alternative 3
echo 9 - Discord alternative 4
echo 10 - Discord alternative 5
set /p choice="Введите номер (или нажмите Enter для использования последнего выбора): "

REM Использование последнего выбора, если ничего не введено
if "%choice%"=="" (
    set "choice=!last_choice!"
) else (
    set "last_choice=!choice!"
)

REM Удаление лишних пробелов
set "choice=!choice: =!"
set "last_choice=!last_choice: =!"

REM Запоминание последнего выбора в файл
echo !last_choice! > "%last_choice_file%"

REM Обработка выбранного файла
set "input_file="
if "!choice!"=="1" (
    set "input_file=%ARGS%discord_main.txt"
) else if "!choice!"=="2" (
    set "input_file=%ARGS%discord_old.txt"
) else if "!choice!"=="3" (
    set "input_file=%ARGS%discord_mgts_1.txt"
) else if "!choice!"=="4" (
    set "input_file=%ARGS%discord_mgts_2.txt"
) else if "!choice!"=="5" (
    set "input_file=%ARGS%discord_mgts_3.txt"
) else if "!choice!"=="6" (
    set "input_file=%ARGS%discord_alternative_1.txt"
) else if "!choice!"=="7" (
    set "input_file=%ARGS%discord_alternative_2.txt"
) else if "!choice!"=="8" (
    set "input_file=%ARGS%discord_alternative_3.txt"
) else if "!choice!"=="9" (
    set "input_file=%ARGS%discord_alternative_4.txt"
) else if "!choice!"=="10" (
    set "input_file=%ARGS%discord_alternative_5.txt"
) else (
    echo Неверный выбор!
    exit /b
)

REM Чтение файла построчно и замена переменных с учётом регистра (немного гавнокод, потом переделаю)
for /f "usebackq delims=" %%A in ("!input_file!") do (
    set "line=%%A"
    
    REM Замена переменных
    set "current_line=!line!"
    set "current_line=!current_line:ROOT=%ROOT%!"
    set "current_line=!current_line:VBIN=%BIN%!"
    set "current_line=!current_line:ARGS=%ARGS%!"

    REM Удаление символа ^
    set "current_line=!current_line:^ =!"
    set "current_line=!current_line:^=!"
    set "current_line=!current_line:%%=!"

    REM Удаление двойных пробелов
    :removeDoubleSpaces
    set "current_line=!current_line:  =!"
    if "!current_line!" neq "!current_line:  =!" goto removeDoubleSpaces

    REM Добавление обработанной строки к итоговой переменной
    set "arguments=!arguments! !current_line!"
)

REM Вызов программы с аргументами
echo "Аргументы "%BIN%winws.exe" !arguments!"
start "FuckDiscordPi: Discord (YanGusik)" /min "%BIN%winws.exe" !arguments!