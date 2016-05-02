## NeoVim .vimrc - Full Featured Setup for Ubuntu 16.04

Standard NeoVim install on Ubuntu 16.04, via this ppa:
https://launchpad.net/~neovim-ppa

Location for files is `~/.config/nvim/` , with `~/.config/nvim/init.vim`
replacing the conventional `~/.vimrc`

Also included are resources to make a desktop launcher, complete with
a scaled version of the icon. Move the `.desktop` files to: 

``` 
$ ~/.local/share/applications/
```

...and move the `.png` icon to:

```
$ ~/.local/share/icons/ 
```

... then set your preferences for opening files accordingly, search for
NeoVim and add the program to the launcher.

The `.nvimrc` setup includes the following packages:
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


Important: NeoVim requires the installation of `xsel` to provide clipboard
functionality: 

```
$ sudo apt install xsel 
```

which provides copy with `"+y`, and paste with the mouse or `Ctrl+v`, to
move content between programs like any gui app.

For best use with JavaScript/ES5+, install NodeJS (with nvm or other
appropriate tool) and use `npm` to install `ternjs` and `eslint` globally.
