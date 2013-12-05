#!/bin/sh

dest="/Users/rlovin/fastscratch"
results=$(ls -d -lhtr $PWD/Finished/* | awk '{print $9}' | tail -$1)

function ask()
{
echo ""
echo "Would you like to unrar these files to $dest?"
echo ""
select yn in "Yes" "No"; do
    case $yn in
        Yes ) dothatthing; break;;
        No ) exit;;
    esac
done
}


function unpack()
{
    unrar x $path/*.rar $dest
}

function dothatthing()
{
    for path in $results
    do
	echo $path/*.rar
	unpack $path $dest
    done
}

function main()
{
    echo "-----------------------------------------------------------------------------"
    ls -d -lhtr $PWD/Finished/* | awk '{print $6, $7, " ", $9}' | tail -$1
    echo "-----------------------------------------------------------------------------"
    ask #AX YO QUESTION!
}

if [ -z "$1" ]; then
    echo "-----------------------------------------------------------------------------"
    echo "No count supplied."
    echo "Usage: ./script <number of results>"
    echo "Example: ./script 5"
    echo "-----------------------------------------------------------------------------"
else
	main $1
fi
