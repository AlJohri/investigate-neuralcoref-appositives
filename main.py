import pathlib
from time import time
from textwrap import wrap, dedent
from contextlib import contextmanager

import spacy
import neuralcoref

def unwrap(s):
    return ''.join(wrap(s, width=len(s)))

@contextmanager
def timing(description: str) -> None:
    print(description, end="...")
    start = time()
    yield
    ellapsed_time = time() - start
    print(round(ellapsed_time, 4), "seconds")


with timing("Loading Spacy Model"):
    SPACY_MODEL = "~/spacy_data/en_core_web_lg"
    model = pathlib.Path(SPACY_MODEL).expanduser().resolve()
    nlp = spacy.load(model)

print("")

coref = neuralcoref.NeuralCoref(nlp.vocab)
nlp.add_pipe(coref, name='neuralcoref')

examples = [
    
    # No Appositive
    """
    Elizabeth Warren is serving as the senior United States senator from
    Massachusetts since 2013. She is the baddest bitch of them all.
    """,

    # Has Appositive
    """
    Elizabeth Warren, an American politican and academic, is serving as
    the senior United States senator from Massachusetts since 2013. She
    is the baddest bitch of them all.
    """,

]

for i, example in enumerate(examples):
    print(f"Example {i}")
    example = unwrap(dedent(example).strip())
    doc = nlp(example)
    print("Document:")
    print(doc)
    print("Entities", doc.ents)
    print("Coreferences", doc._.coref_clusters)
    print("-------------------")
