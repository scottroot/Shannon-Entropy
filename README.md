# Shannon-Entropy
R script to calculate entropy and info gain

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
