Multi30k Data Repository
--

### Getting ready

Along with the data files, we also provide:
  - subword-nmt as a GIT submodule
  - A recent (December 2017) snapshot of Moses preprocessing scripts

under [scripts/](scripts/) in order to minimize processing differences across
the users.

In order to fetch everything correctly, you need to clone the repository with `--recursive` flag:

```
$ git clone --recursive https://github.com/multi30k/dataset.git multi30k-dataset
```

### Task 1

- Raw files under [data/task1/raw](data/task1/raw)
- Tokenized files under [data/task1/tok](data/task1/tok). These files were
  produced with the preprocessing script [scripts/task1-tokenize.sh](scripts/task1-tokenize.sh).

#### Statistics

```
train
 (en) 29000 sentences, 377534 words, 13.0 words/sent
 (de) 29000 sentences, 360706 words, 12.4 words/sent
 (fr) 29000 sentences, 409845 words, 14.1 words/sent
 (cs) 29000 sentences, 297212 words, 10.2 words/sent
val
 (en) 1014 sentences, 13308 words, 13.1 words/sent
 (de) 1014 sentences, 12828 words, 12.7 words/sent
 (fr) 1014 sentences, 14381 words, 14.2 words/sent
 (cs) 1014 sentences, 10342 words, 10.2 words/sent
test_2016_flickr
 (en) 1000 sentences, 12968 words, 13.0 words/sent
 (de) 1000 sentences, 12103 words, 12.1 words/sent
 (fr) 1000 sentences, 13988 words, 14.0 words/sent
 (cs) 1000 sentences, 10497 words, 10.5 words/sent
test_2017_flickr
 (en) 1000 sentences, 11376 words, 11.4 words/sent
 (de) 1000 sentences, 10758 words, 10.8 words/sent
 (fr) 1000 sentences, 12596 words, 12.6 words/sent
test_2017_mscoco
 (en) 461 sentences, 5239 words, 11.4 words/sent
 (de) 461 sentences, 5158 words, 11.2 words/sent
 (fr) 461 sentences, 5710 words, 12.4 words/sent
```
