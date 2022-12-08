install.packages("caret")
library(caret)
summary(seeds)
length(seeds)
plot(seeds, col = seeds$Type)
library(ggplot2)
seeds$TypeFac <- as.factor(seeds$Type)
ggplot(seeds, aes(x = Area, color = TypeFac, fill = TypeFac)) + geom_density(alpha = 0.2) + theme_minimal()

validation_index <- createDataPartition(seeds$Type, p=0.80, list=FALSE)
validation <- seeds[-validation_index,]
seeds <- seeds[validation_index,]
dim(seeds)
sapply(seeds, class)

head(seeds)
levels(seeds$TypeFac)

percentage <- prop.table(table(seeds$Type)) * 100
cbind(freq=table(seeds$Type), percentage=percentage)
summary(seeds)

x <- seeds[,1:7]
y <- seeds$TypeFac

par(mfrow=c(1,4))
for(i in 1:7) {
  boxplot(x[,i], main=names(seeds)[i])
}

install.packages("ellipse")
library("ellipse")
plot(seeds$TypeFac)

featurePlot(x=x, y=y, plot="ellipse")
featurePlot(x=x, y=y, plot="box")

scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)


control <- trainControl(method="cv", number=10)
metric <- "Accuracy"


set.seed(7)
fit.lda <- train(x, y, method="lda", preProcess="scale", trControl=control)
set.seed(7)
fit.cart <- train(x, y, method="rpart", preProcess="scale", trControl=control)
set.seed(7)
fit.knn <- train(x, y, method="knn", preProcess="scale", trControl=control)
set.seed(7)
fit.svm <- train(x, y, method="svmRadial", preProcess="scale", trControl=control)
set.seed(7)
fit.rf <- train(x, y, method="rf", preProcess="scale", trControl=control)

results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)
dotplot(results)

print(fit.lda)

predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$TypeFac)
