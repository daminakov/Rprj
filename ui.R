library(shiny)

shinyUI(
  fluidPage(
    
    # Title of page
    titlePanel(title = h1("R shiny project", align = "center")),
    sidebarLayout(
      # sidebar panel
      sidebarPanel(
        
        # file input element
        fileInput('file', 'Choose file for uploading', accept = '.csv'),
        helpText('Choose CSV file'),
        # Horizontal line ----
        tags$hr(),
        
        # slide-bar element
        sliderInput("slide", "Indenitity coefficient", min = 0, max = 1, value = 0, step = 0.05, animate = TRUE),
        br(),
        
        # action button, not implemented yet
        actionButton('act', 'Calculation'),
        br(),
        
        # select list for x axis of plot
        uiOutput('vx'),
        br(),
        # select list for y axis of plot
        uiOutput("vy"),
        br(),
        # plot output
        plotOutput('pl')
      
        
  
      ),
      mainPanel('output information',
                # tab element
                tabsetPanel(type = "tab", 
                            # tab for table of csv content
                            tabPanel("Table", tableOutput("contents")),
                )
                
      )
    )
    
    
  )
  
  
)