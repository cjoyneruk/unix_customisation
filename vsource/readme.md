# Vsource

Simple bash function for creating, deleting and listing python virtual environments. Works by utilising the built in python virtual environment creation methodology, i.e. `python -m venv <path-to-env>`.

I created this because I prefer a stripped down approach to python environments and hence wanted to avoid installing conda. However I appreciated having a global storage and directory list of environments. This seemed to achieve the goal.

## Installation

To use make sure there exists a `~/.virtualenvs` directory. This is the directory that vscode looks for by default.

copy/move/symlink the `src/vsource.sh` file to `~/.config/vsource.sh` (or wherever you like) and add the line

```bash
source ~/.config/vsource.sh
```

to the .bashrc file. Make sure the file is executable as well.

## Usage

Issuing the comman

```
vsource
```

outputs the three options

```
Please use either
1. 'vsource create <venv>' to create a new virtual environment
2. 'vsource activate <venv>' to activate a virtual environment
3. 'vsource list' to view all environments
```

### Creation

To create a new virtual environment use the command

```
vsource create <venv>
```

This is will create new python environment at the location `~/.virtualenvs/<venv>` and activate

### Activation

To activate a virtual environment use the command

```
vsource activate <venv>
```

If it doesn't exists `vsource` will tell you so!

*Note that you can deactivate a virtual environment as normal by using the command `deactivate`*

### Listing

To list all available environments use

```
vsource list
```

This simply supplies an `ls` command to the directory `~/.virtualenvs`