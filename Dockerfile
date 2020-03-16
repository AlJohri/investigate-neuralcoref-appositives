FROM ubuntu:20.04
WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive
ENV SPACY_SHA1=26a90f011b8c21dfc06940579479aaff8006ff74
ENV NEURALCOREF_SHA1=ace367a99720b25003cb4df2eef076e5c25fd241
ENV PYTHONUNBUFFERED=1
ENV PATH=bin:/app/.venv/bin:$PATH

RUN apt-get update && \
    apt-get install -y \
        gcc g++ python3 python3-dev python3-venv awscli wget unzip && \
    apt-get clean

RUN echo "progress = dot:giga" > ~/.wgetrc && \
    # spacy model
    (mkdir ~/spacy_data && cd ~/spacy_data && \
        wget https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-2.2.5/en_core_web_lg-2.2.5.tar.gz && \
        tar -xf en_core_web_lg-2.2.5.tar.gz && \
        mv en_core_web_lg-2.2.5/en_core_web_lg/en_core_web_lg-2.2.5 en_core_web_lg && \
        rm -r en_core_web_lg-2.2.5) && \
    (mkdir -p vendor && cd vendor && \
        # spaCy
        wget -c https://github.com/explosion/spaCy/archive/$SPACY_SHA1.zip && \
        unzip -oq $SPACY_SHA1.zip && \
        mv -f spaCy-$SPACY_SHA1 spaCy && \
        # neuralcoref
        wget -c https://github.com/huggingface/neuralcoref/archive/$NEURALCOREF_SHA1.zip && \
        unzip -oq $NEURALCOREF_SHA1.zip && \
        mv -f neuralcoref-$NEURALCOREF_SHA1 neuralcoref)

RUN	python3 -m venv .venv && \
	pip install --upgrade pip && \
	pip install -r vendor/spaCy/requirements.txt && \
    python vendor/spaCy/setup.py build_ext --inplace && \
	pip install -e vendor/spaCy && \
	python vendor/neuralcoref/setup.py build_ext --inplace && \
	pip install -e vendor/neuralcoref

# trigger downloading neuralcoref model
RUN python -c "import neuralcoref"

COPY . ./
CMD ["python", "main.py"]
