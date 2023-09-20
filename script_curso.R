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

datos$"sexo"[datos$"sexo"=="Mujer" & datos$"edad">=50] <- "mayores_m"


datos[datos$"sexo"=="Mujer" ,  c("sexo")] <- "M"



datos$"sexo_new"<-NA

datos$"sexo_new"[datos$"sexo"=="Mujer" & datos$"edad">=50] <- "mayores_m"




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


library("openxlsx")

datos <- read.xlsx("C:/Users/usuario/Desktop/INTRODUCCION-A-R-DOCTORADO-main/datos/datos.curso1.xlsx")


install.packages("readxl")

library("readxl")

datos2<-read_xlsx("C:/Users/usuario/Desktop/INTRODUCCION-A-R-DOCTORADO-main/datos/datos.curso1.xlsx")


# names y row.names de un data.frame

names(datos)[c(2)] <- c("age")

names(datos)[c(2,3,4)] <- c("age","sex","civil_status")


names(datos)[ which(   names(datos)==c("fumador")   )] <- "smoker"        


datos$"sexo"[datos$"sexo"=="Mujer"]
datos$"sexo"[which(datos$"sexo"=="Mujer")] <- "M"


row.names(datos)<-NULL


# Operaciones aritmeticas


datos$"silvia"<- c(datos$"peso"^2) / c(datos$"edad gr"/2)



# Operaciones logicas


datos$"sexo"=="Mujer"
datos$"sexo"!="Hombre"

datos$"sexo"%in%"Mujer" # equivalente al == pero mejor utilizar esto cuando hay missing.


datos_hombres_jovenes<- datos[datos$"sexo"=="Hombre" | datos$"edad"<=40 , ]



# Operaciones de conjuntos


intersect(datos$"ID",c(200,2000,137))

setdiff(c(200,2000,137),datos$"ID")

indice <- intersect(datos$"ID",c(200,2000,137))

indice


# Secuencias


c(1,7,10,5,3)

seq(from = 2, to = 18, by = 2)

rep( 1,10)

dim(datos)
datos$"ID_seq" <- c(1:200)

datos$"ID_seq" <- seq(from=1,to=200,by=1)


# Missing

sum(is.na(datos$"edad"))  
# which(is.na(datos$"edad"))

datos$"edad"[is.na(datos$"edad")] <-  900

datos$"edad"[which(is.na(datos$"edad"))] <-  900

sum(is.na(datos$"edad"))  


datos$"pedro"<-NA

datos$"edad"[c(1)]<-NA

# para variables caracter/categoricas
sum(is.na(datos$"cancer.prostata"))
table(datos$"cancer.prostata",exclude=NULL)


datos$"cancer.prostata"[is.na(datos$"cancer.prostata")] <- "no se"

table(datos$"cancer.prostata",exclude=NULL)


# Ordenacion


datos_orden1 <- datos[ order(datos$"edad")    ,    ]

datos_orden2 <- datos[ order(datos$"edad",datos$"peso")    ,    ]

datos_orden3 <- datos[ order(datos$"edad",decreasing=TRUE)    ,    ]

datos_orden4 <- datos[order(datos$"estado.civil") ,  ]


# Ejercicios

# 8 sin el apartado d
# 9
# 12
# 14
# 16


table( datos$edad, exclude=NULL     )

mean ( datos$edad   )

read.xlsx ()

vector <- data.frame(  ID=c(1,2,3), edad=c(10,15,23)  )

subbase <- datos[ datos$"edad">=50     ,    c("sexo" ,"edad")         ]


variables <- c("sexo","edad")

subbase <- datos[ datos$"edad">=50     ,    variables   ]


# PETICIONES FINALES

class(datos$"edad")

datos$"edad"<-as.numeric(datos$"edad")

class(datos$"edad")

sum(is.na(datos$"edad"))

datos$"edad"[is.na(datos$"edad")] <- 999 

sum(is.na(datos$"edad"))



datos$"edad_curso" <- NA

datos$"edad_curso"[datos$"edad">=40] <-"maduros"

datos$"edad_curso"[datos$"edad"<40] <-"no tan maduros"

head(datos)

table(datos$"edad_curso",exclude=NULL)



datos_nuevos <- datos[datos$"edad_curso"=="no tan maduros" ,  ]
dim(datos_nuevos)


library("openxlsx")

write.xlsx(x=datos_nuevos,file="datos_nuevos.xlsx")


dim(datos)
datos$"ID_curso" <- seq(from = 1, to = 200 , by = 1)

datos$"ID_curso" <- c(1:length(datos$edad))

1:200



# Graficos

x <- runif(50, 0, 4)
y <- runif(50, 0, 4)


plot(x, y, main = "Mi primer grafico", 
sub = "subtítulo",
xlab = "x label",
ylab = "y label", xlim = c(-1, 5),
ylim = c(1, 5))
abline(h = 2, lty = 1) 
abline(v = 0, lty = 2)
text(1, 4, "Algo de texto")
mtext("mtext", side = 1)
mtext("mtext en side 2", side = 2, 
line = -3, cex = 2)


par(mfrow = c(2, 2))
plot(rnorm(10))
plot(runif(5), rnorm(5))
plot(runif(10))
plot(rnorm(10), rnorm(10))







