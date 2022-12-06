Subsetting_Adelie <- function(data_clean){
  data_clean %>%
    filter(!is.na(body_mass_g)) %>%
    filter(!is.na(culmen_depth_mm)) %>%
    filter(species == 'Adelie Penguin (Pygoscelis adeliae)') %>%
    select(species, body_mass_g, culmen_depth_mm)
}