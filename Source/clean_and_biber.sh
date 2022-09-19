#!/bin/bash

# Strip abstract, keywords and annotations,
# fix URLs,
# and run biber

# References file is hardcoded. Argument is the argument for biber - to run, use e.g.
# "source clean_and_biber.sh Chapters/cnn" (for a given chapter)
# or
# "source clean_and_biber.sh Thesis" (for whole thesis)

# Remove abstract, keywords and annotations (these don't work for multi-line abstracts or annotations)
sed -i '' -e 's:abstract = {.*},:abstract = {},:g' refs.bib
sed -i '' -e 's:keywords = {.*},:keywords = {},:g' refs.bib
sed -i '' -e 's:annote = {.*},:annote = {},:g' refs.bib

# Unescape underscores
sed -i '' -e 's:{\\_}:_:g' refs.bib

biber $1
