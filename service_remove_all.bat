set name=fuckdiscordpi

net stop "zapret"
sc delete "zapret"
net stop "GoodbyeDPI"
sc delete "GoodbyeDPI"
net stop "%name%"
sc delete "%name%"