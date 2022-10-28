# 1.3 Some Coding Basics
# 1.3.1 Variable assignments

x <- 12

## creating a vector (array) of integers from 0 to 9

some_numbers <- c(0,1,2,3,4,5,6,7,8,9)

## alternatively

some_numbers <- c(0:9)

# 1.3.2 R functions

mean(some_numbers)

# 1.4 R Packages

## ggplot2 - has functions for plotting data
## dplyr - has functions for cleaning/manipulating data
## stats - has functions for statistical calculations and random number generation

## The tidyverse is a set of eight common R packages used in data analysis.
## It includes ggplot2 and dplyr. When you start out in R, 
## loading the tidyverse packages is a good idea.

## You can use install.packages('tidyverse')

## Once a package is installed, you needn’t install it again. 
## But to use a package’s functions, you need to load the package into the session using library(). 
## You will need to do this every time you enter a new R session.

## library(tidyverse)

# Getting Started with Data

# 2.1 R Packages
## Will be using ggplot2, dplyr, stats

# 2.1.1 Installing packages
## install.packages('tidyverse)

# 2.1.2 Loading packages in an R session
## library(tidyverse)

# 2.2 Loading Data
# read.csv() for csv files (comma separated values)
# read.tsv() for tsv files (tab separated values)
# read.xlsx() for Excel files (from the readxl package)
# read.dta13() for dat files (from the readstata13 package)
# read.table() for huge datasets
paygap <- read.csv("./data/gender-paygap-2022.csv", header = TRUE)

# 2.2.1 Viewing data
head(paygap, n = 5)
colnames(paygap)
dim(paygap)

# 2.3 Basic Data Structures

## Continuous data can take an infinitely many values (real numbers).
## Discrete data can take on countable values only (integer numbers).
## Categorical data fall into a finite number of categories or distinct groups.

# 2.3.1 Data types in R

## character – e.g. 'abcd'
## integer – integer numbers, e.g. '2'
## numeric – decimal numbers, e.g. '2.21'
## complex – complex numbers, e.g. '2+2i'
## logical – either TRUE or FALSE

## vector – a one-dimensional array; there are two kinds of vectors:
##  atomic vector – holds data of a single data type
##  list – holds data of multiple data types
## matrix – a two-dimensional array; all columns have the same data type
## data frame – a two-dimensional array; columns may have different data types

class(paygap)

class(paygap$DiffMeanHourlyPercent)

# 3.1 Wrangling Data


