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

![Add Launcher](./launcheradd.gif)

The `init.vim` setup includes the following packages:
- ag.vim
- deoplete-go
- deoplete-jedi
- deoplete-ternjs
- deoplete
- goyo
- hexmode
- matchem
- neomake
- nerdcommenter
- nerdtree
- supertab
- vim-ace
- vim-action-ag
- vim-airline
- vim-easy-align
- vim-gitgutter
- vim-go
- vim-indent-guides
- vim-lexical
- vim-litecorrect
- vim-pencil
- vim-pug
- vim-qml
- vim-startify
- vim-surround

### Setup

Getting most of the plugins working requires only running `:PlugInstall`
when using `nvim` for the first time. However, a few other steps need to
be taken to enable all features of this setup.

**Deoplete:** Getting autocomplete and suggetions with deoplete is quite
easy. At the command line install `pip` for both python 2 and 3, and the
`neovim` package for each:

```
$ sudo apt install python-pip python3-pip
$ sudo pip2 install --upgrade neovim
$ sudo pip3 install --upgrade neovim
```

Once in `nvim`, run `:UpdateRemotePlugins`, restart, and deoplete will be working.

**vim-go:** This is a package that provides a crazy level of functionality
for go-lang development. First, make sure your $GOPATH is set; this is
requisite for a working go-lang setup, so at some point it needs to be
done. Usually, it's `/home/$USER/.go/`. Once in `nvim`, run
`:GoInstallBinaries`, done.

**Cut & Paste:** NeoVim requires the installation of `gpm` to provide
clipboard functionality:

```
$ sudo apt install gpm
```

which provides copy of the highlighted content with a left mouse click,
and will paste from the regular buffer into INSERT mode with a middle
click.

**JavaScript/ES5+:** Install NodeJS (with a tool like
[nvm](https://github.com/creationix/nvm)) and use `npm` to install
`ternjs` and `eslint` globally. Both `tern` and `eslint` require
configuration before they will work. Included is a very basic
`.tern-config` file which you can put in your `$HOME` directory for
a global basic configuration. 
