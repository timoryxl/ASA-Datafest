library(readxl)
library(ggmap)

# read in city data from xls #
cities = read_excel("lat-long.xlsx")

# get lat and long for city #
latLong = geocode(cities$City, source = "google")

# add lats and longs back to cities data #
cities$Longitude = latLong$lon
cities$Latitude = latLong$lat

# sace as R data #
save(cities, file = "citiesLatLong.Rdata")
