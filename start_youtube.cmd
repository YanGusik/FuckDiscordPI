set argument=-5 -e 1 --reverse-frag --wrong-chksum ^
--fake-from-hex 1603030135010001310333424143facf5c983ac8ff20b819cfd634cbf5143c0005b2b8b142a6cd335012c220008969b6b387683dedb4114d466ca90be3212b2bde0c4f56261a9801 ^
--fake-gen 5 --set-ttl 3 -q --blacklist ..\..\..\list-youtube.txt

PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
PUSHD "bin/goodbyedpi/%_arch%"

start "" goodbyedpi.exe %argument%

POPD
POPD