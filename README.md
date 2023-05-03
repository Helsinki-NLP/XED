# XED
This is the XED dataset. 
The dataset consists of emotion annotated movie subtitles from OPUS. We use Plutchik's 8 core emotions to annotate. The data is multilabel. The original annotations have been sourced for mainly English and Finnish, with the rest created using annotation projection to aligned subtitles in 41 additional languages, with 31 languages included in the final dataset (more than 950 lines of annotated subtitle lines). The dataset is an ongoing project with forthcoming additions such as machine translated datasets. **Please let us know if you find any errors or come across other issues with the datasets!**

## Citation
You can read more about XED in the following paper:

**Öhman, E., Pàmies, M., Kajava, K. and Tiedemann, J., 2020. XED: A Multilingual Dataset for Sentiment Analysis and Emotion Detection. In Proceedings of the 28th International Conference on Computational Linguistics (COLING 2020).**
```
@inproceedings{ohman2020xed,
  title={{XED}: A Multilingual Dataset for Sentiment Analysis and Emotion Detection},
  author={{\"O}hman, Emily and P{\`a}mies, Marc and Kajava, Kaisla and Tiedemann, J{\"o}rg},
  booktitle={The 28th International Conference on Computational Linguistics (COLING 2020)},
  year={2020}
}
```

Please cite this paper if you use the dataset.

## Format
The files are formatted as follows:
```
sentence1\tlabel1,label2
sentence2\tlabel2,label3,label4...
```
Where the number indicates the emotion in ascending alphabetical order: anger:1, anticipation:2, disgust:3, fear:4, joy:5, sadness:6, surprise:7, trust:8, with neutral:0 where applicable. Note that if you use our BERT code, it will re-arrange the original labels when you use 1-8 into 0-7 by switching trust:8->0

Metadata can be found in the metadata file and the projection "pairs" files. Access to detailed metadata can be found on the [OPUS website](http://opus.nlpl.eu/OpenSubtitles-v2018.php). We recommend the use of [OPUS Tools](https://github.com/Helsinki-NLP/OpusTools).
Compatible augmentation data by expert annotators can be found for a selection of languages in the following repos:
* [https://github.com/Helsinki-NLP/sentimentator](https://github.com/Helsinki-NLP/sentimentator)
* [https://github.com/cynarr/MA-thesis](https://github.com/cynarr/MA-thesis)

NB! The number of annotated subtitle lines are the same as listed in the original paper. The original paper gives the number of annotations, not lines with annotations which is the format of the files here. 
## Evaluations
We used BERT to test the annotations for Finnish, English, and a handful of other languages with complete BERT models.

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

And for the other languages with more than 950 lines using SVM:

| LANG | SIZE  | AVG_LEN | ANGER | ANTICIP. | DISGUST | FEAR | JOY  | SADNESS | SURPRISE | TRUST | 1label | 2labels | 3labels | 4+labels | F1_SVM |
|------|-------|---------|-------|----------|---------|------|------|---------|----------|-------|--------|---------|---------|----------|--------|
| AR   | 3590  | 30.02   | 1012  | 839      | 478     | 565  | 561  | 536     | 615      | 589   | 65.01  | 26.94%  | 6.74%   | 1.31%    | 0.5729 |
| BG   | 6974  | 41.3    | 1923  | 1630     | 891     | 1051 | 1174 | 1112    | 1166     | 1239  | 64.01  | 27.89%  | 6.62%   | 1.48%    | 0.6069 |
| BR   | 12295 | 38.49   | 3228  | 2846     | 1641    | 1821 | 2128 | 2025    | 2121     | 2098  | 64.69  | 27.02%  | 6.66%   | 1.63%    | 0.6726 |
| BS   | 2443  | 33.13   | 632   | 571      | 294     | 367  | 428  | 394     | 397      | 399   | 65.98  | 26.65%  | 6.47%   | 0.9%     | 0.5854 |
| CN   | 1395  | 10.92   | 315   | 315      | 140     | 180  | 288  | 221     | 242      | 266   | 66.31  | 27.46%  | 5.16%   | 1.08%    | 0.5004 |
| CS   | 6511  | 29.94   | 1728  | 1615     | 807     | 1035 | 1045 | 1011    | 1110     | 1091  | 64.64  | 27.42%  | 6.63%   | 1.31%    | 0.6263 |
| DA   | 1838  | 31.03   | 447   | 472      | 193     | 218  | 350  | 282     | 294      | 351   | 66.59  | 26.17%  | 6.2%    | 1.03%    | 0.5989 |
| DE   | 5503  | 50.24   | 1492  | 1304     | 742     | 790  | 938  | 889     | 905      | 904   | 64.96  | 27.11%  | 6.6%    | 1.33%    | 0.6059 |
| EL   | 8083  | 35.22   | 2238  | 1956     | 1070    | 1162 | 1369 | 1273    | 1345     | 1367  | 64.25  | 27.58%  | 6.73%   | 1.45%    | 0.6192 |
| ES   | 11303 | 35.69   | 3007  | 2631     | 1482    | 1765 | 1902 | 1810    | 1959     | 1924  | 64.52  | 27.22%  | 6.59%   | 1.66%    | 0.676  |
| ET   | 1476  | 28.66   | 370   | 396      | 144     | 218  | 280  | 210     | 222      | 255   | 65.58  | 27.57%  | 6.17%   | 0.68%    | 0.5449 |
| FI   | 8289  | 29.11   | 2175  | 2010     | 1014    | 1281 | 1503 | 1243    | 1383     | 1447  | 64.3   | 27.8%   | 6.38%   | 1.52%    | 0.5859 |
| FR   | 7306  | 41.27   | 1946  | 1726     | 994     | 1127 | 1256 | 1200    | 1198     | 1259  | 63.63  | 28.02%  | 6.86%   | 1.49%    | 0.6257 |
| HE   | 4449  | 28.97   | 1244  | 1078     | 551     | 658  | 791  | 681     | 754      | 783   | 63.34  | 28.37%  | 6.74%   | 1.55%    | 0.598  |
| HR   | 5941  | 31.7    | 1494  | 1408     | 724     | 978  | 1029 | 947     | 991      | 1052  | 64.13  | 28.24%  | 6.26%   | 1.36%    | 0.6503 |
| HU   | 5777  | 32.07   | 1539  | 1378     | 715     | 925  | 937  | 899     | 989      | 1028  | 64.19  | 27.77%  | 6.63%   | 1.42%    | 0.5978 |
| IS   | 977   | 29.55   | 236   | 230      | 121     | 124  | 175  | 168     | 134      | 180   | 66.84  | 27.12%  | 5.32%   | 0.72%    | 0.5416 |
| IT   | 6552  | 44.65   | 1783  | 1514     | 887     | 1092 | 1011 | 1122    | 1065     | 1104  | 63.58  | 28.4%   | 6.59%   | 1.42%    | 0.6907 |
| MK   | 300   | 28.9    | 58    | 100      | 33      | 36   | 61   | 53      | 64       | 52    | 58.67  | 31.0%   | 9.67%   | 0.67%    | 0.4961 |
| NL   | 5333  | 33.93   | 1392  | 1337     | 658     | 822  | 878  | 857     | 942      | 927   | 64.22  | 27.21%  | 6.86%   | 1.71%    | 0.614  |
| NO   | 4257  | 31.1    | 1051  | 1029     | 500     | 584  | 822  | 678     | 731      | 712   | 65.09  | 27.93%  | 5.68%   | 1.29%    | 0.5771 |
| PL   | 7179  | 32.44   | 1966  | 1707     | 964     | 1121 | 1206 | 1119    | 1199     | 1220  | 64.03  | 27.72%  | 6.69%   | 1.56%    | 0.6233 |
| PT   | 7220  | 33.72   | 1890  | 1710     | 906     | 1101 | 1260 | 1210    | 1234     | 1257  | 63.85  | 27.87%  | 6.86%   | 1.43%    | 0.6203 |
| RO   | 9474  | 36.88   | 2543  | 2181     | 1258    | 1433 | 1563 | 1568    | 1579     | 1608  | 64.9   | 27.07%  | 6.58%   | 1.45%    | 0.6387 |
| RU   | 2377  | 32.45   | 564   | 590      | 268     | 423  | 376  | 395     | 416      | 405   | 64.7   | 27.6%   | 6.6%    | 1.09%    | 0.5976 |
| SK   | 975   | 59.82   | 256   | 234      | 99      | 168  | 168  | 153     | 152      | 159   | 65.44  | 28.0%   | 5.54%   | 1.03%    | 0.5305 |
| SL   | 2680  | 29.19   | 679   | 694      | 278     | 402  | 456  | 416     | 481      | 419   | 65.52  | 27.61%  | 5.6%    | 1.27%    | 0.6015 |
| SR   | 8984  | 31.69   | 2365  | 2163     | 1131    | 1282 | 1652 | 1399    | 1519     | 1565  | 64.3   | 27.58%  | 6.72%   | 1.39%    | 0.6566 |
| SV   | 4905  | 44.34   | 1273  | 1160     | 591     | 691  | 815  | 831     | 866      | 827   | 65.3   | 27.01%  | 6.48%   | 1.2%     | 0.6218 |
| TR   | 9202  | 35.95   | 2423  | 2243     | 1212    | 1339 | 1610 | 1469    | 1589     | 1628  | 63.64  | 28.03%  | 6.71%   | 1.63%    | 0.608  |
| VI   | 956   | 34.53   | 245   | 224      | 128     | 141  | 187  | 150     | 144      | 178   | 63.28  | 28.56%  | 7.11%   | 1.05%    | 0.5594 |

# Related publications:

Some preliminary and related work has also been discussed in the following papers:

* Öhman, E., Kajava, K., Tiedemann, J. and Honkela, T., 2018, October. Creating a dataset for multilingual fine-grained emotion-detection using gamification-based annotation. In Proceedings of the 9th Workshop on Computational Approaches to Subjectivity, Sentiment and Social Media Analysis (pp. 24-30).
* Öhman, E.S. and Kajava, K.S., 2018. Sentimentator: Gamifying fine-grained sentiment annotation. Digital Humanities in the Nordic Countries 2018.
* Kajava, K.S., Öhman, E.S., Hui, P. and Tiedemann, J., 2020. Emotion Preservation in Translation: Evaluating Datasets for Annotation Projection. In Digital Humanities in the Nordic Countries 2020. CEUR Workshop Proceedings.
* Öhman, E., 2020. Challenges in Annotation: Annotator Experiences from a Crowdsourced Emotion Annotation Task. In Digital Humanities in the Nordic Countries 2020. CEUR Workshop Proceedings.

License: Creative Commons Attribution 4.0 International License (CC-BY)
