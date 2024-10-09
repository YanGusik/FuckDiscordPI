set name=fuckdiscordpi
set args=--wf-tcp=443-65535 --wf-udp=443-65535 ^
--filter-udp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%~dp0quic_initial_www_google_com.bin" --new ^
--filter-tcp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%~dp0tls_clienthello_www_google_com.bin"

net stop "%name%"
sc delete "%name%"
sc create "%name%" binPath= "%~dp0winws.exe %args%" DisplayName= "FuckDiscordPi: Discord Service (YanGusik)" start= auto
sc description "%name%" "FuckDiscordPi: Discord service use zapret DPI bypass software"
sc start "%name%"