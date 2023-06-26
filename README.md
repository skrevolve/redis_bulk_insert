# redis-bulk-insert

https://redis.io/docs/manual/patterns/bulk-loading/

https://gist.github.com/Squab/52d42652719cc28451d7

## make resoure

```sh
sh make.sh -t cli # use cli-pipe in redis server
sh make.sh -t com # use command in redis console
> Command : ZADD
> Key : rank
> Score:
> Member: test_user_
> Range: 500
> All process are done
```

## check rows

```sh
wc -l cli-pipe.txt
> 500 cli-pipe.txt
```

## run command

```sh
# run python with redis-cli
time python redis-mass.py ./cli-pipe.txt | redis-cli --pipe
cat ./cli-pipe.txt | python redis-mass.py | redis-cli --pipe

# copy command and paste
vi ./command.txt
```
