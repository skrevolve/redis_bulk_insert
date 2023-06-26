#! /bin/bash
set -- $(getopt t "$@")

case $1 in
    -t)
        if [ "$3" != "cli" ] && [ "$3" != "com" ]; then
            if [ -z "$3" ]; then
                echo you have to choice below
            else
                echo $3 is wrong value
                echo -e "you have to choice below by option -t with cli or com"
            fi
            echo "case1) ./make.sh -t cli"
            echo "case2) ./make.sh -t com"
            exit 0
        fi
        ;;
    --)
        exit 0
        ;;
    *)
        echo $1 is not an option
        exit 0
        ;;
esac

read -p "Command : " command
read -p "Key : " key
read -p "Score: " score
read -p "Member: " member
read -p "Range: " range

type="$3"
i=0

if [ $type = "cli" ]; then
    while [ $i -lt $range ]
    do
        echo $command $key $score${i} $member${i} >> ./cli-pipe.txt
        i=`expr $i + 1`
    done
else
    printf '%s ' $command $key >> ./command.txt
    while [ $i -lt $range ]
    do
        printf '%s ' "$score${i} '$member${i}'" >> ./command.txt
        i=`expr $i + 1`
    done
fi

wait

echo "All process are done"

exit 0