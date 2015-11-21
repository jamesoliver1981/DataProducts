shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("BMI Calculator"),
                sidebarPanel(
                        h4('Enter your height and weight in the units specified & press submit'),
                        h4('The application will then return your BMI score and the class of that score'),
                        h5('Range of Height Permissible is between 152.4 & 193cm.'),
                        h5('Range of Weight Permissible is between 100 and 215 llbs.'),
                        h5('Values outside of this will not return correct values'),
                        numericInput('Height', 'Height in Centimetres', 160, min = 152.4, max = 193.04, step = 2.54),
                        numericInput('Weight', 'Weight in Pounds', 160, min = 100, max = 215, step = 5),
                        submitButton('Submit')
                ),
                mainPanel(
                        h3('BMI Score'),
                        h4('You entered'),
                        verbatimTextOutput("inputHeight"),
                        verbatimTextOutput("inputWeight"),
                        h4('Which resulted in a BMI Score of '),
                        verbatimTextOutput("prediction"),
                        h4('Which is a classed as'),
                        verbatimTextOutput("classification")
                        
                )
        )
)
        
