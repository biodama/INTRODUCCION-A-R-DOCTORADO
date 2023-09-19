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

#########################
# Data frame
#########################

# Cargo workspace

ls()

load("C:\\Users\\usuario\\Desktop\\datos.curso1.RData")

ls()


class(datos)
dim(datos)

str(datos)


fix(datos) # Cuidado que puedo modificar los datos sin que quede constancia

View(datos) # La mas recomendable de lo malo

head(datos,n=10)
head(datos,n=6)
?head

tail(datos,n=10)


# Acceso a elementos


datos$"edad"

datos$"estado.civil"


datos$"edad"[ c(1,6) ]

datos[ FILAS , COLUMNAS ]

datos_new <- datos[  c(1,6)  ,  c(2)  ]

datos_new2 <- datos[  , c(2,3) ]

datos_new3 <- datos[  , c(3,2) ]

datos_new4 <- datos[  , c("edad","sexo") ]


# Vector de indices(posiciones), vector lógico, condición lógica sobre otros vectores (variables), etc

datos[ FILAS , COLUMNAS ]

table(datos$"sexo")

datos.mujer <- datos [datos$"sexo"=="Mujer" , c("ID","sexo","peso","altura")  ]


datos.mujer1 <- datos [datos$"sexo"=="Mujer" ,  ]

datos.mujer2 <- datos.mujer1[ datos.mujer1$"estado.civil"=="Casado" ,  ]


datos.mujer.final <- datos [datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado" ,   ]

datos_hombres_jovenes<- datos[datos$"sexo"=="Hombre" & datos$"edad"<=40 , ]



# Recodificaciones

datos.curso <- datos

datos.curso[1 , 3] <- "Hombre"

datos.curso[datos.curso$"ID"==200 , c("sexo") ] <- "Mujer"


# Anadir variables

datos$"edad"
datos[ , c(2)]
datos[ , c("edad")]


datos$"edad_new" <- datos$"edad"/2

datos$"edad_new" <- datos[ , c("edad")]/2

datos$"juventud" <- datos$"edad"<=50

datos$ID_labo<- c(1)

# Eliminar registos y/o variables

datos_reducido<-datos[-c(1,2),-c(2,4)]


# Sustituir el valor de "Mujer" por "M" en la variable Sexo

datos$"sexo"[datos$"sexo"=="Mujer"] <- "M"

datos[datos$"sexo"=="Mujer" ,  c("sexo")] <- "M"





attach # peligros y un poco sucio


################################
# IMPORTACION
################################


# Nos da en que directorio estoy
getwd()

# Establece el directorio de trabajo.
setwd("")


# Establezco el setwd en la carpeta que contiene los fichero a importar
setwd("C:\\Users\\FGM\\Desktop\\INTRODUCCION-A-R-DOCTORADO-main\\datos\\")
tabla<-read.table("datos.curso1.txt", header=TRUE, sep="\t")


# Importando base de datos con ruta absoluta
tabla<-read.table(file="C:/Users/FGM/Desktop/INTRODUCCION-A-R-DOCTORADO-main/datos/datos.curso1.txt", header=TRUE, sep="\t")

# Importando base de datos con ruta relativa desde un directorio superio 

tabla<-read.table(file="datos/datos.curso1.txt", header=TRUE, sep="\t")


#Importa base de datos, "" y \t lo interpreta como tabulación

tabla<-read.table("datos/datos.curso1.txt", header=TRUE, sep="")
tabla<-read.table("datos/datos.curso1.txt", header=TRUE, sep="\t")

#Importación cambiando el argumento stringsAsFactor para que las variables la importe de tipo factor
tabla<-read.table("datos/datos.curso1.txt", header=TRUE, sep="\t", stringsAsFactors=TRUE)

#Importación sin variable tipo factor
tabla<-read.table("datos/datos.curso1.txt", header=TRUE, sep="", stringsAsFactors=F)




