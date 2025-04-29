# 1. Creating a Data Frame
# Creating vectors
names <- c("Alice", "Bob", "Charlie")
ages <- c(25, 30, 35)
genders <- c("Female", "Male", "Male")

# Creating a data frame
df <- data.frame(Name = names, Age = ages, Gender = genders)

# Displaying the data frame
print(df)

# 2. Examining the Structure of a Data Frame
str(df)

# 3. Summarizing Data
summary(df)

# 4. Accessing Data Frame Elements
# Using Indexing
df[1, 2]         # First row, second column
df[1, ]          # First row
df[, "Age"]      # 'Age' column

# Using the $ Operator
df$Age

# 5. Modifying a Data Frame
# Adding a Column
df$Height <- c(165, 170, 175)
print(df)

# Adding a Row
new_row <- data.frame(Name = "David", Age = 28, Gender = "Male", Height = 180)
df <- rbind(df, new_row)
print(df)

# Removing a Column
df$Height <- NULL
print(df)

# Removing a Row
df <- df[-2, ]
print(df)

# 6. Merging Data Frames
df2 <- data.frame(Name = c("Alice", "David"), Salary = c(50000, 60000))
merged_df <- merge(df, df2, by = "Name")
print(merged_df)

# 7. Sorting Data Frames
df <- df[order(df$Age), ]
print(df)

# 8. Filtering Data Frames
filtered_df <- subset(df, Age > 25)
print(filtered_df)

# 9. Selecting Specific Columns
selected_columns <- df[, c("Name", "Age")]
print(selected_columns)

# 10. Applying Functions to Columns
avg_age <- mean(df$Age, na.rm = TRUE) # Include na.rm = TRUE for safety
print(avg_age)

# 11. Handling Missing Values
df$Age[2] <- NA # Introducing a missing value
cleaned_df <- na.omit(df) # Removing rows with missing values
print(cleaned_df)

# 12. Conclusion
# Data frames allow efficient manipulation and analysis of datasets in R.

