library(shiny)
library(ggplot2)

shinyServer(function(input, output){
  
  output$contents <- renderTable(bordered = T, hover = T, striped = T, spacing = 'm', {
  
  # input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  
  req(input$file)
  
  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      df <- read.csv(input$file$datapath,
                     header = T,
                     sep = ",",
                     quote = '"')
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )
    
  })
  
  # varible which read .csv
  var <- reactive({
    read.csv2(input$file$datapath,
             header = T,
             sep = ",",
             quote = '"')
  })
  # reactive variable which check name of column, shows it in ui part 
  # return value of chosen column name
  output$vx <- renderUI({
    selectInput('varx', 'select the x axis', choices = names(var()))
  })
  output$vy <- renderUI({
    selectInput('vary', 'select the y axis', choices = names(var()))
  })
  
  # render Plot, use values column names for axis 
  output$pl <- renderPlot({
    
    
    plot(x = get(input$varx), y = get(input$vary), xlab = input$varx, ylab = input$vary)
    
  
})
})

