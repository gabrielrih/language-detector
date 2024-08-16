# language-detector
A simple MS that identifies the language given a certain sentence. It uses a trained model to identify the correct language.

## Index
- [Generating the AI model](#generating-the-ai-model)
    - [Download the dataset](#download-the-dataset)
    - [Training the model](#training-the-model)
    - [Testing the model](#testing-the-model)
- [Microservice architecture](#microservice-architecture)


## Generating the AI model
All we'll do here, we'll be using the folder ```./ai/```.

### Download the dataset
First of all you must [download this dataset](https://www.statmt.org/europarl/), decompress it and save the content in ```dataset/europarl/```.

![](.doc/ai/dataset.png)

> For study purpose we trained the model using just sentences in Portuguese, English and Spanish. So you deleted all the other folders (it has multiple languages).


### Training the model

Starting virtual environment to install the required dependencies:
```sh
poetry install --no-root
poetry shell
```

Running the notebook to train the model ```ai/notebooks/training_the_model.ipynb```.

When it ends, it will save two files on disk:
- ai/model/model.pkl: It represents the model object in binary format.
- ai/model/vectorizer.pkl: It represents the vectorizer object in binary format.

### Testing the model
To test the model we can run the notebook ```ai/notebooks/testing_the_model_ipynb```.

![](.doc/ai/testing_the_model.png)

## Microservice architecture
TO DO.

<!--
## Deploying the microservice

## Used references
- [Dataset](https://www.statmt.org/europarl/)

## References for study
- [https://blag.nullteilerfrei.de/2022/09/03/machine-learning-for-language-detection-in-python-with-scikit-learn/](https://blag.nullteilerfrei.de/2022/09/03/machine-learning-for-language-detection-in-python-with-scikit-learn/)
- [https://scikit-learn.org/stable/auto_examples/text/plot_document_classification_20newsgroups.html](https://scikit-learn.org/stable/auto_examples/text/plot_document_classification_20newsgroups.html)
- []()
- []()

-->

127.0.0.1:8000/api/health
127.0.0.1:8000/api/translate/Esta%20%C3%A9%20uma%20mensagem%20para%20traduzir

Colocar orientaçäo para testes, criar o .env e setar as varia'veis

```
AI_MODEL_PATH='/Users/usuario/Documents/git-projects/language-detector/ai/model/model.pkl'
AI_VECTORIZER_PATH='/Users/usuario/Documents/git-projects/language-detector/ai/model/vectorizer.pkl'
```
