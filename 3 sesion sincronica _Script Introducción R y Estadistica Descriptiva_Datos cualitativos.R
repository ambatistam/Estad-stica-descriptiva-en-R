0### ESTADISTICA DESCRIPTIVA DATOS CUALITATIVOS ####

install.packages(readxl)
install.packages(ggplot2)
install.packages(dplyr)

library(readxl)         # for reading in excel data
library(ggplot2)        # for generating visualizations
library(dplyr)

#  Definir directorio de trabajo ###############################################

setwd("C:/Users/angelica.batista/Documents/3. Personal/UPB/Septiembre 2023/Data/")
getwd()
list.files()

### Cargar datos ###
bats <- read.csv("Bats_data.csv")
goldman_prices <- read.table(file="goldman_prices.txt", header=TRUE)
supermarket <- read_excel("supermarket_transactions.xlsx", sheet = 2)

# Exploraci?n

head(supermarket[, c(3:5,8:9,14:16)])
names(supermarket)

head(goldman_prices)
names(goldman_prices)

head(bats)
names(bats)

## Estadisticos Descriptivos para variables discretas####

presencia_aves <- c('Frecuente', 'Nunca', 'A veces', 'A veces', 'A veces','Nunca', 'Frecuente', NA, 'Frecuente', NA, 'Permanente','Nunca', 'Permanente', 'Frecuente', 'Nunca')
sexo <- c('Macho', 'Macho', 'Macho', NA, 'Hembra','Juvenil', 'Hembra', 'Hembra', 'Hembra', 'Macho', 'Hembra','Macho', NA, 'Hembra', 'Hembra')

table(presencia_aves)
table(sexo)

#De la tabla anterior vemos que NO aparece el conteo de los NA, para obtenerlo usamos lo siguiente.
table(presencia_aves, useNA='always')
table(sexo, useNA='always')

#Ahora una tabla a dos vias

tabla2 <- table(sexo, presencia_aves)


# Tabla de contingencias: calculan recuentos para cada combinaci?n de variables categ?ricas

# cuenta para categor?as de g?nero
table(supermarket$Gender)

# clasificaci?n cruzada cuenta para el g?nero por estado civil.
table(supermarket$`Marital Status`, supermarket$Gender)

# Recuento de clientes en todas las ubicaciones por g?nero y estado civil
table1 <- table(supermarket$'Marital Status', supermarket$Gender, supermarket$'State or Province')
ftable(table1) #produce tablas multidimensionales basadas en tres o m?s variables categ?ricas

#Rango de datos
#n?mero de clases
#moda
#mediana
#?ndice de dispersi?n Blau
#raz?n de variaci?n