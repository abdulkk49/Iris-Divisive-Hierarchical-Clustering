# Results: 
# Divisive Coefficient = 98.3
# Plots attached.


# Done by Abdul Kadir Khimani
# 7 Jun, 2020

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # dendogram manipulation
library(datasets)   # load iris dataset

# load iris dataset
df_orig <- iris
df_rmspecies <- select(iris, Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)

# removing sepal length, sepal width and species(after numerous combinations)
# column for better clustering results due to linear relation
df <- select(iris, Petal.Length, Petal.Width)

# remove unwanted entries if any
df <- na.omit(df)

# scaling for better results
df <- scale(df)
head(df)

# applying divisive clustering
hc <- diana(df)

# divisive coefficient
hc$dc

# plot dendrogram
pltree(hc, cex = 0.6, hang = -1, main = "Dendrogram of diana")

# seperate clusters by cutting dendrogram
clust <- cutree(hc, k = 3)

# plot clusters in 2D
fviz_cluster(list(data = df_rmspecies, cluster = clust))
fviz_cluster(list(data = df, cluster = clust))


# seperate clusters visually in dendrogram
pltree(hc, hang=-1, cex = 0.6) 
rect.hclust(hc, k = 3, border = 2:4)
