#!/bin/bash
## setup.sh for git-epitech in /home/dugal_c/rendu/git-epitech
## 
## Made by Clement DUGAL
## Login   <dugal_c@epitech.net>
## 
## Started on  Wed May 14 10:29:22 2014 Clement DUGAL
## Last update Wed May 14 11:46:38 2014 Clement DUGAL
##

info()
{
    echo "INFO: $1"
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

copy_files()
{
    if [ ! -f /usr/bin/rendu ]; then
	info "Copie de rendu..."
	sudo cp files/rendu /usr/bin/
    elif [ ! -f /usr/bin/rendu_init ]; then
	info "Copie de rendu_init..."
	sudo cp files/rendu_init /usr/bin/
    elif [ ! -f /usr/bin/rendu_lib ]; then
	info "Copie de rendu_lib..."
	sudo cp files/rendu_lib /usr/bin/
    elif [ ! -f /usr/bin/blih ]; then
	info "Copie de blih..."
	sudo cp files/blih /usr/bin/
    fi
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
