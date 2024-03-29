#change WD to fit your data
setwd("/Users/tyra/Documents/UMD Course Content/Analytical Thinking/Mediation:SEM")

#Read data
data<-read.csv("student-mat.csv")

#Omit missing data
data<-na.omit(data)

#Let's say my predictions are Failures (IV) -> Study Time (M) -> Final Grade (DV)

## We are using Kenny's method although there are other ways.
#For information on Kenny's method to meditations, please visit: http://davidakenny.net/cm/mediate.htm


#step 1, Total effect: IV on DV
Tot<-lm(G3 ~ failures, data = data)
summary(Tot)

### step 2, Path A (IV on M)
IVM <- lm(studytime ~ failures, data=data)
summary(IVM)

#step 3, Path B (M on DV controlling for IV)
IVMDV <- lm(G3 ~ failures + studytime, data=data)
summary(IVMDV)

#but is my mediation significant?
library(bda)
mediation.test(data$studytime,data$failures,data$G3)