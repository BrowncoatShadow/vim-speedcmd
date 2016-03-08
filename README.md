# vim-speedcmd
This is a vim plugin that allows you to define a list of commands, which you can
pull up in a menu with a hotkey. Commands can be quickly tweaked for a one-off
run.


## Installation
You can install using your favorite plugin manager. Here is an example using
VimPlug.
> Add this to your `.vimrc`:
```vim
Plug 'BrowncoatShadow/vim-speedcmd'
```
> Then run these vim commands:
```vim
:source %
:PlugInstall
```

Alternitively, you can manually install the plugin in your vim's runtime path.
```sh
mkdir -p ~/.vim/plugin
cd ~/.vim/plugin
wget https://raw.githubusercontent.com/BrowncoatShadow/vim-speedcmd/master/plugin/speedcmd.vim
```


## Configuration
You will need to define the commands for the menu and a hotkey to open the
command. Here is a sample for you to base your configuration off of.
```vim
" commands are defined in the variable `g:speedcmd_menu` as an array
let g:speedcmd_menu = [
  \ '%s/\s\+$//g                      " remove trailing whitespaces',
  \ 'v/./.,/./-1join                  " collapse empty lines',
  \ '%s/\$\([a-zA-Z0-9_]\+\)/${\1}/g  " encase bash variables with curly brackets',
\ ]

" map a key to call the main function
map <F1> :call SpeedCmd()<CR>
```


## Usage
You can pull up the command menu using your defined hotkey. The menu will show nine lines at a time and can be scrolled. You can enter insert mode to edit a command before running it.
- `Enter` will run the current line in both normal and insert mode.
- The number keys `1-9` will run the numbered line.
- `q` will close the menu without running a command.
