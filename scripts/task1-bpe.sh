#!/bin/bash
export LC_ALL=en_US.UTF_8

# BPE related variables
BPE_MOPS=

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -m|--merges)
      BPE_MOPS="$2"
      shift 2
      ;;
    *)
      echo "Error: Unknown option '$1'"
      exit 1
      ;;
esac
done

if [ -z $BPE_MOPS ] ; then
  echo "Usage: $0 -m merge_ops"
  exit 1
fi


ROOT=./data/task1
PAIRS=./data/task1/pairs
LANGS=`tr '-' '\n' < $PAIRS | sort -u`
TRGLANGS=`cut -d'-' -f2 < $PAIRS | sort -u`

TOK=${ROOT}/tok
BPE=${ROOT}/bpe${BPE_MOPS}

BPEPATH="./scripts/subword-nmt"
BPEAPPLY=${BPEPATH}/apply_bpe.py
BPELEARN=${BPEPATH}/learn_joint_bpe_and_vocab.py

SUFFIX="lc.norm.tok"

# Create folders
mkdir -p $BPE &> /dev/null

#####
# BPE
#####
for TLANG in $TRGLANGS; do
  LPAIR="en-${TLANG}"
  mkdir -p "${BPE}/${LPAIR}" &> /dev/null
  BPEFILE="${BPE}/${LPAIR}/codes"
  if [ -f $BPEFILE ]; then
    continue
  fi

  $BPELEARN -s $BPE_MOPS -o $BPEFILE \
    --input ${TOK}/train.${SUFFIX}.en \
            ${TOK}/train.${SUFFIX}.${TLANG} \
    --write-vocabulary \
            "${BPE}/${LPAIR}/vocab.en" "${BPE}/${LPAIR}/vocab.$TLANG" &
done
wait

# Apply for all pairs separately
for LPAIR in `cat $PAIRS`; do
  BPEFILE="${BPE}/${LPAIR}/codes"

  for TYPE in "train" "val" "test_2016_flickr" "test_2017_flickr" "test_2017_mscoco"; do
    # Iterate over languages
    for LLANG in `echo $LPAIR | tr '-' '\n'`; do
      INP="${TOK}/${TYPE}.${SUFFIX}.${LLANG}"
      OUT="${BPE}/${LPAIR}/${TYPE}.${SUFFIX}.bpe.${LLANG}"
      if [ -f $INP ] && [ ! -f $OUT ]; then
        echo "Applying BPE to $INP"
        $BPEAPPLY -c $BPEFILE --vocabulary \
          "${BPE}/${LPAIR}/vocab.${LLANG}" < $INP > $OUT &
      fi
    done
  done
done
wait
