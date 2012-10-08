#!/bin/sh

if [ "$(id -u)" != "0" ]; then
    #write on stderr and exit
    #TODO maybe we should still be able to at least customize the current user
    #rather than quit
    echo "You should be root to execute this script" 1>&2
    exit 1
fi


install_software() {

    # first install some tools
    apt-get install vim zsh htop most sqlite3

    # then some stuff related to programming
    apt-get install gcc gcc-4.7 clang automake autoconf \
                    cmake colordiff colormake python3 cppcheck
                    

    # some stuff related to versionning
    apt-get install subversion git
    
}

put_zsh_conf_file() {
    chsh -s /usr/bin/zsh
    cp conf_files/zshrc ~/.zshrc
    cp conf_files/vimrc ~/.vimrc
}


install_software
put_zsh_conf_file

