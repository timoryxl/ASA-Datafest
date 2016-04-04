library(png)
library(ggmap)
library(ggplot2)
library(dplyr)
library(lubridate)

load("data2.Rdata")

us <- get_map(location = "United States", zoom = 4,  source = "google", 
              maptype = "terrain")
plot(us)
usMap <- ggmap(us,  extent = "device", legend = "none")

colnames(data2)[4] = "Income"
colnames(data2)[2] = "Price"

heatMap <- usMap +
  geom_point(aes(x = Longitude, y = Latitude, color = Income, size = Price),
             data = data2, alpha = .8) +
  scale_colour_gradient(low = "yellow", high = "red")+
  guides(size=guide_legend(override.aes=list(colour="red"))) +
  scale_size(range = c(4, 14))
plot(heatMap)
  

