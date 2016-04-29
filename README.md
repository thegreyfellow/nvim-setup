## NeoVim .vimrc - Full Featured Setup for Ubuntu 16.04

Standard NeoVim install on Ubuntu 16.04, via this ppa:
https://launchpad.net/~neovim-ppa

This `rc` setup includes the following packages:
- vim-litecorrect
- vim-lexical
- vim-pencil 
- hexmode
- deoplete-ternjs
- vim-qml
- deoplete-go
- deoplete.nvim
- nerdtree
- goyo.vim
- matchem
- deoplete-jedi
- supertab
- vim-surround
- neomake
- vim-indent-guides
- vim-pug
- vim-airline
- vim-easy-align
- ag.vim

Location for files is `~/.config/nvim/` , with `~/.config/nvim/init.vim`
replacing the conventional `~/.vimrc`

Important: NeoVim requires the installation of `xsel` to provide clipboard
functionality: 

```
$ sudo apt install xsel 
```

which provides copy with `"+y`, and paste with the mouse or `Ctrl
+ v`, to move content between programs like any gui app.

For best use with JavaScript/ES5+, install NodeJS (with nvm or other
appropriate tool) and use `npm` to install `ternjs` and `eslint` globally.
