library('tmap')
library('sf')


setwd('C:/Users/thedu/Documents/Hackaton')

conv <- function(g=0,m=0,s=0) {
  return(g+m/60+s/3600)
}

gut <- function(gms) {
  
}

d <- readRDS("distance_matrix.rds")


long_convertidas <- c(conv(33,03,22),conv(40,36),conv(32,24,42),
                     44.1,conv(53, 0.223),conv(61,4),
                      conv(80,31,28),conv(86,11),conv(102,28,15),
                      conv(128,52,05),conv(170,19), -conv(173,13,2),
                      conv(4,17,12),conv(30,19),conv(131.91),
                      conv(139,47,44),conv(121, 41, 58),-conv(94,10,9),
                      -conv(21,51,15),conv(158,39),conv(150,48), 
                      conv(132,53))

latitutes_convertidas <- c(conv(68,58,48),conv(64,30),conv(67,09,25),
                      65.86,conv(67, 38, 19.3),conv(69,45, 22),
                      conv(73,30,30),conv(69,24),conv(71,58,48),
                      conv(71,38,13),conv(69,42),conv(64,25,43),
                      conv(51,53,6),conv(59,57),conv(43.1332),
                      conv(35,37,1),conv(38, 57, 24),conv(58,46,9),
                      conv(64,9,15),conv(53,1),conv(59,34), 
                      conv(42,49))



coordenadas <- matrix(c(long_convertidas, latitutes_convertidas), nrow=22)
#names(longitudes) <- puertos


puntos <- st_as_sf(datos,coords=c("long","lat"),crs=4326)
matriz_distancias <- distm(coordenadas, fun = distHaversine)




st_distance(puntos)


library(geosphere)

distm()
  
puertos <- c(
  "Puerto de Murmansk",
  "Puerto Arkhangelsk",
  "Puerto de Kandalaksha",
  "El puerto de Mezen",
  "Puerto de Naryan-Mar",
  "Puerto de Amderma", 
  "Puerto de Dikson",
  "Puerto de Dudinka",
  "Puerto de Khatanga",
  "Puerto de Tiksi",
  "Puerto de Pevek",
  "Puerto de Provideniya",
  "Puerto de Rotterdam",
  "Puerto de san petersburgo",
  "Puerto de vladivostok",
  "Puerto de Tokio",
  "Puerto de Dalian",
  "Puerto de Churchill",
  "Puerto de Sundahofn",
  "Puerto de Petropavlovsk",
  "Puero de  Magadán", 
  "Puerto de Najodka" 
)
matriz_distancias

colnames()
library(magrittr)
library(dplyr)

all_cities %>%
  filter(full.name == 'duki')

nas <- rep('0', 22)

x<- data.frame(name = puertos, country.etc = rep('arctic', 22), pop = rep(420, 22), lat = latitutes_convertidas, long = long_convertidas, 
               capital = rep(0, 22),
           max_pop = rep(1000, 22), full.name = puertos)

saveRDS(x, 'duki.rds')


data <- readRDS('data/cities_sinmodificar.rds')

datos_finale <- rbind(data, x)
saveRDS(datos_finale, 'data/cities3.rds')

x$pop <- as.integer(x$pop)
x$max_pop <- as.integer(x$max_pop)
data_final <- rbind(data, x)

saveRDS(data_final, 'data/cambiar.rds')
