###############################################################
###############################################################
###############################################################
###############################################################

rm(list=ls()) # borro todos los objetos del workspace (area de trabajo)
gc()

################################################
################################################
# Info session
################################################
################################################

# R version 4.1.0 (2021-05-18)

# install.packages("openxlsx") instalar paquete
# openxlsx_4.2.5.2 

# install.packages("readxl")
# readxl_1.4.2

################################################
################################################
# Packages to load
################################################
################################################

library("openxlsx") # cargamos paquete openxlsx
library("readxl")   # cargamos paquete readxl

################################################
################################################
# Manejo basico datos
################################################
################################################

ls() # listo los nombres de los objetos creados o cargados en la sesion

# Creacion de vector (variable) en el workspace

x <- c(1,2,3)
# x = c(1,2,3)

rnorm(n=c(1000))
rnorm(n=1000)

z <- c(TRUE,FALSE,TRUE) # vector logico

y <- c("Low","Low","Medium","High") # vector tipo caracter


p <- c("12","bajo","alto","alto")

p <- c(12,"bajo","alto","alto")


# Creacion de data.frame (base de datos clasica) en el workspace

datosGEN <- data.frame(ID = c("gen0","genB","genZ"),
subj1 = c(10, 25, 33), 
subj2 = c(NA, 34, 15), 
oncogen = c(TRUE, TRUE, FALSE),
loc = c(1, 30, 125))

ls()

datosGEN


# Borramos objetos del workspace

ls()

rm(p,x) # borro p y x


ls()

rm(list=ls()) # borro todos los objetos del workspace (area de trabajo)

#########################
# Atributos de objetos
#########################

# vector
class(y)
length(y)


# data.frame
class(datosGEN)
dim(datosGEN) # el equivalente a length de un vector

str(datosGEN)  # Cuidado con bases de datos muy grandes
names(datosGEN)# Cuidado con bases de datos muy grandes



is.numeric(y)
is.character(y)


var <- c("12","1","6","7")

var_num <- as.numeric(var)
var_num
class(var_num)


Var_num<-c("holaaaaaa")




