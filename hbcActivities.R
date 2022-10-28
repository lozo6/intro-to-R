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



# Day 3 Activities
# Reading in and inspecting data
# 1. Download the animals.csv, by right-clicking on the link and “Save Link As…” to place the file into the data directory.
# 2. Read the .csv file into your environment and assign it to a variable called animals. Be sure to check that your row names are the different animals.
animals <- read.csv('./data/animals.csv')
# 3. Check to make sure that animals is a dataframe.
class(animals) # data.frame
# 4. How many rows are in the animals dataframe? How many columns?
nrow(animals) # 6
ncol(animals) # 2

# Data wrangling
# 1. Extract the speed value of 40 km/h from the animals dataframe.
animals[1,1]
# 2. Return the rows with animals that are the color Tan.
animals[c(2,5),]
# 3. Return the rows with animals that have speed greater than 50 km/h and output only the color column. Keep the output as a data frame.
animals[which(animals$speed > 50), "color", drop =F]
# 4. Change the color of “Grey” to “Gray”.
animals$color[which(animals$color == "Grey")] <- "Gray"
animals[which(animals$color == "Grey"), "color"] <- "Gray"
# 5. Create a list called animals_list in which the first element contains the speed column of the animals dataframe and the second element contains the color column of the animals dataframe.
animals_list <- list(animals$speed, animals$color)
# 6. Give each element of your list the appropriate name (i.e speed and color).
names(animals_list) <- colnames(animals)

# The %in% operator, reordering and matching
# 1. In your environment you should have a dataframe called proj_summary which contains quality metric information for an RNA-seq dataset. We have obtained batch information for the control samples in this dataset. Copy and paste the code below to create a dataframe of control samples with the associated batch information:
proj_summary <- read.table('./data/project-summary.txt')
ctrl_samples <- data.frame(row.names = c("sample3", "sample10", "sample8", "sample4", "sample15"), date = c("01/13/2018", "03/15/2018", "01/13/2018", "09/20/2018","03/15/2018"))
# 2. How many of the ctrl_samples are also in the proj_summary dataframe? Use the %in% operator to compare sample names.
length(which(rownames(ctrl_samples) %in% rownames(proj_summary)))
# 3. Keep only the rows in proj_summary which correspond to those in ctrl_samples. Do this with the %in% operator. Save it to a variable called proj_summary_ctrl.
proj_summary_ctrl <- proj_summary[which(rownames(proj_summary) %in% rownames(ctrl_samples)),]
# 4. We would like to add in the batch information for the samples in proj_summary_ctrl. Find the rows that match in ctrl_samples.
m <- match(rownames(proj_summary_ctrl), rownames(ctrl_samples))
# 5. Use cbind() to add a column called batch to the proj_summary_ctrl dataframe. Assign this new dataframe back to proj_summary_ctrl.
proj_summary_ctrl <- cbind(proj_summary_ctrl, batch=ctrl_samples[m,])

# BONUS: Using map_lgl()
# 1. Subset proj_summary to keep only the “high” and “low” samples based on the treament column. Save the new dataframe to a variable called proj_summary_noctl.
# 2. Further, subset the dataframe to remove the non-numeric columns “Quality_format”, and “treatment”. Try to do this using the map_lgl() function in addition to is.numeric(). Save the new dataframe back to proj_summary_noctl.