# Contestar

# n?mero de variables?
# nombre de las variables?
# N?mero de modelos de carros Observados? 
# toda la informaci?n de los Modelos con 4 cilindros

# Probar algunas Funciones
head(mtcars) # 1
str(mtcars)  # 2
summary(mtcars)  # 3
colSums(mtcars)  # 4
colMeans(mtcars)  # 5
mtcars[mtcars$cyl==4 & mtcars$carb ==2,] 

## Ejemplo
mtcars
x<-mtcars$cyl
y<-mtcars$gear
z<-mtcars$mpg

#Funciones b?sicas
length(x) #n?mero de elementos en x 
sum(x) #suma de los elementos de x 
prod(x) #producto de los elementos de x 
max(x) #valor m?ximo en el objeto x 
min(x) #valor m?nimo en el objeto x 
range(x) #rango de x.  Diferencia entre el valor m?ximo y valor m?nimo 
which.max(x) #devuelve el ?ndice del elemento m?ximo de x 
which.min(x) #devuelve el ?ndice del elemento m?nimo de x 
which(x == 4) #devuelve un vector de los ?ndices de x si la operaci?n (ej. x = a) es (TRUE). x es el vector y a es el valor a comparar. 
match(x, y) #devuelve un vector de la misma longitud que x con los elementos de x que est?n en y (NA si no) 
unique (x) #Devuelve los valores ?nicos

#Analisis exploratorio de datos

mean(z) #promedio de los elementos de x 
median(z) #mediana de los elementos de x 
var(z) #varianza de los elementos de x 
round(z, 0) #redondea los elementos de x a n cifras decimales 
rev(z) #invierte el orden de los elementos en x 
sort(z) #ordena los elementos de x en orden ascendente

##A continuaci?n, vamos a cargar la base de datos de las Islas Gal?pagos de la librer?a Faraway.
install.packages("faraway") #instala el paquete faraway
library(faraway) #carga el paquete faraway
try(data(package = "faraway")) #lista las BD incluidas en el paquete
"faraway"
help(gala) #informaci?n de la data gala
data(gala) #carga la base de datos especificada (gala)
gala #muestra la base de datos gala
dim(gala) #indica la dimensi?n de la base de datos
names(gala) #Muestra los nombres de las variables
summary(gala) #Visualiza un resumen de las variables
pairs(gala) #matriz de diagramas de dispersi?n


#Ejemplos aplicados
# MEDIA  ####

especies<-gala$Species
mean(especies) #una variable numerica

mtcars
#names(mtcars)
by(mtcars$mpg, mtcars$cyl, mean) #Una num?rica y una categ?rica

# MEDIANA ####

median(especies)

#MODA ####

moda <- function(especies) {
  return(as.numeric(names(which.max(table(especies)))))
}
moda(especies)

#CUANTILES ####

quantile(especies, prob = c(0.25, 0.5, 0.75), na.rm = TRUE)

#MEDIDAS DE DISPERSION
range(especies)
max(especies)
min(especies)

#RANGO INTERCUARTILICO ####
IQR(especies) 

# vARIANZA ####
var(especies)

# DESVIACI?N ESTANDAR ####
sd(especies)

#COEFICIENTE DE VARIACION ####
CV<- (sd(especies)/mean(especies))*100
CV

CV_otraforma<-(sd(gala$Species)/mean(gala$Species))*100
CV_otraforma

# MEDIDAS DE FORMA ####

install.packages ("moments")
library(moments)

asimetria<-skewness(especies)
asimetria

curtosis<-kurtosis(especies)
curtosis
