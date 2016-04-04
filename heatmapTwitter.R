library(ggmap)
library(ggplot2)
library(dplyr)

load("GEO_map.Rdata")

latLong = geocode(GEO_map$City, source = "google")

GEO_map$Latitude = latLong$lat
GEO_map$Longitude = latLong$lon
GEO_map = GEO_map[,-2]

GEO_map$Total_Num_Metioning_Keyword = as.numeric(GEO_map$Total_Num_Metioning_Keyword)

class(GEO_map$Total_Num_Metioning_Keyword)

us <- get_map(location = "United States", zoom = 4,  source = "google", 
              maptype = "terrain")
plot(us)
usMap <- ggmap(us,  extent = "device", legend = "none")


heatMap <- usMap +
  geom_point(aes(x = Longitude, y = Latitude, color = Total_Num_Metioning_Keyword, size = Total_Num_Metioning_Keyword),
             data = GEO_map, alpha = .8) +
  scale_colour_gradient(low = "yellow", high = "red")+
  guides(size=guide_legend(override.aes=list(colour="red"))) +
  scale_size(range = c(4, 14))
plot(heatMap)
  

