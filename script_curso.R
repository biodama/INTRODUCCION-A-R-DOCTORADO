

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


# Creación de data.frame

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


###############################
# DATA.FRAME
###############################


dim(datos)

str(datos)

datos

head(datos,n=2)

tail(datos,n=1)

View(datos)

# DANGER

# fix(datos)


# ACCESO A ELEMENTOS DE UN DATA.FRAME

datos$edad

datos$"edad"


# notación matricial

datos[FILAS , COLUMNAS]

datos [ c(2) , c(3) ]

datos[    , c(2)    ]

datos$edad

datos[    , 2 ]

datos[ c(1,2) , c(2)  ]

datos[ c(1,2) , c(2,3)  ]


# Nos da en que directorio estoy
getwd()

# Establece el directorio de trabajo.
setwd("")


# Establezco el setwd en la carpeta que contiene los fichero a importar
setwd("C:\\Users\\FGM\\Desktop\\INTRODUCCION-A-R-DOCTORADO-main\\datos\\")

tabla<-read.table("datos.curso1.txt", header=TRUE, sep="\t")

library("openxlsx")

datos <- read.xlsx(xlsxFile="/Users/pfernandezn/Desktop/datos.evaluacion.xlsx",sheet=1)

datos <- read.xlsx("/Users/pfernandezn/Desktop/datos.evaluacion.xlsx",1)

##########################################

datos

datos[   ,   ]


# datos$"sexo"=="Mujer" # resultado de esto es un vector lógico (TRUE/FALSE)

criterio <- c(datos$"sexo"=="Mujer") 
datos [criterio ,     ]

datos [c(datos$"sexo"=="Mujer"),     ]


class(datos$"sexo")
class(datos$"estado.civil")

datos [datos$"sexo"=="Mujer" & datos$"estado.civil"=="Casado" ,1:5 ]

# %in% selecciona sin tener en cuenta los NA (missing)
datos [datos$"sexo"%in%"Mujer" & datos$"estado.civil"%in%"Casado" ,1:5 ]



# Lo utizalos para dos cosas principalmente:

# 1) Hacer una sub-base

datos.mujeres <- datos [datos$"sexo"=="Mujer" ,     ]


# 2) Recodificacion de valores

datos.new <- datos

datos.new[c(1) , c(3)] <- "Hombre.new"

head(datos.new)


# Ejemplo: el paciente de ID=90 es mujer (comprueba)

class(datos.new$"ID")

datos.new[datos.new$"ID"==90, c(3) ] <- c("Hombre")

datos.new[datos.new$"ID"==90, c(3) ]


# Ejemplo: ¿cuantos casados hay en la base de datos "datos" ?


datos.casados  <-  datos [datos$"estado.civil"=="Casado" ,     ]
dim(datos.casados)


dim(datos [datos$"estado.civil"=="Casado" ,     ])


# Ejemplo: Sustituir el valor de Mujer por woman en la variable sexo

datos[datos$"sexo"=="Mujer" ,   3     ]   <-  c("woman")



# Ejemplo: Sustituir el valor “Bajo” en la variable nivel.estudios por el valor de “B”

datos[datos$"nivel.estudios"=="Bajo", 5] <- c("B")

datos[datos$"nivel.estudios"=="Bajo", c("nivel.estudios")] <- c("B")



# AÑADIR VARIABLES

datos$"año"   <- c(2024)



# UNIR BASES DE DATOS

datos_para_unir <- datos[   ,   c(1,2)]

datos_union <- cbind( datos, datos_para_unir)


# AÑADIR REGISTROS

datos_para_unir <- datos[ c(1,2,3)  ,    ]

datos_union <- rbind( datos, datos_para_unir)


# ELIMINAR REGISTROS

datos.new <- datos[-c(1,2,3) , -c(2) ]


# Nombres de las variables de un data.frame


names(datos) [  c(1,3)  ] <- c("ID_new","Sex")


# Nombres de filas

datos <- read.xlsx(xlsxFile="/Users/pfernandezn/Desktop/datos.evaluacion.xlsx",sheet=1)

datos_new<-datos[c(4,1,7) ,   ]

row.names(datos_new) <- NULL
 
















