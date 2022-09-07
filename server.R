

library(shiny)
library(tidyverse)

shinyServer(
        function(input, output) {
        output$value <- renderText({
                s<- unlist(strsplit(input$caption, ", "))
                repfun2 <- function(s){
                        #Znak ktorým chceme nahradiť písmená
                        f <- function(x,y) {substr(x,y,y) <- "*"; x}
                        g <- function(x) Reduce(f,x,s)
                        
                        #Pozície (okrem prvého a posledného písmena)
                        out <- unlist(lapply(1:(nchar(s)-2),function(x) combn(2:(nchar(s)-1),x,g)))
                        return(out)
                }
                censored<- lapply(s, FUN = repfun2) %>%
                        unlist() %>%
                        as.data.frame()
                paste0(censored)
        })
})