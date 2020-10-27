# XED
This is the XED dataset. 
The dataset consists of emotion annotated movie subtitles. The original annotations have been sourced for mainly English and Finnish, with the rest created using annotation projection to aligned subtitles in 41 additional languages. The dataset is an ongoing project with forthcoming additions such as machine translated datasets. Please report any errors you find!

## Format
The files are formatted as follows:
```
sentence1\tlabel1,label2
sentence2\tlabel2,label3,label4...
```
Metadata can be found in the metadata file and the projection "pairs" files. Access to detailed metadata can be found on the [http://opus.nlpl.eu/OpenSubtitles-v2018.php](OPUS website). We recommend the use of [https://github.com/Helsinki-NLP/OpusTools](OPUS Tools).
Coompatible augmentation data by expert annotators can be found for a selection of languages in the following repos:
* [https://github.com/Helsinki-NLP/sentimentator](https://github.com/Helsinki-NLP/sentimentator)
* [https://github.com/cynarr/MA-thesis](https://github.com/cynarr/MA-thesis)
NB! The number of annotated subtitle lines are the same as listed in the original paper. The original paper gives the number of annotations, not lines with annotations which is the format of the files here. 

## Publications
You can read more about it in the following paper:

**Öhman, E., Pàmies, M., Kajava, K. and Tiedemann, J., 2020. XED: A Multilingual Dataset for Sentiment Analysis and Emotion Detection. In Proceedings of the 28th International Conference on Compputational Linguistics (COLING 2020).**

Please cite this paper if you use the dataset.

Some preliminary and related work has also been discussed in the following papers:

* Öhman, E., Kajava, K., Tiedemann, J. and Honkela, T., 2018, October. Creating a dataset for multilingual fine-grained emotion-detection using gamification-based annotation. In Proceedings of the 9th Workshop on Computational Approaches to Subjectivity, Sentiment and Social Media Analysis (pp. 24-30).
* Öhman, E.S. and Kajava, K.S., 2018. Sentimentator: Gamifying fine-grained sentiment annotation. Digital Humanities in the Nordic Countries 2018.
* Kajava, K.S., Öhman, E.S., Hui, P. and Tiedemann, J., 2020. Emotion Preservation in Translation: Evaluating Datasets for Annotation Projection. In Digital Humanities in the Nordic Countries 2020. CEUR Workshop Proceedings.
* Öhman, E., 2020. Challenges in Annotation: Annotator Experiences from a Crowdsourced Emotion Annotation Task. In Digital Humanities in the Nordic Countries 2020. CEUR Workshop Proceedings.


If you publish something using our dataset, feel free to contact us and we can add a link to your publication in this repo.
