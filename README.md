# Commandr
A simple, GTK session manager application that allows for logging off, restarting, shutting down, etc. Written in Haskell. \
\
Credit to Derek Taylor (DistroTube) for his video on creating an application like this. [Link to DistroTube's Video](https://www.youtube.com/watch?v=ViW-bcNQ6Lc)

## Installation instructions
1. Install Haskell Stack: `curl -sSL https://get.haskellstack.org/ | sh`. For more info, look at the documentation for installing Haskell Stack [here](https://docs.haskellstack.org/en/stable/install_and_upgrade/)
2. Clone the git repository for Commandr, then `cd` into it
```
git clone https://github.com/cjdelee/commandr
cd commandr
```
3. Run `stack install` to compile and install Commandr. This will create an executable in your `$PATH/.local/bin` directory
4. Make sure this directory is added to your `PATH` environment variable. This will be found in your `.bashrc` file (or `.zshrc` if you are using the ZSH shell)
    * Open your `.bashrc`/`.zshrc` file in a text editor
    * Find the section that contains a series of lines beginning with `export`. This should be close to the top of the file
    * Add the following and write out the file:
    ```lang-bash
    export PATH="$HOME/.local/bin:$PATH"
    ```
5. Run Commandr from the terminal with the `commandr-exe` command
___
## TODO
- [ ] Figure out how recursion works to clean up the code
- [ ] Update the UI so it looks nicer
- [ ] Figure out how to set up user configuration to allow for custom color schemes
- [ ] Add more tools, such as volume and brightness sliders, WiFi button
