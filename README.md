## nvim-setup
Standard NeoVim install on Ubuntu 15.10, via this ppa:
https://launchpad.net/~neovim-ppa

Location for files is `~/.config/nvim/` , with `~/.config/nvim/init.vim`
replacing the conventional `~/.vimrc`

Important: NeoVim absolutely requires the installation of `xsel`: 
```
$ sudo apt install xsel 
```
which provides copy and paste functionality
with the mouse, and transfering content between programs like any gui app.

For best use with JavaScript/ES5+, install NodeJS (with nvm or other
appropriate tool). 
