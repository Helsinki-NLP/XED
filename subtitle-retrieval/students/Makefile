

SUBLANGS = af ar bg bn br bs ca cs da de el en eo es et eu fa fi fr gl he hi hr hu hy id is it ja ka kk ko lt lv mk ml ms nl no pl pt ro ru si sk sl sq sr sv ta te th tl tr uk ur vi pt_br ze_zh zh_cn zh_tw


LINKS = $(patsubst %,links-%.xml,${SUBLANGS})
SENTS = $(patsubst %,sents-%.txt,${SUBLANGS})
PAIRS = $(patsubst %,pairs-%.txt,${SUBLANGS})

all: ${PAIRS}

${LINKS}: student_annotations.csv
	../find-links.pl $(patsubst links-%.xml,%,$@) < $< > $@

${SENTS}: sents-%.txt: links-%.xml
	opus-read -d /proj/OPUS/corpus/OpenSubtitles/raw $< > $@

${PAIRS}: pairs-%.txt: links-%.xml
	../xces2moses -d /proj/OPUS/corpus/OpenSubtitles/raw -P $@.ids $< $@
	paste $@.ids $@.src $@.trg > $@
	rm -f $@.ids $@.src $@.trg

KAISA = ${wildcard kaisla/en_multi_with_metadata/*.txt}