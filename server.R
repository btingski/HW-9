library(tidyverse)
library(shiny)
library(xgboost)
server <- function(input, output) {
  newPredict <- reactive({
    data.frame(
      Sepal.Length=input$sep.length, 
      Sepal.Width=input$sep.width,
      Petal.Length=input$p.length, 
      Petal.Width=input$p.width)
  })
  
  output$predictions <- DT::renderDataTable({
    data.frame(
      iris = c("setosa", "versicolor", "virginica")
      ,Probs = predict(IrisModel, as.matrix(newPredict()))
    )
  })
  
  # output$predictions<-DT::renderDataTable({
  #   label= as.matrix(c("Sepal.Length", "Sepal.Width", "Petal.Length","Petal.Width","Species")  )
  #   newPredictout<-xgb.DMatrix(as.matrix(sapply(newPredict(),as.numeric)),label=label)
  #   predict(IrisModel,newPredictout) 
  # })
  output$scatter_plot<-renderPlot({
    plot(x=iris$Sepal.Length, y=iris$Sepal.Width, 
         xlab="Sepal Length", ylab="Sepal Width",  main="Sepal Length vs. Width")
    points(newPredict(), col="red", pch=19)
  })
  output$plot1<-renderPlot({
    den <- density(iris$Sepal.Width)
    hist(iris$Sepal.Width, breaks=10, prob=TRUE, xlab="Sepal Width", main="Histogram & Density Curve")
    lines(den, lty=2, col="blue")
    abline(v=newPredict()$Sepal.Width, col='red')
  })
  output$plot2<-renderPlot({
    den <- density(iris$Sepal.Length)
    hist(iris$Sepal.Length, breaks=10, prob=TRUE, xlab="Sepal Length", main="Histogram & Density Curve")
    lines(den, lty=2, col="blue")
    abline(v=newPredict()$Sepal.Length, col='red')
  })
  output$plot3<-renderPlot({
    den <- density(iris$Petal.Length)
    hist(iris$Petal.Length, breaks=10, prob=TRUE, xlab="Petal Length", main="Histogram & Density Curve")
    lines(den, lty=2, col="blue")
    abline(v=newPredict()$Petal.Length, col='red')
  })
  output$plot4<-renderPlot({
    den <- density(iris$Petal.Width)
    hist(iris$Petal.Width, breaks=10, prob=TRUE, xlab="Petal Width", main="Histogram & Density Curve")
    lines(den, lty=2, col="blue")
    abline(v=newPredict()$Petal.Width, col='red')
  })
}