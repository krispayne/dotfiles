# dotfiles
Each app has a directory of config files, those are then `stow $APP` linked from the .dotfiles directory back to my home directory. See: http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

Here's how I do it:

```
git clone repo .dotfiles
cd .dotfiles
stow vim
stow zsh
stow tmux
```
etc
