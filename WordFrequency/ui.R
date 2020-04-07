# ------------------------ Dependencies --------------------

library(shiny)

# ----------------- UI ------------------------------


ui <- navbarPage(
    title ="Word Frequency Dashboard",
    
# ----------------- Distribution ----------------    
    
    tabPanel("Distribution", fluidPage(
        titlePanel("Distribution")
    ))
)
