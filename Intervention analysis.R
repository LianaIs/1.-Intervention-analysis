# you must install needed libraries first if you don't have

library("readxl")
library("tsa")
library("forecast")

# opening data file
datafile <- read_excel("C:/Users/Lenovo/Desktop/datafile.xlsx")

# Let's assume we have already found the best submodel (p,d,q) for our analysis 
# Yet I'll provode an example of grid search later

model1 = arimax(log(datafile$Volume),order=c(0,1,1), seasonal = list(order=c(0,1,1),period=12),xtransf=data.frame(COVID=1*(seq(datafile$Volume)==39),COVID=1*(seq(datafile$Volume)==39)),transfer=list(c(0,0),c(1,0)),method='ML')

# now let's indicate for how many periods we want our forecast
# I have picked remained months for this year + 12 months of 2021

hmax <- 17

# no let's show in which period the intervension starts and spread it to hmax

COVID <- 1*(seq(datafile$Volume)==39)
COVIDx <- c(COVID,rep(0,hmax))

# giving coefs

coefing <- model1$coef["COVID-MA0"]*filter(COVIDx, filter = model1$coef["COVID.1-AR1"], method = 'recursive')

# trasforming the model

model1x <- Arima(log(datafile$Volume), order=c(0,1,1), seasonal = list(order=c(0,1,1),period=12), xreg=coefing[1:length(datafile$Volume)])

# calling model1x

model1x

# forecasting

model1x.f.h <- forecast(model1x, h = hmax, xreg=coefing[(length(datafile$Volume)+1):(length(datafile$Volume)+hmax)])

# finally ploting the result

plot(model1x.f.h)

# for sure we will need to test the results as well
# but I'll show how to do it later
