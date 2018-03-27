library(keras)

# arrays in R
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
data <- c(vector1, vector2)
print(data)
print(length(data))

results <- array(data = data, dim = c(3, 3, 2))
print(results)

print(results[, , 1])

results <- array(data = 1:18, dim = c(3, 3, 2))
print(results)

print(results[, , 1])

results <- array(data = letters[1:18], dim = c(3, 3, 2))
print(results)

print(results[, , 1])

results <- array(data = c(1:9, letters[1:9]), dim = c(3, 3, 2))
print(results)

print(results[, , 1])

column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")

# Take these vectors as input to the array.
result <- array(data = data
                , dim = c(3,3,2)
                , dimnames = list(row.names, column.names, matrix.names))
print(result)
print(result[, , "Matrix1"])

# Print the third row of the second matrix of the array.
print(result[3,,2])

# Print the element in the 1st row and 3rd column of the 1st matrix.
print(result[1,3,1])

print(result[, , 2])

print(str(result))


#============================================================================#
mnist <- dataset_mnist()

train_images <- mnist$train$x
train_labels <- mnist$train$y
test_images <- mnist$test$x
test_labels <- mnist$test$y