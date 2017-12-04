# dotfiles
an attempt at macos/linux dotfiles

I want everything to be the same regardless of what system I am on, if possible (i.e. when my home dir is on NFS on Linux). If that comes at the expense of features, that's fine, since I mainly want syntax and colors configured, not really any plugins or anything. This setup's goal is to be as portable as possible. I may at some point do some system specific configs..

Each app has a directory of config files, those are then `stow $APP` linked from the dotifles directory back to my home directory. See: http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
