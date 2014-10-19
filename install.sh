#!/usr/bin/env sh

# chdir to script dir
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd $dir

usage()
{
cat << EOF
usage: $0 options

This script can be installed local ($HOME) or global.

OPTIONS:
   -h      Show this message
   -l      install local ($HOME/.jk-sys)
   -g      install global (/opt/jk-sys)
   -v      Verbose

EOF
}

GLOBAL=
LOCAL=
VERBOSE=

while getopts “ghlv” OPTION
do
case $OPTION in
 g)
     GLOBAL=1
     ;;
 h)
     usage
     exit 1
     ;;
 l)
     LOCAL=1
     ;;
 v)
     VERBOSE=1
     ;;
 ?)
     usage
     exit
     ;;
esac
done

if [[ -z $GLOBAL ]] && [[ -z $LOCAL ]]; then
  usage
  exit 1
fi

if [[ -n $GLOBAL ]] && [[ -n $LOCAL ]]; then
  echo "ERROR: You can install only global OR local"
  usage
  exit 1
fi

if [[ -n $VERBOSE ]]; then
  if [[ -n $GLOBAL ]]; then
    echo "vim - starting global install..."
  else 
    echo "vim - starting local install..."
  fi
fi


if [[ -n $VERBOSE ]]; then
  echo "Detected User: $LOGNAME"
fi

VIM=`which vim`
if [[ ! $VIM =~ 'vim' ]]; then 
  echo "no vim found, perhaps you should try to install it."
  exit -1
fi

if [[ -n $VERBOSE ]]; then
  echo "vim found at: $VIM"
fi

DEST=$HOME

if [[ -n $GLOBAL ]]; then
  DEST="/etc"
  echo "TODO: global install... not ready yet!"
  exit -1
fi


TODAY=`date +%Y%m%d`
FILES="$dir/dotfiles/*"

####
# link all files in ./dotfiles to $HOME or /etc
# backup files that are already there

for rcfile in $FILES; do
  # split path and file name
  file=${rcfile##*/}
  DESTFILE=
  if [[ -n $GLOBAL ]]; then
    DESTFILE="$DEST/$file"
  else
    DESTFILE="$DEST/.$file"
  fi
  if [[ -z $NOBACKUP ]]; then
    MVARG=
    if [[ -n $VERBOSE ]]; then
      MVARG=-v
      [ -e $DESTFILE ] && echo "backing up $DESTFILE"
    fi

    [ -e $DESTFILE ] && mv $MVARG $DESTFILE $DESTFILE.$TODAY
  fi
  ln -s "$rcfile" $DESTFILE
done

###
# prepare vim directory


