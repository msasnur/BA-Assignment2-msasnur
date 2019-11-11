## Question 1a
set.seed(2017)
X=runif(100)*10
Y=X*4+3.45
Y=rnorm(100)*0.29*Y+Y
plot(X,Y)
# Yes, it is possible to fit a linear model

## Question 1b
linearmodel<- lm(Y~X)
linearmodel$coefficients
# Here for straight line equation, gradient value m = 3.61 and intercept c = 4.46
# Y = 3.61X + 4.46
summary(linearmodel)
# Accuracy of this model is 65.17%

## Question 1c
cor(X,Y)^2
#Coefficient of Determination is the square of Coefficeint of Correlation
#From summary of linear model we have found out R^2 = 0.6517. SO, both the values are equal.

##Question 1d
plot(X,lm(Y~X)$residuals)
#From the above plot we can tell it is a Non-constant Error Variance. So, Linear Regression model isn't appropriate to use

##Question 2a
head(mtcars)
hpwt<-lm(mtcars$hp~mtcars$wt)
summary(hpwt)
#We get R^2 = 0.4339

hpmpg<-lm(mtcars$hp~mtcars$mpg)
summary(hpmpg)
#we get R^2 = 0.6024
#Comparing these two models, R^2 value for mpg model is higher. So, Chris is right.

##Question 2b
car<-lm(hp ~ cyl + mpg, data=mtcars)
predict(car,newdata = data.frame(cyl=4,mpg=22))

##Question 2b
predict(car,newdata = data.frame(cyl=4,mpg=22),interval = c("prediction"), level=0.85)

##Question 3a
library(mlbench)
data(BostonHousing)
head(BostonHousing)
boston<-lm(medv~crim+zn+chas+ptratio, data=BostonHousing)
summary(boston)
# By summary of boston, we observe that R^2 is 0.359. R^2 value is very less and its not a good model.

##Question 3b
##Part A
View(BostonHousing)
## The house near chase river is more expensive because coefficient of chas1 variable is 4.583. When the coefficient value is multiplied by 1000(cause its expressed in dollars), we get 4583. So, the price difference here is $4583 

##Question 3c
##As we can see in the summary p values are small. So, all four variables are significant. They are related with house price.

#question 3d
anova(boston)
#Order of importance in these four variables is Crime, PTratio, Zn, Chas. This is found out by using Sum Square values. 