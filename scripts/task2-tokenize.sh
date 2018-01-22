#!/bin/bash
export LC_ALL=en_US.UTF_8

if [ ! -d scripts ]; then
  echo "You should run this script from the root git folder."
  exit 1
fi

# Raw files path
RAW=./data/task2/raw
TOK=./data/task2/tok

mkdir -p $TOK &> /dev/null

# Set path to Moses clone
MOSES="scripts/moses-3a0631a/tokenizer"
export PATH="${MOSES}:$PATH"

SUFFIX="lc.norm.tok"

##############################
# Preprocess files in parallel
##############################
for TYPE in "train" "val" "test_2016"; do
  for LLANG in en de; do
    for SPLIT in `seq 5`; do
      INP="${RAW}/${TYPE}.${SPLIT}.${LLANG}.gz"
      OUT="${TOK}/${TYPE}.${SUFFIX}.${SPLIT}.${LLANG}"
      if [ -f $INP ] && [ ! -f $OUT ]; then
        zcat $INP | lowercase.perl | normalize-punctuation.perl -l $LLANG | \
            tokenizer.perl -l $LLANG -threads 2 > $OUT &
      fi
    done
  done
done
wait
