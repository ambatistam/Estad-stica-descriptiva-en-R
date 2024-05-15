# Crear un dataframe de ejemplo con datos categóricos
set.seed(123)
data <- data.frame(Categoria = sample(c("Rojo", "Azul", "Verde", "Amarillo"), 200, replace = TRUE, prob = c(0.1, 0.2, 0.6, 0.1)))

# Crear la tabla de frecuencias
tabla_frecuencias <- table(data$Categoria)

# Identificar la moda
moda <- names(which.max(tabla_frecuencias))

# Calcular frecuencias relativas
frecuencias_relativas <- tabla_frecuencias / sum(tabla_frecuencias)

# Calcular el índice de Blau
indice_blau <- 1 - sum(frecuencias_relativas^2)

# Número de categorías
num_categorias <- length(tabla_frecuencias)

# Calcular el Índice de Variación Cualitativa
denominador_ivc <- (num_categorias - 1) / num_categorias
indice_variacion_cualitativa <- indice_blau / denominador_ivc

# Calcula la frecuencia máxima
max_frecuencia <- max(tabla_frecuencias)

# Calcula el total de datos
total_datos <- sum(tabla_frecuencias)

# Calcula la razón entre el intervalo con la mayor frecuencia absoluta y el total de los datos
razon_max_total <- max_frecuencia / total_datos

# Define el objeto RV con la fórmula dada: 1 menos la razón calculada
RV <- 1 - razon_max_total

# Crear un gráfico de barras
barplot(tabla_frecuencias, main = "Frecuencia de Categorías", ylab = "Frecuencia", col = rainbow(num_categorias), las = 2)
legend("topright", legend = names(tabla_frecuencias), fill = rainbow(num_categorias))

# Imprimir resultados
print(paste("Moda:", moda))
print(paste("Índice de Blau:", round(indice_blau, 4)))
print(paste("Índice de Variación Cualitativa:", round(indice_variacion_cualitativa, 4)))
print(paste("RV:", round(RV, 4)))