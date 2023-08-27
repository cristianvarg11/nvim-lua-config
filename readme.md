# nvim

## This is my configuration for neovim :shipit:

### Dependencies

1. Install [neovim](https://archlinux.org/packages/community/x86_64/neovim/) package, in this case, I use ArchLinux.

   > sudo pacman -S neovim

2. It's necessary to have installed _**yarn**_ in the system, because several plugins use it, for example, Prettier.

   > npm i -g yarn

3. To install the plugins on nvim, it's necessary install [Packer](https://github.com/wbthomason/packer.nvim)

4. In order to see the icons in the navigation tree, we need some sources, some DE or distros already have them, in my case I use I3 and it is necessary to install the following:
   > yay -S nerd-fonts-meta otf-powerline-symbols-git ttf-all-the-icons ttf-devicons ttf-material-design-icons ttf-weather-icons
