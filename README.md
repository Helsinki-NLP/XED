# XED
This is the XED dataset. 
The dataset consists of emotion annotated movie subtitles. The original annotations have been sourced for mainly English and Finnish, with the rest created using annotation projection to aligned subtitles in 41 additional languages. The dataset is an ongoing project with forthcoming additions such as machine translated datasets. **Please let us know if you find any errors or come across other issues with the datasets!**

## Format
The files are formatted as follows:
```
sentence1\tlabel1,label2
sentence2\tlabel2,label3,label4...
```
Metadata can be found in the metadata file and the projection "pairs" files. Access to detailed metadata can be found on the [OPUS website](http://opus.nlpl.eu/OpenSubtitles-v2018.php). We recommend the use of [OPUS Tools](https://github.com/Helsinki-NLP/OpusTools).
Coompatible augmentation data by expert annotators can be found for a selection of languages in the following repos:
* [https://github.com/Helsinki-NLP/sentimentator](https://github.com/Helsinki-NLP/sentimentator)
* [https://github.com/cynarr/MA-thesis](https://github.com/cynarr/MA-thesis)

NB! The number of annotated subtitle lines are the same as listed in the original paper. The original paper gives the number of annotations, not lines with annotations which is the format of the files here. 
## Evaluations
We used BERT to test the robustness of the annotations.

### English annotated data
| Number of annotations:        | 24164 + 9384 neutral |
|-------------------------------|---------------------:|
| Number of unique data points: | 17530 + 6420 neutral |
| Number of emotions:           |   8 (+pos, neg, neu) |
| Number of annotators:         |      108 (63 active) |


| data                                   | f1    | accuracy            |
|----------------------------------------|-------|---------------------|
| English without NER, BERT              | 0.530 | 0.538               |
| English with NER, BERT                 | 0.536 | 0.544               |
| English NER with neutral, BERT         | 0.467 | 0.529               |
| English NER binary with surprise, BERT | 0.679 | 0.765               |
| English NER true binary, BERT          | 0.838 | 0.840               |
| English NER, one-vs-rest Linear SVC    | 0.502 | 0.650-0.789 / class |

### Multilingual projections

And for a selection of other languages using language-specific BERT models:

| data              | f1     | accuracy |
|-------------------|--------|----------|
| Finnish projected | 0.4461 | 0.4542   |
| Turkish projected | 0.4685 | 0.5257   |
| Arabic projected  | 0.4627 | 0.5339   |
| German projected  | 0.5084 | 0.5737   |
| Dutch projected   | 0.5155 | 0.5822   |
| Chinese projected | 0.4729 | 0.5247   |

There is some data for 43 langauges, and for 13 languages we have more than 10k projected lines (including Finnish and English).

## Publications
You can read more about it in the following paper:

**Öhman, E., Pàmies, M., Kajava, K. and Tiedemann, J., 2020. XED: A Multilingual Dataset for Sentiment Analysis and Emotion Detection. In Proceedings of the 28th International Conference on Computational Linguistics (COLING 2020).**
```
@inproceedings{ohman2020xed,
  title={XED: A Multilingual Dataset for Sentiment Analysis and Emotion Detection},
  author={{\"O}hman, Emily and P{\`a}mies, Marc and Kajava, Kaisla and Tiedemann, J{\"o}rg},
  booktitle={The 28th International Conference on Computational Linguistics (COLING 2020)},
  year={2020}
}
```

Please cite this paper if you use the dataset.

Some preliminary and related work has also been discussed in the following papers:

* Öhman, E., Kajava, K., Tiedemann, J. and Honkela, T., 2018, October. Creating a dataset for multilingual fine-grained emotion-detection using gamification-based annotation. In Proceedings of the 9th Workshop on Computational Approaches to Subjectivity, Sentiment and Social Media Analysis (pp. 24-30).
* Öhman, E.S. and Kajava, K.S., 2018. Sentimentator: Gamifying fine-grained sentiment annotation. Digital Humanities in the Nordic Countries 2018.
* Kajava, K.S., Öhman, E.S., Hui, P. and Tiedemann, J., 2020. Emotion Preservation in Translation: Evaluating Datasets for Annotation Projection. In Digital Humanities in the Nordic Countries 2020. CEUR Workshop Proceedings.
* Öhman, E., 2020. Challenges in Annotation: Annotator Experiences from a Crowdsourced Emotion Annotation Task. In Digital Humanities in the Nordic Countries 2020. CEUR Workshop Proceedings.


If you publish something using our dataset, feel free to contact us and we can add a link to your publication in this repo.
