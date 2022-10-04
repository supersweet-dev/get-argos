# I made a script that will install Argos for you!


 in order for it to work you need to have wsl up and running and take care of everything that happens windows side on your own, but this will go through everything else 
 

please navigate to whichever folder you use for this class (in my case that's `~/Documents/projects/robotics`) 
and then run this command: 

`wget --no-cache "https://raw.githubusercontent.com/supersweet-dev/get-argos/master/get-argos.sh"` 
which will download my script for you 


then tell your computer that you indeed do trust me very much `sudo chmod u+x get-argos.sh` and after that if you run `./get-argos.sh` you will see that nothing happens


use `./get-argos.sh -h` instead to read about how this tool actually works 

`./get-argos.sh -i` will take care of the installation on native ubuntu and macos

`./get-argos.sh -w` will go through the same install, but it will do some wsl only commands first

 `./get-argos.sh -c` will undo everything this installer did in case you wanna start from scratch again 
 
 using `-c` on ubuntu will uninstall every library argos needs so, just make sure you reinstall everything you need for your other projects after using it 
 read the script by opening it with your text editor of choice so you can see exactly what's going on 
 
 
 this was tested on an m1 mac and on a fresh install of ubuntu so if there's any issues when you try to use it on wsl let me know and we can work through it
