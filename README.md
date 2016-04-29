## NeoVim .vimrc - Full Featured Setup for Ubuntu 16.04

Standard NeoVim install on Ubuntu 16.04, via this ppa:
https://launchpad.net/~neovim-ppa

This `rc` setup includes the following packages:
- ag.vim
- deoplete-go
- deoplete-jedi
- deoplete-ternjs
- deoplete.nvim
- goyo.vim
- hexmode
- matchem
- neomake
- nerdtree
- supertab
- vim-airline
- vim-easy-align
- vim-indent-guides
- vim-lexical
- vim-litecorrect
- vim-pencil 
- vim-pug
- vim-qml
- vim-surround

Location for files is `~/.config/nvim/` , with `~/.config/nvim/init.vim`
replacing the conventional `~/.vimrc`

Important: NeoVim requires the installation of `xsel` to provide clipboard
functionality: 

```
$ sudo apt install xsel 
```

which provides copy with `"+y`, and paste with the mouse or `Ctrl+v`, to
move content between programs like any gui app.

For best use with JavaScript/ES5+, install NodeJS (with nvm or other
appropriate tool) and use `npm` to install `ternjs` and `eslint` globally.
