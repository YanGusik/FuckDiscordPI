# FuckDiscordPI [Обход Discord, Youtube, Steam]

![logo](https://github.com/YanGusik/FuckDiscordPI/blob/main/logo.png)


**FuckDiscordPI** — это инструмент для обхода блокировок сервисов Discord, YouTube и Steam. Этот проект основан на открытом репозитории и содержит адаптированную конфигурацию.

> [!CAUTION]  
> **Замечание о проекте** \
> Этот проект основан на открытом репозитории, и я внес изменения в конфигурацию, чтобы оптимизировать его для обхода блокировок некоторых сервисов. Пожалуйста, имейте в виду, что я не несу ответственности за использование данного репозитория, особенно если он был загружен из других источников.

## Инструкция

1. **Скачайте** последний [релиз](https://github.com/YanGusik/FuckDiscordPI/releases).
2. **Распакуйте** архив в отдельную папку (без русских символов).
3. Запустите **от имени администратора** необходимые исполняемые файлы:
```
- start_discord.cmd - Обход блокировки discord (Zapret)
- start_youtube.cmd - Обход блокировки discord (GoodByeDpi)
- service_install_discord.bat - Создать службу по обходу блокировки
- service_remove_all.bat - Удалить службы все (goodbyedpi и zapret)
```

## Очень важно
> [!IMPORTANT]  
> Запускайте сервисы от имени администратора и перед установкой, убедитесь что сценарии работают в start_discord.cmd \
> \
> **ВАЖЕН ПОРЯДОК ЗАПУСКА СКРИПТОВ** \
> Если вы используете обход  youtube (goodbyedpi), то запускайте его первым, перед запуском обхода дискорда, иначе работать не будет.
> 
> Если используете другие проекты, то проверяйте хеш файлов на сходство с первоисточником, будьте внимательны и обращайте внимание на .cmd файлы, чтобы не было скриптов на удаление файлов, \
> как напримере zapret-discord-youtube (пользователь создал аккаунт с поддельным символом) и создал клон проекта с удалением всех файлов

## BlockCheck script (прогон различных конфигурации)
- Запустите `blockcheck/blockcheck.cmd`
- `domain(s) (default: rutracker.org):` `discord.com`
- Везде нажимайте enter (выбор по умолчанию)
- В конце в файле `blockcheck.log`, будут записаны предполагаемые параметры. \
 Однако, имейте в виду, что это не гарантирует успешное выполнение: Ctrl+C Ctrl+V могут не привести к ожидаемому результату.

## Дополнительно
- `list-discord.txt` список discord адресов
- `list-youtube.txt` список youtube адресов
- `list-discord_ips.txt` список discord адресов с ip

## Первоисточник
Форк с https://github.com/bol-van/zapret

## Благодарность
Я был бы рад если подпишитесь на ТГ и напишите фидбек. \
TG канал: https://t.me/yan_gusik


## Похожие проекты

- **[zapret](https://github.com/bol-van/zapret)** by @bol-van (for MacOS, Linux and Windows)
- **[Green Tunnel](https://github.com/SadeghHayeri/GreenTunnel)** by @SadeghHayeri (for MacOS, Linux and Windows)
- **[DPI Tunnel CLI](https://github.com/nomoresat/DPITunnel-cli)** by @zhenyolka (for Linux and routers)
- **[DPI Tunnel for Android](https://github.com/nomoresat/DPITunnel-android)** by @zhenyolka (for Android)
- **[PowerTunnel](https://github.com/krlvm/PowerTunnel)** by @krlvm (for Windows, MacOS and Linux)
- **[PowerTunnel for Android](https://github.com/krlvm/PowerTunnel-Android)** by @krlvm (for Android)
- **[SpoofDPI](https://github.com/xvzc/SpoofDPI)** by @xvzc (for macOS and Linux)
- **[SpoofDPI-Platform](https://github.com/r3pr3ss10n/SpoofDPI-Platform)** by @r3pr3ss10n (for Android, macOS, Windows)
- **[GhosTCP](https://github.com/macronut/ghostcp)** by @macronut (for Windows)
- **[ByeDPI](https://github.com/hufrea/byedpi)** for Linux/Windows + **[ByeDPIAndroid](https://github.com/dovecoteescapee/ByeDPIAndroid/)** for Android (no root)
- **[youtubeUnblock](https://github.com/Waujito/youtubeUnblock/)** by @Waujito (for OpenWRT/Entware routers and Linux)