start "FuckDiscordPi: Discord (YanGusik)" /min "%~dp0winws.exe" ^
--wf-tcp=443-65535 --wf-udp=443-65535 ^
--filter-udp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=split2 --dpi-desync-split-pos=2 --wssize 1:8 --hostnospace--dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-65535 --dpi-desync=split2 --dpi-desync-split-pos=2 --wssize 1:8 --dpi-desync-any-protocol --dpi-desync-fake-quic="%~dp0quic_initial_www_google_com.bin" --new ^
--filter-tcp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=split2 --dpi-desync-split-pos=2 --wssize 1:8 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%~dp0tls_clienthello_www_google_com.bin"