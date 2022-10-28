# Intro to R and R Studio

x <- 3

y <- 5

y

x + y

number <- x + y

x <- 5

y <- 10


# Exercises
# 1. Try changing the value of the variable x to 5. What happens to number?
#   number would now be 5 + 5 = 10
# 2. Now try changing the value of variable y to contain the value 10. What do you need to do, to update the variable number?
#   You need to assign y <- 10


# R Syntax and Data Structures

# Create a numeric vector and store the vector as a variable called 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")
species

# Forget to put quotes around corn
species <- c("ecoli", "human", corn) # error due to R thinking corn is a variable not a character

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")

# Create a character vector and store the vector as a variable called 'expression'
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn 'expression' vector into a factor
expression <- factor(expression)


# Exercises
# Let’s say that in our experimental analyses, we are working with three different sets of cells: normal, cells knocked out for geneA (a very exciting gene), and cells overexpressing geneA. We have three replicates for each celltype.
# 1. Create a vector named samplegroup with nine elements: 3 control (“CTL”) values, 3 knock-out (“KO”) values, and 3 over-expressing (“OE”) values.
samegroup <- c('CTL', 'CTL', 'CTL', 'KO', 'KO', 'KO', 'OE', 'OE', 'OE')
# 2. Turn samplegroup into a factor data structure.
expressgroup <- factor(samegroup)
expressgroup


# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)
df

# Exercise
# Create a data frame called favorite_books with the following vectors as columns:
titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)
df_ex <- data.frame(titles, pages)
df_ex


list1 <- list(species, df, number)
list1

# Exercise
# Create a list called list2 containing species, glengths, and number.
list2 <- list(species, glengths, number)
list2



# Functions and Arguments

# function_name (input)

# example: getwd()

glengths <- c(glengths, 90) # adding at the end	
glengths <- c(30, glengths) # adding at the beginning

sqrt(81)

sqrt(glengths)

round(3.14159)

args(round)

example('round')

round(3.14159, 2)


# Exercise
# 1. Let’s use base R function to calculate mean value of the glengths vector. You might need to search online to find what function can perform this task.
mean(glengths)
# 2. Create a new vector test <- c(1, NA, 2, 3, NA, 4). Use the same base R function from exercise 1 (with addition of proper argument), and calculate mean value of the test vector. The output should be 2.5.
test <- c(1, 2, 3, 4)
answer <- (2.5 * 6) - sum(test)
answer
test <- c(1, 2, 2, 3, 3, 4)
sum(test) / length(test)

#   NOTE: In R, missing values are represented by the symbol NA (not available). It’s a way to make sure that users know they have missing data, and make a conscious decision on how to deal with it. There are ways to ignore NA during statistical calculation, or to remove NA from the vector. If you want more information related to missing data or NA you can go to this page (please note that there are many advanced concepts on that page that have not been covered in class).
# 3. Another commonly used base function is sort(). Use this function to sort the glengths vector in descending order.
sort_g <- sort(glengths)
sort_g


# structure of function
# name_of_function <- function(argument1, argument2) {
#   statements or code that does something
#   return(something)
# }

square_it <- function(x) {
  square <- x * x
  return(square)
}

square_it(5)


# Exercise
# 1. Write a function called multiply_it, which takes two inputs: a numeric value x, and a numeric value y. The function will return the product of these two numeric values, which is x * y. For example, multiply_it(x=4, y=6) will return output 24.

multiply_it <- function(x, y) {
  multiply <- x * y
  return(multiply)
}
multiply_it(2, 4)



# Reading in and Inspecting Data

# read.csv() is used to read a .csv file

metadata <- read.csv(file="data/mouse_exp_design.csv")
metadata


# Exercise 1
# 1. Download this tab-delimited .txt file and save it in your project’s data folder.
# 2. Read it in to R using read.table() with the approriate arguments and store it as the variable proj_summary. To figure out the appropriate arguments to use with read.table(), keep the following in mind:
proj_summary <- read.table('./data/project-summary.txt')
#   all the columns in the input text file have column name/headers
#   you want the first column of the text file to be used as row names (hint: look up the input for the row.names = argument in read.table())
# 3. Display the contents of proj_summary in your console

head(metadata)


# Exercise 2
# 
# Use the class() function on glengths and metadata, how does the output differ between the two?
class(glengths) # numerics
class(metadata) # data.frame
# Use the summarsy() function on the proj_summary dataframe, what is the median “rRNA_rate”?
summary(proj_summary) # 0.005345113
# How long is the samplegroup factor? 10
# What are the dimensions of the proj_summary dataframe? 2 dimensional
# When you use the rownames() function on metadata, what is the data structure of the output?
rows <- rownames(metadata)
class(rows) # characters
# [Optional] How many elements in (how long is) the output of colnames(proj_summary)? Don’t count, but use another function to determine this.
ncol(proj_summary)


# PRACTICE EXERCISES

# Day 2 Activities
# 1. Custom Functions - Let’s create a function temp_conv(), which converts the temperature in Fahrenheit (input) to the temperature in Kelvin (output).
#   We could perform a two-step calculation: first convert from Fahrenheit to Celsius, and then convert from Celsius to Kelvin.
#   The formula for these two calculations are as follows: temp_c = (temp_f - 32) * 5 / 9; temp_k = temp_c + 273.15. To test your function,
#   if your input is 70, the result of temp_conv(70) should be 294.2611.
temp_conv <- function(f){
  c <- (f - 32) * 5 / 9
  k <- c + 273.15
  return(k)
}
temp_conv(70)
# 2. Nesting Functions - Now we want to round the temperature in Kelvin (output of temp_conv()) to a single decimal place. Use the round() function with the newly-created temp_conv() function to achieve this in one line of code. If your input is 70, the output should now be 294.3.
round(temp_conv(70), 1)




# Data Wrangling: Subsetting Vectors and Factors

age <- c(15, 22, 45, 52, 73, 81)

age[5]
age[-5]

idx <- c(3,5,6) # create vector of the elements of interest
age[idx]

age[1:4]


# Exercises
# Create a vector called alphabets with the following letters, C, D, X, L, F.
letters <- c('C','D','X','L','F')
# Use the associated indices along with [ ] to do the following:
#   only display C, D and F
    letters[1:2]
    letters[5]
#   display all except X
    letters[3]
#   display the letters in the opposite order (F, L, X, D, C)
    letters[5:1]

age
age > 50

age > 50 | age < 18

age

age[age > 50 | age < 18]  ## nested

# OR

## create a vector first then select
idx <- age > 50 | age < 18
age[idx]

which(age > 50 | age < 18)

age[which(age > 50 | age < 18)]  ## nested

# OR

## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

expression[expression == "high"]    ## This will only return those elements in the factor equal to "high"

expression

str(expression)
# Factor w/ 3 levels "high","low","medium": 2 1 3 1 2 3 1

expression <- factor(expression, levels=c("low", "medium", "high"))     # you can re-factor a factor 

str(expression)
