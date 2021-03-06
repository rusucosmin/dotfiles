#Dotfiles
This repository contains my dotfiles

###What dotfiles are included?
- i3 -> my i3 windows manager config
- zsh -> my zshrc,  oh-my-zsh and plugins I use
- vim -> my vimrc, and the plugins I use
- wallpapers -> various wallpapers
- [deprecated]bash -> bashrc, bash_aliases, bash_profile
- git -> my gitconfig file


###How to install it?
- Clone
    - This repository contains various other repositories(for plugins and stuff), so we must clone all of them.
    - This is how you clone every repository (including this one) at once
    ```
    git clone --recursive https://github.com/rusucosmin/dotfiles
    ```
    - However, for an already cloned repository, one can run the following lines:
    ```
    git clone https://github.com/rusucosmin/dotfiles
    cd dotfiles
    git submodule update --init
    ```
- Install
    - In order to install the dotfiles, you just have to run the script:
    ```
    ./install.sh
    ```
    - All your dotfiles will be save in the folder dotfiles_old, so you won't loose your current config.

###How does it look like with a fresh install?
![Background](https://raw.githubusercontent.com/rusucosmin/dotfiles/master/screenshots/bg.png)
![Lock](https://raw.githubusercontent.com/rusucosmin/dotfiles/master/screenshots/lock.png)
![Terminal](https://raw.githubusercontent.com/rusucosmin/dotfiles/master/screenshots/cmdline.png)
![Colorize Zsh](https://raw.githubusercontent.com/rusucosmin/dotfiles/master/screenshots/colorize_zsh.png)
![Vim start](https://raw.githubusercontent.com/rusucosmin/dotfiles/master/screenshots/vim-start.png)
![Vim 1](https://raw.githubusercontent.com/rusucosmin/dotfiles/master/screenshots/vim1.png)
![Vim 2](https://raw.githubusercontent.com/rusucosmin/dotfiles/master/screenshots/vim2.png)
