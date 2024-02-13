# NitelOS-1.0
Very primitive Assembly OS. Made on Ubuntu
# How to convert it? 
I was using Ubuntu 22.04.3 LTS 64-BIT to compile it. You don't need to use Ubuntu, but Linux has a convert command (cat) preview: **cat boot.bin kernel.o > os.img**
You can use this command in Terminal (Shell) 
I used NASM and GCC

### Update needed to install apt
```
sudo apt-get update -y
```
### NASM install command
```
sudo apt-get install -y nasm
```
### GCC install command
```
sudo apt install build-essential
```

## **Commands to convert Assembly**
```
nasm -f bin -o boot.bin boot.asm
```
```
gcc -m32 -c -o kernel.o kernel.c
```
```
cat boot.bin kernel.o > os.img
```
>*cat command is only avalible at Linux

# Just download the .img file
But if you want to just test this abomination of OS you can download the .img file. 
**warning, this os is shit**

and yeah... this system is just a notepad without saving feature, so basically it's useless....
### have fun!
