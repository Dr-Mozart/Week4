library(shiny)
# shinyUI(fluidPage(
#         textInput("words", "Enter Words")
# )
# )



fluidPage(
        titlePanel("Censore those words!"),
        sidebarLayout(
                sidebarPanel(
                        textInput("caption", "Enter words (separated by comma) to create censored variations", "Boob, poop, noob"),
                ), mainPanel(
                        titlePanel('You can use these, you urchin!'),
                        verbatimTextOutput("value", placeholder = T)
                        
                )
        ))
        

