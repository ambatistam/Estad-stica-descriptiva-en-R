# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# BASES GR?FICAS DE R ##########################################################
# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Se ver? el uso de los datos muestra en R. Y se dar?n las bases pare el dise?o 4 tipos de gr?ficas esenciales en R: 
# histogramas, Gr?ficas de dispersi?n, Gr?ficos de caja y bigotes y Grpaficos de barra. 

# de un vistazo a los parametros que se pueden definir con la funci?n par. 
?par

# observe cuales son los par?metros actuales por defecto. Busque 3 par?metros de inter?s dentro de la ayuda ?par
# y vea como est?n definidos.
#par()

# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# 1 Gr?fico de dispersi?n /Scatterplot #########################################
# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Gr?fica 1

plot(log2(1:20))
plot(log2(1:20), type="p", main="Ejemplo", ylab="Logs")
plot(log(1:20), col="blue", cex=0.5)

plot(log2(1:20), type="l", main="Ejemplo", ylab="Logs")
# # # En el gr?ficos anteriores pruebe:
# cambiar type con  "l","b","h",
# cambiar cex 
# cambiar el color usando los nombres que aparecen en la lista 
# arrojada por la funci?n colors(). Ver la siguiente l?nea
colors() # ver colores


# # # Superponer varias gr?ficas (gr?ficas de alto y bajo nivel)

x11()# atenci?n aqu? se abrira una nueva ventana. Las gr?ficas aparecer?n all?
plot(log2(1:20), type="l", main="Ejemplo", ylab="Logs", lty=1)
lines(log10(1:20), col="red", lty=1)
lines(log(1:20), col="blue", lty=1)

legend(x="bottomright", legend = c("log2", "log10", "log"),
       lty=c(1,1,1), 
       col=c("black", "red", "blue"))


dev.off()# este comando cierra el dispositivo gr?fico actual.Borra la gr?ficas



# Gr?fica 2

data(women)
head(women)

plot(weight~height,data=women) # usar una formula


# Dise?ar la gr?fica
plot (weight~height,data=women, xlab= "estatura", ylab="peso", 
      xlim=c(55,75), ylim=c(110,170), pch=22, col="red",
      bg="yellow", main="Estatura vs Peso")

# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# 2. HISTOGRAMA  ###############################################################
# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Configurar el dispositivo de gr?fico

datos<-rnorm(n=1000, m=50, sd=8) # creaci?n de n?meros aleatorios
plot (datos, cex=0.5)

hist(datos)

# definir los intervalos
op<- par(mfrow=c(2,2))
hist(datos, breaks=10, main="Cortes=10")
hist(datos, breaks=5, main="Cortes=5") 

#Explorar datos para definir intervalos
# Opcional

summary(datos)
hist(datos, breaks=seq(20,90,by=5), main="Cortes personalizados")
histinfo<-hist(datos, breaks=seq(20,90,by=5), main="Cortes personalizados")#obtener informaci?n del histograma
histinfo

dev.off()

# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# 3.DIAGRAMA DE CAJAS Y BIGOTES ################################################
# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

data(PlantGrowth)
head (PlantGrowth)
str(PlantGrowth)
unique(PlantGrowth$group)
boxplot(weight~group,data=PlantGrowth)

# completar main, xlab, ylab

# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  Ejercicios ##################################################################
# # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# Con los datos del marco de datos CO2 hacer: 
# 1. Un gr?fico de dispersi?n de las concentraciones de CO2 en el ambiente (conc)
# vs el CO2 fijado por la planta(uptake) .Personalize los puntos y asigneles color

# 2. Un gr?fico de cajas y bigotes  de las concentraciones el CO2 fijado 
# por la planta agrupado por el CO2 en el ambiente 
# Tenga en cuenta el dar nombres a los ejes y a la gr?ficas. 


# 3 Histograma de la variable uptake 

# 4 Histograma de la variable uptake, pero s?lo para la Type "Quebec"

# 5.  Realize un gr?fico de barras de los promedios de las concentraciones del CO2
# fijado por la planta agrupado por variedad ("Type") : Pista : use las funci?n tapply 
# para obtener los datos que necesita.

# Tenga en cuenta el dar nombres a los ejes y a la gr?ficas. 

# Soluci?n 

plot(CO2$conc,CO2$uptake)
boxplot(uptake~conc, data=CO2)
hist(CO2$uptake[CO2$Type=="Quebec"])
hist(CO2$uptake[CO2$Type=="Mississippi"])
promedio<-tapply(X=CO2$uptake,IND=CO2$Type,FUN=mean)
barplot(promedio)


# Barplot  ####################################################################################

# 1.diagram de barras
head (mtcars)
unique(mtcars$carb)
(frec_car<- table(mtcars$carb))
barplot(frec_car, axes= TRUE)
