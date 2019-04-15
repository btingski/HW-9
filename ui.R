## ui.R ##
library(shinydashboard)


dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    numericInput("sep.length", "Sepal Length:",5),
    numericInput("sep.width",'Sepal Width:',3),
    numericInput("p.length",'Petal Length:',2),
    numericInput("p.width",'Petal Width:',.3)),
  dashboardBody(
    fluidRow(
      box(DT::dataTableOutput("predictions"))),
    fluidRow(
      tabPanel( 'Plot', plotOutput('scatter_plot'))
    ),
    fluidRow(
      tabPanel("Plot", plotOutput("plot1"))
    ),
    fluidRow(
      tabPanel("Plot", plotOutput("plot2"))
    ),
    fluidRow(
      tabPanel("Plot", plotOutput("plot3"))
    ) ,
    fluidRow(
      tabPanel("Plot", plotOutput("plot4"))
    )
  )
)
