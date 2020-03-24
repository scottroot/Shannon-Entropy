# Shannon-Entropy
R script to calculate entropy and info gain

Uses the standard Shannon Entropy formula.

![Shannon Entropy Formula](https://wikimedia.org/api/rest_v1/media/math/render/svg/5e17bf0bf0de728a9cae59fe63d10b12410311ae)

Allows you to specify which variable in a dataset is to be the parent node, and then calculates the entropy of all other variables WRT that parent node.

## Installation
* library(devtools)
* devtools::install_github('scottroot/shannon-entropy')

## Usage
* library(shannon-entropy)
* ig(root, df, ignore)

## Arguments
* **root**      The parent root variable.

* **df**        Your dataset or dataframe.

* **ignore**    The variables or columns in your dataset that you don't want to include


## Output
A dataframe with all the variables' entropy and information gain.
