
# Data frames:

## Create a data frame with 6 people and their ages
names <- c('Bautista', 'Lucrecia', 'Marco', 'Luciano', 'Marta', 'Eugenia','Xavi', 'Adrea')
ages <- c(21, 34, 57, 42, 68, 13, 36, 31)
df_people <- data.frame(names,ages); df_people

## See what it has:
str(df_people)
head(df_people)
tail(df_people)

## Add a column with their city of birth
city_birth <- c('Cordoba', 'Ho Chi Minh City', 'Guadalajara', 'Kyoto', 
                'Ho Chi Minh City', 'Port Barton', 'Singapore', 'Ho Chi Minh City')
df_people <- cbind(df_people, city_birth); df_people 
names(df_people)
df_people$city_birth
df_people <- rbind(df_people, c('Eliot', 45, 'Kyoto')); df_people
dim(df_people)
dim(df_people)[1]
nrow(df_people)
dim(df_people)[2]
ncol(df_people)

str(df_people)
## What is happening? When I force the vector for Eliot, R coerce all values 
## of the vector to be of the character type. LIO!
df_people$ages <- sapply(df_people$ages, as.integer)
str(df_people)

## Rename columns:
names(df_people) <- c('Name', 'Age', 'City_of_birth'); df_people
## Or only one:
names(df)[3] <- "City-of-birth"
head(df)

## Extract values v.s. extract elements
df_people[[2]]
typeof(df_people[[2]])
df_people[2]
typeof(df_people[2])

## Consulting:
df_people[2:4, ]
df_people$City_of_birth

df_people
## Querying
df_people[df_people$City_of_birth=='Ho Chi Minh City', c('Name', 'Age')]
df_people[df_people$Age>35,]

## Add a new example. Alternative to rbind():
df_people[nrow(df_people)+1,] <- data.frame('Patricio', 5, 'Guadalajara'); df_people 
df_people <- rbind(df_people, list('Elvira', 29, 'Kyoto')); df_people

## Age is of integer type: 
summary(df_people)

## Sub-dataframe:
## The minus suppresses the number introduced of last samples
df_people_copy <- head(df_people, -3)
df_people_copy
## Delete third column:
df_people_copy[3] <- NULL; df_people_copy


## Access variables of a data.frame without calling the df:
Age
attach(df_people)
Age

## Barplot or histogram? Barplot for cities:
barplot(table(City_of_birth)) 

summary(df_people)

## The mean splits the data in two:
mean_peop <- sum(df_people$Age)/nrow(df_people); mean_peop
strd_dev <- sd(df_people$Age); strd_dev

## Histogram for ages:
hist(Age, main = "Ages of people", xlab = "Data", col = "orange")
abline(v = mean_peop, col = "blue", lty = 3)
abline(v = mean_peop + (strd_dev * c(1, -1)), col = "green")

## The median is the second quartile (Q2); 
## thus 50% of the data lies below this point.
median(Age)
Age
typeof(Age)
ages_ordered <- sort(Age); ages_ordered

## The median is the 6th element (different from the mean):
length(Age)
## The index for the middle component is:
( length(Age)+1 )/2
## Then the median is
ages_ordered[(length(Age)+1)/2]
median(Age)

## Q1:
quantile(Age, 0.25)
## Q3:
quantile(Age, 0.75)
## Some quartiles:
quantile(Age, probs = c(0,0.25,0.5,0.75,1))

ages_ordered

## Delete a column, other manner: Filtering a column
df_people
sub_set_peop <- c(T,F,T)
sub_df_prople <- df_people[sub_set_peop];sub_df_prople

## Order the dataframe
sub_df_prople[order(Name, decreasing = T), ]
sub_df_prople

detach(df_people)
Age




# Check your absolute filepath representing the current working directory of the R process
getwd()

setwd("C:/Users/Luciano Gabbanelli/Desktop/Documentos/MDS/Modulo 1/R/")      # Change working directory

getwd()

## Check no header argument:
df <- read.csv("7.5-FB.csv", header = FALSE)

# Explore dataframe
df
# Is comfortable to work with the head.
head(df)
class(df)

# Call a column with the operator $:
df$V2
df[["V2"]]

# Or by its index:
df[[2]]
typeof(df[[2]])

df[2]
typeof(df[2])
length(df[2])
my.open <- df[2]
my.open <- my.open[[1]]
length(my.open)
my.open == df[[2]]


head(df,4)
# We can obtain a subset of the dataframe, and select the columns to take into 
# account with the **select** parameter:
# With headers it would be: muestra <- subset(df, select = c("High", "Low"))
# Here:
my.sample <- subset(df, select = c("V3", "V4"))
head(my.sample)

# How to deal with NA values?
# Let us fix our data frame mess:
my.sample <- my.sample[-1,]
head(my.sample)
# What's inside?
summary(my.sample)

my.sample <- data.frame(sapply(my.sample, function(x) as.numeric(x)))
my.sample[3, 1] <- NA
summary(my.sample)

# Are there NAs?
is.na(head(my.sample))
# Where?
complete.cases(my.sample)
head( my.sample[complete.cases(my.sample),] )
head(my.sample)
# Basically I decided to drop the entire row where a NA was found. 
# Is the best practice? I didn't store it in a variable :p

# What if, on the contrary, I was interested in replacing the null value 
# with another value?
# Let us remember what I am going to put:
mean(my.sample$V3, na.rm=TRUE)
my.sample$V3[which(is.na(my.sample$V3))] <- round(mean(my.sample$V3, na.rm=TRUE),2)
head(my.sample)






# Arrays

## Higher dimensional structures.
## R prefers columns:
array(data = c(1,2,3), dim = c(3,0,0))
## Then rows:
array(c(1,2,3), dim = c(0,3,0))
## And finally, other dimensions:
array(c(1,2,3), dim = c(0,0,3))

## An array of one dimension is similar to a vector:
my.array <- array(c(5,3,9), dim = c(3)); my.array
is.array(my.array)
## But it is not a vector:
is.vector(my.array)

## Arrays have their own class:
class(my.array)

## More complicated data:
## Generate an array of two 3x3 matrices:
vector2 <- c(10,11,12,13,14,15)
result1 <- array(c(my.array,vector2),dim = c(3,3,2),)
result1

## We can name the columns and rows when creating the df:
column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")
array1 <- array(c(vector1,vector2),dim = c(3,3,2),dimnames = 
                  list(row.names,column.names,matrix.names))
array1
## (or after with the proper syntax)

## Let us explore the array:
dim(array1)
## We can consult the length of each component of the first matrix:
array1[1,,1]
length(array1[1 , , 1]) # Columns
array1[,1,1]
length(array1[ , 1, 1]) # Rows
array1[1 , 1, ]
length(array1[1 , 1, ]) # Dimensions of the array 2 elements with a matrix each.


## Let us add two arrays (be careful with the dimensions):
result2 <- array(c(rep(0,9),rep(1,9)),dim = c(3,3,2),); result2
result <- result1+result2; 
result
str(result)

## Access: array_name[matrix_row,matrix_column,array_component]
## Print the element in the 1st row and 3rd column of the 1st matrix:
print(result[1,3,1])
## Print the third row of the second matrix of the array:
print(result[3,,2])
## Print the second column of the second sub-matrix:
result[,2,2]
## Print the 2nd Matrix:
print(result[,,2])
## Print all second rows:
result[,2,1:2]

## Create/extract matrices from my array:
## We can think each of the third dimension as a sub-matrix:
matrix1 <- result[,,1]; matrix1
matrix2 <- result[,,2]; matrix2

# Add the matrices.
matrix1+matrix2

## What are these objects?
is.matrix(matrix1)
is.array(matrix1)
is.vector(matrix1)


## Let us go back to the arrays:

## We can create a random vector:
no.rep.sample <- sample(30:60, 10, replace = F); no.rep.sample
## and modify its dimensions:
dim(no.rep.sample) <- c(5,2); no.rep.sample
is.array(no.rep.sample)
is.matrix(no.rep.sample)
is.vector(no.rep.sample)

class(no.rep.sample)


# Operations with arrays:
# Use apply to calculate the sum of the rows across all the matrices.
array1
apply(array1, c(1), sum)
# Because
2*(5+10+13)
2*(3+11+14)
9+12+15
# Which is equivalent for summing for each row, the two matrices:
sum(array1[1,,1])+sum(array1[1,,2])
# Or
sum(array1[1,,])
# For the second:
sum(array1[2,,])
# and third:
sum(array1[3,,])

# Or sum all elements in the array
sum(array1)
2*(5+10+13)+2*(3+11+14)+2*(9+12+15)
# Or the mean:
mean(array1)
# Which by hand is:
length(array1)
mean(array1)== sum(array1)/length(array1)

# The range consist of two values:
array1
range(array1)
# Its maximum:
max(array1)
# and the minimum:
min(array1)
# And everything works at the level if individuals.
# Find the minimum of the second row from the first matrix:
min(array1[2, , 1])


# We also have at disposal the following functions.
# Let us modify the second matrix such it is not the same than the fist one:
my.array <- array1+result2
# Sum all columns individually:
colSums(my.array, dims = 1)
# Sum all columns in a matrix:
colSums(my.array, dims = 2)
my.array[]
# Which is equivalent to these two codes:
sum(my.array[,,1])
sum(my.array[,,2])
# But nicier!
# Equivalently for rowSums().


# Compute the media of a row:
# This works in the other way around for rows. Fist compute the media of all rows:
rowMeans(my.array, dims = 1) # Mean of rows by all rows.
sum(my.array[1,,])/length(my.array[1,,])
sum(my.array[2,,])/length(my.array[2,,])
sum(my.array[3,,])/length(my.array[3,,])
# and with dim=2, computes the mean of each components between all dimensions (matrices)
rowMeans(my.array, dims = 2)
sum(my.array[1,1,])/2
sum(my.array[2,1,])/2
sum(my.array[3,1,])/2
sum(my.array[1,2,])/2

# Equivalently for colMeans().

my.array

# We can permute the dimensions of an array:
new.arr <- array(1:40, c(5, 4, 2)); new.arr
aperm(new.arr)
# As you can see, an array of dim=(5,4,2) permutes to dim=(2,4,5)
# Look how it change!

# aprem is a generaliztion for a matrix transposition to a higher dimension.
aperm(array(1:12,c(3,4)))







