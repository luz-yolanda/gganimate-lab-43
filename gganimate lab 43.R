# Hecho con gusto por Luz Yolanda Rivera (UAEH)
# LABORATORIO - Graficas animadas con ggplot2


#################################################
# Objetivo: hacer graficas animadas con ggplot2
# ------------------------------------------------

# En este ejercicio vamos a:
# 1. grafica basica
# 2. animando grafica
# 3. mejorando animacion

# cargando libreria tidyverse
library(tidyverse)

# instalando paquete para animar
install.packages('gganimate')
library(gganimate)
library(ggplot2)
install.packages('gifski')
library(gifski)
install.packages("magrittr")
library(magrittr)
library(dplyr)

# instalando paquete con los datos
# install.packages("gapminder")

# cargando paquete con los datos
library(gapminder)

# cargando datos a entorno
data("gapminder")

# cargando datos a entorno
head(gapminder)

################################
# 1. grafica básica
################################

g_animada <- gapminder %>% 
  group_by(year, continent) %>%  
  summarize (mean_life = mean(lifeExp)) %>% 
  ggplot(aes(x = year,
             y = mean_life,
             color = continent)) +
  geom_line()

g_animada


################################
# 2. animando grafica
################################
g_animada + transition_reveal(year)


################################
# 3. mejorando animacion
################################
gapminder %>% 
  group_by(year, continent) %>% 
  summarize (mean_life = mean(lifeExp)) %>% 
  ggplot(aes (x = year,
              y = mean_life,
              color = continent)) +
  geom_line(size = 2) +
  geom_point(size = 4) +
  labs (tittle = "Esperanza de Vida en {frame_along}" ,
        x = "Fecha" ,
        y = "AÒos de vida") +
  theme_minimal () +
  transition_reveal(year)