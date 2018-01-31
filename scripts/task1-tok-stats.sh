#!/bin/bash

# Run from main GIT folder
pushd data/task1/tok

for split in train val test_2016_flickr test_2017_flickr test_2017_mscoco; do
  echo "$split"

  for lang in en de fr cs; do
    WC=`cat ${split}.lc.norm.tok.${lang} | wc`
    N_SENTS=`echo $WC | cut -d' ' -f1`
    N_WORDS=`echo $WC | cut -d' ' -f2`
    N_WORD_PER_SENT=`python3 -c "print('%.1f' % (${N_WORDS} / ${N_SENTS}))"`
    echo " ($lang) $N_SENTS sentences, $N_WORDS words, $N_WORD_PER_SENT words/sent"
  done
done
