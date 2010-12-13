#!/bin/sh
dir=`dirname "$0"`
dryrun="-n";
if [ -z "$1" ] ; then
	dryrun="-n"
elif [ "$1" == "-f" ] ; then
	dryrun=""
	shift
elif [ "$1" == "-h" ] ; then
	echo "usage: "
	echo "$0 [-f] [SOURCE] [DEST]"
	exit 0
fi		
src="$1"
dst="$2"
[ -z "$dst" ] && dst="$dir"
[ -z "$src" ] && src="$dir/../loseplace"
filelist="losebox.lst"
rsync="rsync --verbose --files-from=$filelist -au"
echo "$src <=> $dst"
#echo "generating files list (filelist.txt) ..."
#find . ! -wholename '.' ! -wholename './.git/*' ! -wholename './.git' | sed -e 's/^.\///' >$filelist
echo "rsync from $src to $dst ..."
$rsync $dryrun "$src" "$dst"
echo "rsync from $dst to $src ..."
$rsync $dryrun "$dst" "$src"
