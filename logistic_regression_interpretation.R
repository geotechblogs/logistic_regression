## Interpretation of a logistic regression model

# Set the working directory to your file's location
setwd('C://Users//User//Documents//Software//Code//personal-web-page//logistic_regression_int')

# Read the CSV file
input_dataset <- read.csv('./Social_Network_Ads.csv', na.strings="NA")

# View the first few rows of the data
head(input_dataset)

# Convert Gender to a factor variable
input_dataset$Gender <- as.factor(input_dataset$Gender)

# Set 'Female' as the reference level
ref_level <- 'Female'
input_dataset$Gender <- relevel(input_dataset$Gender, ref_level)

# Convert output to factor variable
input_dataset$Purchased <- as.factor(input_dataset$Purchased)

# See the structure of the data (variable types)
str(input_dataset)

summary(input_dataset)

# Create the logistic regression model
logistic_classifier <- glm(formula = Purchased ~ Gender + Age + EstimatedSalary,
                           family = 'binomial',
                           data = na.omit(input_dataset))

# Get the model results
summary(logistic_classifier)

# See the coefficients in percentage 
(exp(coef(logistic_classifier)) - 1) * 100
