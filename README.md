# Dotfiles config
My personal zsh, vim, git and tmux configuration.

### Prerequisites
- BASH
- GIT
- ZSH
- VIM
- TMUX
- RCM

### Basic Installation

Go to the directory where you want to install these dotfiles and install by running one of the following commands in your terminal. IMPORTANT: Do not run this command in your home directory, that is where the thoughtbot dotfiles directory will be installed.

#### Using curl

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/drieshooghe/dotfiles/master/install.sh)"
```

#### Using wget

```bash
bash -c "$(wget https://raw.githubusercontent.com/drieshooghe/dotfiles/master/install.sh -O -)"
```

### Managing configuration

Since this configuration is based on thoughtbot's dotfiles, you can use the [management suite](https://github.com/thoughtbot/rcm) it comes with.

#### Update
```bash
rcup
```

#### List dotfiles
```bash
lsrc
```

### Acknowledgements

Credit where credit is due.
In v2 a lot of the installation logic is based on the [dotfiles repo of Lowie Huyghe](https://github.com/LowieHuyghe/dotfiles).

The dotfiles configuration itself is an extension of the [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles).
