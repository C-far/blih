#!/bin/bash
## setup.sh for git-epitech in /home/dugal_c/rendu/git-epitech
## 
## Made by Clement DUGAL
## Login   <dugal_c@epitech.net>
## 
## Started on  Wed May 14 10:29:22 2014 Clement DUGAL
## Last update Wed May 14 13:35:13 2014 Clement DUGAL
##

info()
{
    echo "$1"
}

error()
{
    echo "ERREUR: $1"
}

check_root()
{
    if [ `whoami` = 'root' ]; then
	error "Vous ne devez pas lancer ce script en root"
	exit
    fi
}

get_md5()
{
    md5sum $1 | cut -d ' ' -f1
}

check_file()
{
    if [ ! -f /usr/bin/$1 ] || [ ! `get_md5 /usr/bin/$1` = `get_md5 files/$1` ]; then
	info "Copie de $1..."
	sudo cp files/$1 /usr/bin/
    fi
}

copy_files()
{
    check_file rendu
    check_file rendu_init
    check_file rendu_lib
    check_file blih
}

generate_sshkey()
{
    if [ ! -f ~/.ssh/id_rsa ]; then
	info "Generation d'une cle SSH.."
	echo ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
    fi
}

upload_sshkey()
{
    info "Upload de votre cle publique..."
    blih sshkey upload ~/.ssh/id_rsa.pub
}

main()
{
    check_root
    copy_files
    generate_sshkey
    upload_sshkey
}

main
