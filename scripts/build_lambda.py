#!/bin/bash
# Run it from root path: ./scripts/build_lambda.py
lambda_function='language-detector'
echo "Building lambda $lambda_function"

# Creating "python" folder and copying all the files and dependencies to it
path="./src/$lambda_function"
cd $path
rm -rf python
mkdir python
pip3 install -r requirements.txt -t python/
rsync -ax \
    --exclude 'python' \
    --exclude requirements.txt \
    --exclude README.md \
    --exclude .DS_Store \
    --exclude language-detector.zip \
    . python
cp ../../ai/model/model.pkl python/
cp ../../ai/model/vectorizer.pkl python/

# Compacting "python" folder
cd python
zip -r "$lambda_function" .
echo "Built lambda $lambda_function"
