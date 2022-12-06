#Load the data and functions
source("Functions/Libraries.R")
source("Functions/Cleaning.R")

#Save copy of raw data
write.csv(penguins_raw, paste0("data_raw/penguins_raw.csv"))

#Clean the data and save
penguins_clean <- cleaning(penguins_raw)
names(penguins_clean)
write.csv(penguins_clean, paste0("data_clean/penguins_clean.csv"))

#Subset the data so just Adelie
source("Functions/Subsetting_Adelie.R")
Adelie_dataset <- Subsetting_Adelie(penguins_clean)
head(Adelie_dataset)

#Create linear model and assess output
Adelie_model <- lm(body_mass_g ~ culmen_depth_mm, Adelie_dataset)
summary(Adelie_model)
#Statistically significant F value observed

#Plot the linear regression
ggplot(Adelie_dataset, aes(x = culmen_depth_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth(method = "lm", colour = "darkorange") +
  labs(title = "Linear regression for Adelie penguins",
       x = "Culmen Depth (mm)",
       y = "Body Mass (g)") +
  theme_bw()





