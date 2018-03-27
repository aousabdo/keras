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

print(str(train_images))
print(str(train_labels))

# randomly plot one of the images
digit <- train_images[5, , ]
plot(as.raster(digit, max = 255))

# build model
network <- keras_model_sequential() %>%
  layer_dense(units = 512
              , activation = "relu"
              , input_shape = c(28 * 28)) %>%
  layer_dense(units = 10
              , activation = "softmax")

network %>% compile(
  optimizer = "rmsprop",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)

print(str(network))

# reshape data
train_images <- array_reshape(train_images, c(60000, 28 * 28))
train_images <- train_images / 255

test_images <- array_reshape(test_images, c(10000, 28 * 28))
test_images <- test_images / 255

# prepare the labels
train_labels <- to_categorical(train_labels)
test_labels <- to_categorical(test_labels)
print(str(train_labels))

# train the model
network %>% fit(train_images, train_labels, epochs = 5, batch_size = 128)

# model performance on test data
metrics <- network %>% evaluate(test_images, test_labels)
print(metrics)

# generate predictions 
network %>% predict_classes(test_images[1:10, ])

# tensros
x <- 1:5
print(str(x))
print(str(as.array(x)))
print(dim(as.array(x)))
