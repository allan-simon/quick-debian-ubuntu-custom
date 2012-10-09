#!/bin/sh

if [ "$(id -u)" != "0" ]; then
    #write on stderr and exit
    #TODO maybe we should still be able to at least customize the current user
    #rather than quit
    echo "You should be root to execute this script" 1>&2
    exit 1
fi

# maybe add the -y to apt-get install only if this script is invocated with the -y flag
install_software() {

    # first install some tools
    apt-get -y install vim      #best editor ev4r (troll spotted)
    apt-get -y install zsh      #got much more advanced features than bash
    apt-get -y install htop     #a color and improved version of top
    apt-get -y install most     #a modern version of less and more
    apt-get -y install unp      #tool to extract any archive
    apt-get -y install bzip2    #permit to extra bz2 archive (unp use it)
    apt-get -y install sqlite3  #a simple to manipulate database
    apt-get -y install locate   #tools to search files

    # then some stuff related to programming
    apt-get -y install gcc gcc-4.7 clang automake autoconf \
                    cmake colordiff colormake python3 cppcheck \
                    gdb cgdb
                    

    # some stuff related to versionning
    apt-get -y install subversion git
    
}

put_zsh_conf_file() {
    chsh -s /usr/bin/zsh
    cp conf_files/zshrc ~/.zshrc
    cp conf_files/vimrc ~/.vimrc
}


install_software
put_zsh_conf_file

