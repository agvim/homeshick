homeshick [![Build Status](https://travis-ci.org/andsens/homeshick.png?branch=development)](https://travis-ci.org/andsens/homeshick)
=========

This fork adds support for executing update and install scripts and for
packaging the castles for an offline machine.

In Unix, configuration files are king.
Tailoring tools to suit your needs through configuration can be empowering.
An immense number of hours is spent on getting these adjustments just right,
but once you leave the confines of your own computer, these local optimizations are left behind.

By the power of git, homeshick enables you to bring the symphony of settings
you have poured your heart into with you to remote computers.
With it you can begin to focus even more energy on bettering your work environment
since the benefits are reaped on whichever machine you are using.

However bare bones these machines are, provided that at least Bash 3 and Git 1.5 are available you can use homeshick.
homeshick can handle multiple dotfile repositories. This means that you can install
larger frameworks like [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
or a multitude of emacs or vim plugins alongside your own customizations without clutter.

For detailed [installation instructions](https://github.com/andsens/homeshick/wiki/Installation), [tutorials](https://github.com/andsens/homeshick/wiki/Tutorials) and [tips](https://github.com/andsens/homeshick/wiki/Automatic-deployment) & [tricks](https://github.com/andsens/homeshick/wiki/Symlinking) have a look at the [wiki](https://github.com/andsens/homeshick/wiki).

Quick install
-------------

homeshick is installed to your own home directory and does not require root privileges to be installed.
```sh
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
```
*Note: If you'd like to help testing new features before they are released use `git clone --branch testing https://...`*

To invoke homeshick, source the `homeshick.sh` script from your rc-script:
```sh
# from sh and its derivates (bash, dash, ksh, zsh etc.)
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
# csh and derivatives (i.e. tcsh)
printf '\nalias homeshick source "$HOME/.homesick/repos/homeshick/homeshick.csh"\n' >> $HOME/.cshrc
# fish shell
echo \n'source "$HOME/.homesick/repos/homeshick/homeshick.fish"' >> "$HOME/.config/fish/config.fish"
```

Install scripts
---------------

When a castle is being cloned, homeshick checks for an oninstall.sh script on the root of the castle before symlinkng the castle.

If the script is present, you are asked whether you want to run it.
The script is run without arguments.

Update scripts
--------------

When a castle is being pulled, homeshick checks for an onupdate.sh script on the root of the castle.

If the script is present, you are asked whether you want to run it.
The script is run with a 1 argument if the castle has been updated in this pull or with a 0 argument otherwise.

Offline command
---------------

`homeshick offline make` command can be used to create environment.tbz bundles.

They are created by executing the makeoffline.sh scripts in each castle and copying the castles.
makeoffline.sh receives as its argument the temporary folder where the offline bundle is being created.
The result is compressed in a tbz that can be decompressed in a home directory of a machine without network access.

`homeshick offline deploy` just relinks the homeshick castles

Contributing
------------

Before submitting pull requests or reporting bugs, please make sure to read
the [contribution guidelines](CONTRIBUTING.md).
