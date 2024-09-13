library(palmerpenguins)
tabla_resumen <- penguins %>%
  filter(!is.na(sex)) %>%
  group_by(species, island) %>%
  summarise(obs = n(body_mass_g), media = mean(body_mass_g), desv.std = sd(body_mass_g))
