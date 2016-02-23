#download weather data from lter KBS weather station
weather<-read.table(file="http://lter.kbs.msu.edu/datatables/7.csv", header=T, sep=",",na.strings="")
# lampyrid analysis
#bring data in from figshare
lampyrid<-read.csv(file="https://ndownloader.figshare.com/files/3686040",
                   header=T)

#clean data
#fix dates, make them ISO'ed
library(lubridate)
lampyrid$newdate<-mdy(lampyrid$DATE)
#extract year
lampyrid$year<-year(lampyrid$newdate)
#extract day of year. DOY is very useful for a phenology type analyses
#because you don't have to deal with day-of-month numbers starting over 
#in the middle of a phenological event.
lampyrid$DOY<-yday(lampyrid$newdate)# lampyrid analysis
#bring data in from figshare
lampyrid<-read.csv(file="https://ndownloader.figshare.com/files/3686040",
                   header=T)

#clean data
#fix dates, make them ISO'ed
library(lubridate)
lampyrid$newdate<-mdy(lampyrid$DATE)
#extract year
lampyrid$year<-year(lampyrid$newdate)
#extract day of year. DOY is very useful for a phenology type analyses
#because you don't have to deal with day-of-month numbers starting over 
#in the middle of a phenological event.
lampyrid$DOY<-yday(lampyrid$newdate)

#download weather data from lter KBS weather station
weather<-read.table(file="http://lter.kbs.msu.edu/datatables/7.csv", header=T, sep=",", na.strings="")
weather$DOY<-yday(weather$date)
View(weather)
#visualize the weather*year data
plot(weather$air_temp_mean, weather$DOY)
plot(weather$DOY, weather$air_temp_mean)
plot(weather$DOY, weather$precipitation)

#calculating the degree day accumulation for the first half of the day dd1
#assuming a sine wave structure of temperature over the day
#use a development threshold of 10c, well, becuase its a nice number to work with
thresh<-10
alpha<-(weather$air_temp_max-weather$air_temp_min)/2

weather$theta<-c()
if (weather$air_temp_max>thresh) {
   asin((10-(weather$air_temp_max+weather$air_temp_min)/2)/alpha)
}
else{
weather$dd1<-(1/2*pi())*((weather$air_temp_max+weather$air_temp_min)/2)-10)*(pi()/2-theta)

#triangle method

ddtriangle