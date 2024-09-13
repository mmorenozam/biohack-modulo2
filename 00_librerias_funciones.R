if (!require("rlang")) install.packages("rlang")

library(palmerpenguins)
library(ggplot2)
library(dplyr)
library(rlang)

# Funcion para plotear el largo vs la profundidad del pico por sexo
# Añade una linea de regresión a los puntos
# Argumentos: especie = especie de pinguino; isla = isla donde vive la especie

plt_function <- function(especie, isla){
  penguins %>%
    filter(species == parse_expr(especie) & island == parse_expr(isla)) %>%
    filter(!is.na(sex)) %>%
    ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
    geom_smooth(method = "lm", formula = y ~ x) + 
    geom_point() +
    facet_wrap(~ sex, scales = "free_x") +
    theme_bw()+
    labs(title = "Largo de pico vs. profundidad de pico",
         subtitle = paste0("Especie: ", especie, ". Isla: ", isla),
         x = "largo (mm)", y = "profundidad (mm)")
}