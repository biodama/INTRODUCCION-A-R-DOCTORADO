

####################################
####################################
#         MI SCRIPT
####################################
####################################

####R version 4.4.0 (2024-04-24) -- "Puppy Cup"####
####openxlsx_4.2.7

library(openxlsx)

sessionInfo()


### MIS PRIMEROS PASOS

datos <- c(1,2,3) # CREO UN VECTOR

plot(datos)

### AYUDA

?rnorm

par(mfrow = c(2,1))
plot(function(x) dnorm(x, log = TRUE), -60, 50,
     main = "log { Normal density }")
curve(log(dnorm(x)), add = TRUE, col = "red", lwd = 2)
mtext("dnorm(x, log=TRUE)", adj = 0)
mtext("log(dnorm(x))", col = "red", adj = 1)

###############################
###############################
# MANEJO BÁSICO DE DATOS
###############################
###############################

ls() # listar los nombres de los objetos creados o importados sesión


# Creación de vector

x <- c( 1 , 2 , 3 , 4 )

x2 <- c("1","2","3","4")

y <- c( "low" , "high" , "medium" , "low" )

z <- c(TRUE, FALSE,TRUE,FALSE)


# Creación de datos.frame

datos <- data.frame(ID=c(1,2,3) ,
edad=c(10,13,55)  ,
peso=c(40,15,100) ,
nivel.estudios=c("alto","alto","bajo") ,
cancer=c(TRUE,FALSE,TRUE))

ls()

# El ;

x <- c( 1 , 2 , 3 , 4 ) ; x2 <- c("1","2","3","4")


# Eliminar objetos del workspace

ls()

rm(y,x)

ls()

# Atributos de objetos (vectores)

class(x)

length(x)

# Atributos de objetos (data.frame)

class(datos)

dim(datos) # 3 filas 5 columnas

str(datos)

# Cambiar atributo de objeto as.numeric(), as.character()..

class(x2)

x2.numerica <- as.numeric(x2)

class(x2.numerica)

x3 <- c("1","3",5,"10","-")

x3.numerica <- as.numeric(x3) 


