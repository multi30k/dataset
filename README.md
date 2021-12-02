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

### Visual features

Pre-extracted visual features can be [downloaded from Google Drive](https://drive.google.com/drive/folders/1I2ufg3rTva3qeBkEc-xDpkESsGkYXgCf?usp=sharing) and the raw images can be [requested here](https://forms.illinois.edu/sec/229675) for Flickr30k. `test_2017_flickr` and `test_2018_flickr` images can be downloaded from [here](https://drive.google.com/drive/folders/1kfgmYFL5kup51ET7WQNxYmKCvwz_Hjkt).

### Task 1

- Raw files under [data/task1/raw](data/task1/raw)
- Tokenized files under [data/task1/tok](data/task1/tok). These files were
  produced with the preprocessing script [scripts/task1-tokenize.sh](scripts/task1-tokenize.sh).

#### Multi30K 2018 test set

You can evaluate your model on the 2018 test sets using the ongoing [Codalab](https://competitions.codalab.org/competitions/19917) competition.

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
If you use these resources in your research, please consider citing the following papers:

English and German data:
```
@InProceedings{W16-3210,
  author = 	"Elliott, Desmond
		and Frank, Stella
		and Sima'an, Khalil
		and Specia, Lucia",
  title = 	"Multi30K: Multilingual English-German Image Descriptions",
  booktitle = 	"Proceedings of the 5th Workshop on Vision and Language",
  year = 	"2016",
  publisher = 	"Association for Computational Linguistics",
  pages = 	"70--74",
  location = 	"Berlin, Germany",
  doi = 	"10.18653/v1/W16-3210",
  url = 	"http://www.aclweb.org/anthology/W16-3210"
}
```

French data, Ambiguous COCO evaluation data, and Test 2017 data:
```
@InProceedings{elliott-EtAl:2017:WMT,
  author    = {Elliott, Desmond  and  Frank, Stella  and  Barrault, Lo\"{i}c  and  Bougares, Fethi  and  Specia, Lucia},
  title     = {Findings of the Second Shared Task on Multimodal Machine Translation and Multilingual Image Description},
  booktitle = {Proceedings of the Second Conference on Machine Translation, Volume 2: Shared Task Papers},
  month     = {September},
  year      = {2017},
  address   = {Copenhagen, Denmark},
  publisher = {Association for Computational Linguistics},
  pages     = {215--233},
  url       = {http://www.aclweb.org/anthology/W17-4718}
}
```

Czech data:
```
@inproceedings{barrault2018findings,
  title={Findings of the Third Shared Task on Multimodal Machine Translation},
  author={Barrault, Lo{\"\i}c and Bougares, Fethi and Specia, Lucia and Lala, Chiraag and Elliott, Desmond and Frank, Stella},
  booktitle={Proceedings of the Third Conference on Machine Translation: Shared Task Papers},
  pages={304--323},
  year={2018}
}
```

#### Special Thanks
Thanks to Oliver Maunoury and Laure Behue for producing most of French Translations of 2018 Test set.


