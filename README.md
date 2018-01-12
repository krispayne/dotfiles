# dotfiles
an attempt at macos/linux dotfiles

I want everything to be the same regardless of what system I am on, if possible (i.e. when my home dir is on NFS on Linux). If that comes at the expense of features, that's fine, since I mainly want syntax and colors configured, not really any plugins or anything. This setup's goal is to be as portable as possible. I may at some point do some system specific configs.

The terminal-apps directory has configurations for the different terminal emulators I end up using (Terminal.app, xfce4 Terminal, iTerm2). There's also somewhat of a bootstrap script for macOS in the Terminal.app directory. Don't expect greatness. it's essentially a re-worked fork of the famed mathias osx.defaults.

Each app has a directory of config files, those are then `stow $APP` linked from the dotifles directory back to my home directory. See: http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

Here's how I do it:

`~/dotfiles/bash/.bash_profile -> ~/.bash_profile`

`cd ~/dotfiles`

`stow bash`
`stow tmux`
etc

