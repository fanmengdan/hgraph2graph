#!/bin/bash

DIR=$1
ST=$2
ED=$3

for ((i=ST; i<=ED; i++)); do
    f=$DIR/model.$i
    if [ -e $f ]; then
        echo $f
        python decode.py --test data/logp06/valid.txt --vocab ../rebuttal/data/logp06/vocab.txt --model $f --hidden_size 270 --embed_size 200 | python scripts/logp_score.py > $DIR/results.$i &
    fi
done
