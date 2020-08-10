#===============================================================================
# Loading the required libraries
#===============================================================================
library(tidyverse)
library(sf)
library(leaflet)
library(mapview) # Needs installing phantomjs using webshot::install_phantomjs()
library(RCurl)

#===============================================================================
# These files need to be the current working directory where the script is run
#===============================================================================
files <- c("table_1","table_2","table_3","table_4","table_5","table_6","screen")

for (i in files) {
  data <- st_read(paste0(i,".geojson"))
  data_points <- data %>% filter(st_is(.,"POINT"))
  data_polygons <- data %>% filter(st_is(.,"POLYGON"))
  data_lines <- data %>% filter(st_is(.,"LINESTRING"))
  map <- leaflet() %>%
    addProviderTiles(providers$CartoDB.Voyager) %>%
    addPolygons(data = data_polygons, color = data_polygons$fill, opacity = 0, fillOpacity = data_polygons$fill.opacity/2) %>%
    addPolylines(data = data_lines, color = data_lines$stroke) %>%
    addCircleMarkers(data = data_points, weight = 1, radius = 4, fillOpacity = 1, color = data_points$marker.color,stroke = "black")
  mapshot(map, file = paste0(i,".png"), zoom = 2)
}
