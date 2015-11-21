
a<-c(19,18,18,17,17,16,16,15,15,14,14,14,13,13,12,12,12)
b<-c(20,19,19,18,18,17,17,16,16,15,15,14,14,13,13,13,12)
c<-c(21,20,20,19,18,18,17,17,16,16,15,15,14,14,14,13,13)
d<-c(22,21,21,20,19,19,18,18,17,17,16,16,15,15,14,14,14)
e<-c(23,22,22,21,20,20,19,18,18,17,17,16,16,15,15,15,14)
f<-c(24,23,22,22,21,20,20,19,19,18,18,17,17,16,16,15,15)
g<-c(25,24,23,23,22,21,21,20,19,19,18,18,17,17,16,16,15)
h<-c(26,25,24,24,23,22,21,21,20,20,19,18,18,17,17,16,16)
i<-c(27,26,25,24,24,23,22,22,21,20,20,19,19,18,18,17,17)
j<-c(28,27,26,25,24,24,23,22,22,21,20,20,19,19,18,18,17)
k<-c(29,28,27,26,25,25,24,23,22,22,21,21,20,19,19,18,18)
l<-c(30,29,28,27,26,25,25,24,23,22,22,21,21,20,19,19,18)
m<-c(31,30,29,28,27,26,25,25,24,23,23,22,21,21,20,20,19)
n<-c(32,31,30,29,28,27,26,25,25,24,23,23,22,21,21,20,20)
o<-c(33,32,31,30,29,28,27,26,25,25,24,23,23,22,21,21,20)
p<-c(34,33,32,31,30,29,28,27,26,25,25,24,23,23,22,21,21)
q<-c(35,34,33,32,31,30,29,28,27,26,25,25,24,23,23,22,22)
r<-c(36,35,33,32,31,30,29,29,28,27,26,25,25,24,23,23,22)
s<-c(37,36,34,33,32,31,30,29,28,28,27,26,25,25,24,23,23)
t<-c(38,36,35,34,33,32,31,30,29,28,28,27,26,25,25,24,23)
u<-c(39,37,36,35,34,33,32,31,30,29,28,28,27,26,25,25,24)
v<-c(40,38,37,36,35,34,33,32,31,30,29,28,27,27,26,25,25)
w<-c(41,39,38,37,36,35,34,33,32,31,30,29,28,27,27,26,25)
z<-c(42,40,39,38,37,35,34,33,32,31,30,30,29,28,27,26,26)

df<-data.frame(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,z)
final<- data.frame(score=c(18,25,30,40,50),category=c("Underweight",
                                                      "Healthy",
                                                      "Overweight",
                                                      "Obese",
                                                      "Extremely Obese"))
#Weight as columns
y<-c(seq(from=100, to =215, by=5))
#Height=rows
x<-c(seq(from=152.4, to=194, by=2.54))
#Any code I put here is run once the app is launched.  
#Could put instructions in here for example
#Could create a basic plot of BMI index and then use the input below to 
#create the point

BMI <- function(ht,wt) df[which.min(abs(x-ht)),which.min(abs(y-wt))]
cl<-function(ht,wt) final[which.max((final$score>
                                           df[which.min(abs(x-ht)),which.min(abs(y-wt))])),2]
shinyServer(
        function(input, output) {
                output$inputHeight <- renderPrint({input$Height})
                output$inputWeight <- renderPrint({input$Weight})
                output$prediction <- renderPrint({BMI(input$Height,input$Weight)})
                output$classification<-renderPrint({cl(input$Height,input$Weight)})
        }
)