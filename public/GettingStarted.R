# Right now, you are reading an R script (a doc with R code)

# Hashtags are used before text comments like this (green)
# This keeps them separate from your actual code 
### You can put more than one if you want!
####################  GO WILD! #######################

# Notice there are 4 panes in the R Studio window

# This pane (NW) is the script pane, where you can edit

# Notice that thisTo  script is called "GettingStarted.R" (see tab above)
# Think of R files (.R) as text files that contain R code

# Put your cursor anywhere on the line below and hit ctrl+enter
print("hello world")

## Notice how your output popped out on the bottom of your screen!
  
# Try a few more (keep hitting ctrl+enter)

9*9
9^2
1:100
1:100+1

# Notice that order of operations applies here!
6/2*(1+2)
6/(2*(1+2))

# Base R comes with many built-in calculator functions
log10(1000)
log(exp(3)) 
sin(pi)

sum(1:100)
prod(1:100)
factorial(100)
choose(100,2)

# Choose takes two arguments: if you have n things (e.g., 100), 
# it tells you how many unique ways there are to choose a group of size k (e.g., 2)

# If you ever forget what arguments a function takes, type the function name, click inside of it, and hit tab

choose()

# If you totally forget what a function does, put a question mark in front of the function name

?sum

# Highlight JUST the "2+2" part below and hit ctrl+enter (or press "run")
is.numeric(2+2)

# Now try running the whole line (including the is.numeric thing)
# How was your output different?

# is.numeric() is a function that tells you if your data object is numeric or not
# Try this one

is.numeric("A")
is.character("A")

# Your results have been popping out in the console pane below (SW)
# Here you can directly run R commands!
# Type (or paste) the expression below into your console
100*101/2


# The pane in the NE is the environment pane. 
# This is where data, values, and functions will go!
# There's nothing there yet because we have created any objects!

## This thing is an assignment operator: <-
hi<- "hello world"

# It saves whatever's on the right ("hello world") as an object whose name is on the left (hi)
hi 

# See, it's still there!
# Take a look at the upper right pane (Environment tab). What do you see?

# You can also use the equals sign for assignment, but it is not considered good practice to do so
# Let's do it anyway! Let's use rep(), which is a function that takes two arguments. 
# The first argument is the thing to be repeated; the second is how many times to repeat it

hiTwice=rep(hi,2)
hiTwice

# This creates a sequence of integers from 10 to 1 and stores it in the vector object "data"
data=10:1

# Notice that "data" is a object in the environment pane! 
# It says "int [1:10]" because it is a vector of ten integers

# Notice also that "data" never appeared in the console, it just got stored.
# To run it, just type the word data and hit enter (or run the line below)
data

# One reason why the equal sign shouldn't be used for assignment 
# is because the double equal sign (==) is used for logical tests of equivalance

2==2
2==3

# How many individual values does our "data" vector contain (i.e., how long is this vector)?
length(data)

# If we want ascending order, we can reverse it and then overwrite the old object. Let's do that.
data<-rev(data)
data

# Now let's remove it momentarily with the rm() function
rm(data)

# To get it back, just put your cursor back on the line(s) where you assigned it and hit ctrl+enter to rerun them

# Now that you've got it back, check to see what the first and last elements are
# We use brackets to index a vector (which is a list of elements of the same type)
data[1]
data[10]

# What's going on here?

data[c(1,2,3)]

# How about here?

data[11]

# Let's add up all of them using the sum() function
sum(data)

# How about this one
cumsum(data)

# What about this?
cumsum(data)/sum(data)

# We can add 1 to every datapoint (many operations are vectorized)
dataPlusOne<-data+1
dataPlusOne
dataPlusOne-1

# Multiply every original datapoint by 2
doubleData<-data*2
doubleData

# OK, what does this do?
diff(doubleData)
diff(data)

# Bonus: what's going on here?!
diff(cumsum(data))

# Sum the vector containing the doubled data
sum(doubleData) # or sum(data*2)

length(doubleData)*(length(doubleData)+1)

# What's the average value? 
mean(doubleData)

# special formula for sum of evens
sum(doubleData)/length(doubleData)

# How can we get all the odd numbers from 1 to 19? 
oddNums<-doubleData-1
oddNums

sum(oddNums)

# special formula for sum of odds
length(oddNums)^2

# Is it the same as twice the mean of the original data?
mean(doubleData)==2*mean(data)

data=doubleData

# The last pane (SE) shows your files, plots, packages, etc.
# Let's make a quick plot
boxplot(data, col="lavender")

# how do the lines in this boxplot relate to the following quantities
fivenum(data)

# You can also flip it over if you want
boxplot(data,horizontal = T)

# Or put two side-by-side
boxplot(data,doubleData)

# Or combine them together in a single vector using c()
# This concatenate function let's you combine values into a vector (if all the same type), or list (if different types)
allData<-c(data,doubleData)
allData
boxplot(allData)

## Let's make a prettier boxplot; we need to load a package first

library(ggplot2)

# if you don't have ggplot2 installed already, run install.packages("ggplot2") first!
# Wait for it to get done installing...
# It might take a second and look kinda crazy...

ggplot(data.frame(data=data),aes(y=data))+geom_boxplot()+scale_x_discrete()


## Installing a package and :: instead of library()
# Many packages are already installed and ready to load for you; let's install a special one

devtools::install_github("hadley/emo")

emo::ji("sign of the horns")
