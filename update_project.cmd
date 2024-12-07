@echo off
setlocal enabledelayedexpansion

:: Задание URL для актуальной версии на GitHub
set github_version_url=https://raw.githubusercontent.com/YanGusik/FuckDiscordPI/main/version.txt

:: Путь к локальному файлу версии в проекте
set local_version_file=%~dp0version.txt

:: Временный файл для загрузки актуальной версии с GitHub
set temp_version_file=%temp%\github_version.txt

:: Папка, в которую будет распакован новый архив
set project_folder=%~dp0

:: Папка для временного скачивания ZIP архива
set temp_zip_file=%temp%\project_update.zip

:: Проверка наличия утилиты curl
where curl >nul 2>nul
if %errorlevel% neq 0 (
    echo Ошибка: Утилита curl не установлена!
    exit /b
)

:: Скачиваем актуальную версию с GitHub в temp файл
echo Скачиваю актуальную версию с GitHub...
curl -s %github_version_url% -o %temp_version_file%

:: Проверяем, существует ли локальный файл версии
if not exist "%local_version_file%" (
    echo Ошибка: файл version.txt не найден в локальном проекте!
    exit /b
)

:: Читаем локальную и актуальную версии
set /p local_version=<%local_version_file%
set /p github_version=<%temp_version_file%

:: Сравниваем версии
echo Локальная версия: !local_version!
echo Актуальная версия: !github_version!

if "!local_version!" neq "!github_version!" (
    echo Версии не совпадают! Обновление проекта...

    :: Скачиваем архив с последней версией проекта с GitHub
    echo Скачиваю архив с последней версией...
    curl -L -o %temp_zip_file% https://github.com/YanGusik/FuckDiscordPI/archive/refs/heads/main.zip

    :: Распаковываем архив в папку проекта, исключая лишнюю вложенную папку
    echo Распаковываю обновление...
    powershell -Command "Expand-Archive -Path '%temp_zip_file%' -DestinationPath '%temp%\update_folder'"
    
    :: Перемещаем файлы из распакованного архива в папку проекта
    echo Перемещаем файлы в папку проекта...
    xcopy /E /I /Y "%temp%\update_folder\FuckDiscordPI-main\*" "%project_folder%"

    :: Удаляем временную папку и файлы
    rmdir /S /Q "%temp%\update_folder"
    del "%temp_version_file%"
    del "%temp_zip_file%"

    echo Обновление завершено!
) else (
    echo Версии совпадают! Обновление не требуется.
)

pause
