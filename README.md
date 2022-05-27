# Commandr
A simple, GTK session manager application that allows for logging off, restarting, shutting down, etc. Written in Haskell. \
\
Credit to Derek Taylor (DistroTube) for his video on creating an application like this. [Link to DistroTube's Video](https://www.youtube.com/watch?v=ViW-bcNQ6Lc)

## Installation instructions
There are currently no distro packages for Commandr, so you will need to build the program using Haskell Stack:
1. Install Haskel Stack
```
curl -sSL https://get.haskellstack.org/ | sh
```
2. Clone the Commandr git repository to your Home directory, build Commandr with Stack, then move the binary
```
git clone https://github.com/cjdelee/commandr
cd commandr
stack install
sudo mv .local/bin/commandr-exe /usr/local/bin
```
3. Run Commandr from the terminal with the `commandr-exe` command. You could also create an alias in your .bashrc file and/or add a keybinding to your window manager/desktop environment
___
## TODO
- [ ] Figure out how recursion works to clean up the code
- [ ] Update the UI so it looks nicer
- [ ] Figure out how to set up user configuration to allow for custom color schemes
- [ ] Add more tools, such as volume and brightness sliders, WiFi button
