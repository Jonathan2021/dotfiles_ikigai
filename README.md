```

██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝


    ____                __   __             __                             ____                __     __
   / __/____   _____   / /_ / /_   ___     / /____  _   __ ___     ____   / __/  ____ _ _____ / /_   / /
  / /_ / __ \ / ___/  / __// __ \ / _ \   / // __ \| | / // _ \   / __ \ / /_   / __ `// ___// __/  / / 
 / __// /_/ // /     / /_ / / / //  __/  / // /_/ /| |/ //  __/  / /_/ // __/  / /_/ // /   / /_   /_/  
/_/   \____//_/      \__//_/ /_/ \___/  /_/ \____/ |___/ \___/   \____//_/     \__,_//_/    \__/  (_)   
                                                                                                        

 i3             > tiling window manager
 bash           > bash settings, aliases, and custom prompts
 vim            > cli based text editor -> the ultimate weapon of choice 
 qutebrowser    > browser with vim like keybinds 
 sysinfo.sh     > custom neofetch like system info script 
 scripts        > system automation scripts and terminal fun
 compton        > minimal composite config for opacity
 figlet         > custom ascii font
 lolcat         > the rainbow effects
 nms            > the decryption effects
 taskwarrior    > todo list
 git            > global git config and aliases
 mpd            > music player daemon setup
 ncmpcpp        > ncurses mpc++ ui/color settings
 ranger         > file manager with image previews and vim keybinds
 urxvt          > terminal emulator 
 feh            > view images and set wallpaper 
 npm            > package manager for the JavaScript 
 rofi           > window switcher, application launcher and dmenu replacement 
 htop           > interactive system-monitor  
 zathura        > free, plugin-based document viewer 
 magick         > edit,convert and beautify your art
 lxappearance   > theme switcher for GTK+ 

★ \(‾▿‾\) ᴠɪᴍɪғʏ ᴇᴠᴇʀʏᴛʜɪɴɢ (/‾▿‾)/ ★
```
## table of contents
1. [intro](#intro)
1. [just a fair warning :D](#disclaimer)
1. [installing](#installing)
1. [how it works](#how-it-works)
1. [vim](#vim-plugins)
1. [a bit about the config](#about)
1. [previews](#previews)
1. [to be done after my exams](#to-be-done-after-my-exams)
1. [credits](#credits)
1. [license](#license)
1. [a final word](#spread-the-word)

# intro

The legend goes that dot-files arose from a bug in the earliest days of UNIX: in an effort to avoid listing the . and .. entries of a directory, the ls command skipped files that began with the '.' character. As a result, any file with a name beginning with '.' was not reported by ls, i.e. it was a "hidden" file. A user's home directory was a convenient place to put user-specific configuration files, but such files were also an eyesore; one popular solution to this problem was to make those configuration files hidden so that they wouldn't annoy the user. Thus, the tradition of dot-files was born.  

# disclaimer

* Basically, I am new to this dotfiles world, so i cant guarantee that everything works exactly as in mine 
* A lot more to be done. I have planned to do the [rest](#To-be-done-after-my-exams) after my exams are over
* My setup is heavily dependent on scripts : `~/dotfiles_ikigai/scripts/ `
* Yeah i do use and tweak other peoples dotfiles. It's more of like getting inspired `(~‾▿‾)~` 

# installing

Start by cloning the repo to the root of your home directory `~/dotfiles_ikigai` by `bash
cd ~ && git clone https://github.com/yedhink/dotfiles_ikigai` 

all the above mentioned application are necessary for proper working and usage of my config. most of packages could be easily installed, but finding some of those is a bit tricky. so here are the links to applications which i found hard to find in the first place :)  
* [nms](https://github.com/bartobri/no-more-secrets) -> decryption effects 
* [lolcat](https://github.com/busyloop/lolcat) -> rainbow effects  
* [task](https://taskwarrior.org/) -> todo list
* [zathura](https://pwmt.org/projects/zathura/installation/) -> my pdf viewer
* [figlet](http://www.figlet.org/) -> the 3D fonts

stow is available for all linux and most other unix like distributions via your package manager.

- `sudo pacman -S stow`
- `sudo apt-get install stow`
- `brew install stow`

or clone it [from source](https://savannah.gnu.org/git/?group=stow) and [build it](http://git.savannah.gnu.org/cgit/stow.git/tree/INSTALL) yourself.

# how it works

**note:** stow can only create a symlink if a config file does not already exist. if a default file was created upon program installation you must delete it first before you can install a new one with stow. this does not apply to directories, only files

by default the stow command will create symlinks for files in the parent directory of where you execute the command. so my dotfiles setup assumes this repo is located in the root of your home directory `~/dotfiles_ikigai`. and all stow commands should be executed in that directory. otherwise you'll need to use the `-d` flag with the repo directory location.

to install most of my configs you execute the stow command with the folder name as the only argument.

to install my **i3** configs use the command:

`stow i3`

this will symlink files to `~/.config/i3` and various other places.

**you can always look through all files and cherry pick the required files too , like i would've done `¯\_(ツ)_/¯` **

## vim-plugins

I make use of certain vim-plugins , which contributes to an easier workflow. My plugin manager is [Vundle](https://github.com/VundleVim/Vundle.vim) , so you will have to install that first.    
To install the plugins for yourself , use my .vimrc file. You can easily copy it to your home(~) directory. Then from vim last line mode execute `PluginInstall`. Ta da....!! Easy as it can
be.

# about

Some people fear the command line. Others consider it arcane and obsolete. Many of us know the truth, though; often, command line tools are just the right tools for the job.

My terminal emulator of choice is the lightweight, unicode, 256 color [urxvt](http://linux.die.net/man/1/urxvt). I make use of [bash](https://www.gnu.org/software/bash/) as my interactive shell. I love vim , thus i try to use applications which can support or can be configured to use vim like keybindings.

# previews

## custom neofetch like system information
A try at mimicking the colors of the [Flag of India](https://en.wikipedia.org/wiki/Flag_of_India) 

![](https://github.com/yedhink/dotfiles_ikigai/blob/master/clean.png "my neofetch")

## autostarting terminal after boot up
add any one of the applications you want on startup , to `~/dotfiles_ikigai/scripts/init_workspace.sh`  
**detailed comments are provided in the file**  

![](https://github.com/yedhink/dotfiles_ikigai/blob/master/dotfiles_startup.gif)

## the ultimate super user prompt :D
{♥‿♥} For me whenever I become "su", i need to be made aware of how "mighty" my powers are, since i've done stupid stuff before. :D

![](https://github.com/yedhink/dotfiles_ikigai/blob/master/dotfiles_su.gif)

## busy
vim, ranger, ncmpcpp, htop in action

![](https://github.com/yedhink/dotfiles_ikigai/blob/master/busy.png)

## almighty-vim
"So dark ! You sure you're not from the DC Universe?"

![](https://github.com/yedhink/dotfiles_ikigai/blob/master/vimqt.png)

## ncmpcpp - lightweight music player and visualizer
"And she's buying a Stairway to Heaven..."

![](https://github.com/yedhink/dotfiles_ikigai/blob/master/music.png)

## qutebrowser - with my precious dark theme that saves me from the evil light
"we wants it. we needs it. Must have the precious"   
make use of `~/dotfiles_ikigai/.config/qutebrowser/inspected_css/sd.css` for the theme

### privacy above all
![](https://github.com/yedhink/dotfiles_ikigai/blob/master/qtduck.png)

### isn't this soothing for your eyes? 
![](https://github.com/yedhink/dotfiles_ikigai/blob/master/qtgithub.png)

## fun part - ascii is pure art
All ascii scripts (which i collected from others) are available in the `scripts` folder

![](https://github.com/yedhink/dotfiles_ikigai/blob/master/funascii.png)


# to be done after my exams

- [ ] Try a different status bar 
- [ ] Try out Conky
- [ ] Better commented scripts :(

# credits

- Luke Smith really gave a great idea about what could be done in i3.

- Xero Harrison a.k.a xero literally blew my mind. Such wonderful scripts. Such creativity.

- addy-fe, Dylan, NerdyPepper and many other amazing guys from r/unixporn. I have used some of their dotfiles.

- Special mentions to addy-fe for a beautiful documention of his setup. Helped a lot!


# license  
This project is licensed under the MIT License - see the [LICENSE](https://github.com/yedhink/dotfiles_ikigai/blob/master/LICENSE) file for details

# spread the word
Liked the setup? Appreciate the effort? Just give the repository a star :star: and spread the word if you found it useful
