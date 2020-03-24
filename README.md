# Shannon-Entropy
R script to calculate entropy and info gain
https://wikimedia.org/api/rest_v1/media/math/render/svg/5e17bf0bf0de728a9cae59fe63d10b12410311ae

## Installation
library(devtools)
devtools::install_github('scottroot/shannon-entropy')

## Usage
library(shannon-entropy)

ig(root, df, ignore)

## Arguments
#### root
The parent root variable.

#### df
Your dataset or dataframe.

#### ignore
The variables or columns in your dataset that you don't want to include


## Output
A dataframe with all the variables' entropy and information gain.
