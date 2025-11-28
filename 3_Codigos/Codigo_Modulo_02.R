##########################################################################################################################
######################################                                              ######################################
###################################### MODULO 2: IMPORTACION Y MANEJO DE DATOS EN R ######################################
######################################                                              ######################################
######################################                Benjamín Muñoz                ######################################
##########################################################################################################################

rm(list=ls())

#####TEMA 1: DIRECTORIO DE TRABAJO

#El área o espacio de trabajo (workspace)corresponde a tu trabajo actual en el entorno de R, 
#incluyendo todos los objetos utilizados (datos de distinto tipo, paquetes,etc.).Al cerrar R, 
#tendrás la opción de salvar el espacio de trabajo actual, el cual se cargara de manera automática 
#la próxima vez que uses R. ES PREFERIBLE NO HACER ESTO. Al cerrar la Consola de R aparecerá una ventana,
#donde recomiendo apretar NO. Al guardar el área de trabajo, la próxima vez que uses R el programa 
#"recordará" la sesión anterior, pero probablemente tú no, por lo que se pueden generar confusiones. 

#¿Cómo pueden observar/saber qué hay en el espacio de trabajo?

ls()   #Es el comando básico para listar
#Navegación de Flechas del Teclado desde la Consola

#Es posible observar las:  (i)  Operaciones previas ya realizadas.
#                          (ii) Objetos Ingresados en R.    
#                          (iii)Paquetes.     
#                          (iv) Comandos Ingresados.  


#Por último, es importante considerar otros comandos de gran utilidad en el manejo del área de trabajo en R:
  
  
  #rm(objectlist)      #Remueve uno o más objetos.
  #rm(list=ls())       #Remueve todos los objetos.    
  #fix(x)              #Genera una ventana con el marco de datos especificado  (en Windows únicamente)
  #attach()
  #detach()
 #history(#)          #Presenta los últimos comandos ejecutados (default = 25).

#Ahora, no solo es importante el espacio de trabajo, sino que también el directorio al cual está 
#anclado. Dicho directorio es la carpeta en que almacenarán por defecto los archivos guardados. A su vez,
#es el lugar por defecto dónde R buscará archivos.

#El directorio de trabajo vigente es el directorio de R donde se leen
#y guardan los archivos por default. Con el comando getwd() se puede saber cual
#es el que se está usando:

getwd() #Get Working Directory= Obtener/Acceder/Ver el Directorio de Trabajo


#Es posible modificar dicho directorio de trabajo con el comando setwd(). Hay
#tres detalles importantes:

#1)Utilizar las comillas ""  al fijar el nuevo directorio.
#2)Utilizar / y no los típicos \ como separación. 
#3)La escritura de los separadores depende del sistema operativo:

setwd("/Users/Benjamin/Dropbox/3 Docencia/4 Taller de R EVMM2017/Codigos/Modulo_02")

#Aquí cada uno pone la dirección que le acomode


#Otras funciones útiles en ocasiones:


  #savehistory("archivo")       Guarda el historial de comandos (default =.Rhistory).
  #loadhistory("archivo")       Carga el historial de comandos (default = .Rhistory).
  #save.image("archivo")        Guarda el espacio de trabajo (default = .RData).
  #save(objeto, file="archivo") Guarda objetos específicos de R.
  #load("archivo")              Carga un archivo al ambiente de trabajo.
  #q()                          Cierra R.

#Mi consejo es únicamente utilizar save() y load().

#Al terminar una sesión de trabajo, es preferible únicamente guardar el Script.

# q() o quit()              #Equivale a quit o salir del programa

#NO es recomendable guardar el área de trabajo (workspace), ya que quedarán 
#almacenados en la Consola los datos y objetos construidos. Preferible es 
#volver a correr el script.


##########################################################################################################################
 
#####TEMA 2: DATOS DESDE PAQUETES


#Ahora es importante analizar distintas maneras de ingresar datos:

#1)Ingresarlos manualmente en R, como se ha mostrado previamente.
#2)Ingresarlos manualmente generando un marco de datos vacío y luego editarlo.

df1<-data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
df1<-edit(df1)

#Son pocos útiles y existen alternativas más convenientes

#Cargar bases de datos desde paquetes:

data("mtcars")
class(mtcars)
summary(mtcars)

data("bondyield")
summary(bondyield)
install.packages("lmtest")
library(lmtest)
data("bondyield")
summary(bondyield)
class(bondyield)
summary(bondyield)
dim(bondyield)
?bondyield


#Archivos .RData

#Los objetos de R (.RData) pueden ser simplemente arrastrados hasta la consola de R 
#para ser utilizados. Otra alternativa es usar el comando load(), procurando indicar el 
#nombre del archivo entre comillas ("") e indicando el tipo de archivo.

load("ENACOES1.RData") #Noten que es distinto el nombre del archivo que del objeto
names(enacoes1)
summary(enacoes1)
dim(enacoes1)

#ATTACH Y DETACH

#El comando attach() es utilizado para adjuntar datos al camino de búsqueda de R 
#(R search path). Esto es, R buscara los datos en este camino cuando se  menciona cierta variable. 
#A modo de ejemplo, en la base de datos hay una variable "b15_a",que indica la confianza en el 
#Congreso Nacional:

b15_a

names(enacoes1)

#R NO es capaz de encontrar la variable. Ahora especificare a R que busco la variable b15_a 
#del marco de datos enacoes1, para lo cual uso el símbolo $, que identifica las partes específicas 
#de un objeto. 

enacoes1$b15_a

#Ahora bien, se puede usar el comando attach() para que los datos queden 
#adjuntados y sea innecesario indicar el data frame

attach(enacoes1)

summary(b15_a)
table(b15_a)/1986


#Ahora bien, NO recomiendo utilizar attach(). La principal razón, es que la ventaja de R se encuentra
#en manipular simultáneamente muchos objetos, varios de ellos pueden ser similares e incluso tener
#variables con el mismo nombre. Esto puede dar pie a confusiones

#El comando detach() permite remover un data frame del camino de búsqueda de R,
#pero no tiene ningún efecto sobre el marco de datos en sí. 

detach(enacoes1)
ls()          #Sigue estando ahí


##########################################################################################################################

#####TEMA 3: IMPORTACION DESDE ARCHIVOS PLANOS

#ARCHIVO DE TEXTO DELIMITADO (por ejemplo ASCII)

#Aquí se utiliza el comando read.table() con sus especificaciones. La forma
#general es la siguiente

#misdatos<-read.table(file,header=logical_value,sep="delimiter",
#          row.names="name")

# file corresponde al nombre un archivo de texto delimitado. También se puede
# especificar file=file.choose(), o solo indicar file.choose() para buscar
# manualmente el archivo.

#El argumento header puede tomar los valores T o F, dependiendo de si la
#primera fila contiene los nombres de las variables. No pueden existir 
#espacios en blanco.

# El argumento sep especifica los delimitadores que separan los valores de los
# datos. Entre los más usados están:

#sep=","      #Es un archivo separado por comas, como el caso de un archivo .csv
#sep="\t"     #Es muy usado por su amplitud y seguridad. Delimitado por tab.
#sep=" "      #Es el formato por default. Delimitado por uno o más espacios. 


golder<-read.table(file="golder.txt",header=T,sep="\t") #Usar golder.txt
#golder<-read.table(file=file.choose(),header=T,sep="\t") #Usar golder.txt

?read.table

#Los datos de naturaleza lógica y de caracteres son transformadas en factores.

#El comando read.table también puede ser utilizado para leer archivos desde 
#Internet:

prestigio<-read.table("http://socserv.socsci.mcmaster.ca/jfox/books/Companion/data/Prestige.txt",header=T)

View(prestigio)
head(prestigio)
prestigio


#Existen más de 10 comandos que se pueden utilizar para leer archivos de texto.
#Sin embargo, es preferible utilizar siempre este comando básico.

install.packages("readr")
library(readr)
?read_table

##########################################################################################################################

#####TEMA 4: IMPORTACION DESDE EXCEL


#Cargar Libro de Excel

install.packages("readxl")
library(readxl)

#Modificar path
#prestigio1 <- read_excel(path="prestige.xls")
prestigio1    #La función genera un table_dataframe o tbl; tibble.

golder<-read.table(file="golder.txt",header=T,sep="\t") #Usar golder.txt

install.packages("dplyr")
library(dplyr)
golder1 <- tbl_df(golder)
golder1

#Ahora una versión más compleja
temporal=tempfile(fileext=".xls")
download.file(url="http://sedlac.econo.unlp.edu.ar/download.php?file=archivos_estadistica/inequality_LAC_2015-06.xls",destfile=temporal)

#Generar listas vacias para almacenamiento
datosbrutos  <- list(NA)

#Extraccion de datos de cada hoja del libro excel
for(i in 1:18){
  datosbrutos[[i]] <- read_excel(path =temporal,sheet=i,col_names = F)
  colnames(datosbrutos[[i]])[1] <- "Col0"
}
View(datosbrutos[[3]])

#LECCIÓN: SON DISTINTAS LAS BASES DE DATOS QUE LAS TABLAS



##########################################################################################################################

#####TEMA 5: IMPORTACION DESDE SOFTWARES ESTADISTICOS ESPECIALIZADOS

install.packages("foreign")
install.packages("sjmisc")
install.packages("sjlabelled")
library(foreign)
library(sjmisc)
library(sjlabelled)

?read.dta
casen09 <- read.dta("casen2009stata.dta")

#Esta era la función por defecto utilizada para leer archivos desde Stata. Sin embargo,
#la evolución de los formatos .dta con las versiones 13 y 14 han disminuido su utilidad. En cambio, usaremos:

#read_stata(path, atomic.to.fac = FALSE, enc = NULL)

coes <- read_stata("ENACOES_2014_V4.dta",atomic.to.fac = T)

View(coes)
frq(coes$P1)

#Es importante que se informen sobre los paquetes. Para aquello el comando 
#help() es de utilidad:
#help(package="nombre_del_paquete")

cep <- read.spss("EncuestaCEP71.sav", to.data.frame = TRUE,use.value.labels = FALSE,reencode = "UTF-8")
#Arroja varias advertencias

#read_spss(path, atomic.to.fac = FALSE, tag.na = FALSE)

cep1 <- read_spss(path="EncuestaCEP71.sav",atomic.to.fac = T)

install.packages("Hmisc")
library(Hmisc)
cep2 <- spss.get(file="EncuestaCEP71.sav",use.value.labels = T)


#ETIQUETAS

names(coes)
summary(coes$P1) #Corresponde a sexo

coes$P1a <- factor(coes$P1,levels=c(1,2),labels=c("Hombre","Mujer"))
summary(coes$P1a) 

#Funciones de etiquetas en paquete sjmisc
get_label(coes$P1)
get_labels(coes$P1)


#DATOS DESDE INTERNET

install.packages("rqog")
library(rqog)

#Quality of Government dataset
qog <- read_qog ( which.data = "standard", data.dir = "datosQoG")

install.packages("WDI")
install.packages("RJSONIO")
library(WDI)

WDIsearch("gdp")  #GDP
WDIsearch("gini") #SI.POV.GINI

country_data <- WDI(indicator = c("SI.POV.GINI","NY.GDP.PCAP.CD","NY.GDP.PCAP.KD","NY.GDP.PCAP.PP.CD","NY.GDP.PCAP.PP.KD"), start = 1990, end = 2015,country=c("AR","BO","BR","CL","CO","CR","DO","EC","SV","GT","HN","MX","NI","PA","PY","PE","UY","VE"))  
View(country_data)

?save
save(country_data,file="DatafromWB.RData")

?write_stata

##########################################################################################################################

#####TEMA 6: EXPLORACION DE DATOS BASICA Y LIMPIEZA DE ÉSTOS

load("Casen13Urbana.RData")
load("Casen13Rural.RData")
load("Casen13Indicadores.RData")

#UNIR DOS BASES DE DATOS

#Las bases de datos (o de manera más genérica cualquier objeto en R) pueden 
#unirse de dos modos.

#1) Agregando Observaciones (Suma Vertical)

names(casen13_urb)
names(casen13_rur)

casentotal <- rbind(casen13_urb,casen13_rur)
dim(casen13_urb)
dim(casen13_rur)
dim(casentotal)
176429+42062

summary(casentotal$sexo)

summary(casen13_rur$sexo)
summary(casen13_urb$sexo)
casentotal[176429:176430,]

names(casentotal)
dim(casentotal)

names(casen13b)
dim(casen13b)

options(scipen=999)
head(casentotal$folio)
head(casen13b$folio)


casentotal1 <- merge(casentotal,casen13b,by="folio")


casen13final <- casentotal1

#Una opción rápida

#Copiar en Google http://www.statmethods.net/management/
#En dicho sitio encontrarán mucha información sobre manejo de datos.
#Dos alternativas rápidas cbind y rbind. Son comandos para unir objetos en
#base a las filas (rbind)  o las columnas (cbind).

#Al sumar observaciones ('hacia abajo') lo más simple es utilizar:

baseAg1 <- rbind(casen13_urb,casen13_rur)

#rbind(dataframe1,dataframe2)

#Chequear los resultados

head(casen13_urb)
head(casen13_rur)
head(baseAg1)

#El aspecto crucial es el orden de las variables, ya que no hay control sobre esto en los comandos básicos:

?append
casen13total <- rbind(casen13_urb,casen13_rur)

dim(casen13_rur)
dim(casen13_urb)

dim(casen13total)
dim(casen13_rur)[1]+dim(casen13_urb)[1]

#2) Agregando Variables (Suma Horizontal) 

casenUnida <- cbind(casen13total,casen13b)

#Estará bien hecha la combinación? Chequeemos



#Problema en el orden. La solución es ordenar antes de unir (sort).
#No es tan fácil hacerlo cuando el orden depende de una variable categórica (reg)

casen13b <- casen13b[order(casen13b$folio),] 

#Otra alternativa es utilizar comandos especializados de manejo de datos.
#Utilizaremos el comando merge para añadir variables

?merge
#Solo necesita que las variables se llamen igual

casen13final <- merge(casen13total,casen13b,by="folio")

head(casen13final)
names(casen13final)
head(data.frame(casen13final$sexo.x,casen13final$sexo.y))

#Otra alternativa habría sido renombrar las columnas

###################################################################################
#REDUCCIÓN DE DIMENSIONES DE UNA BASE DE DATOS

#La primera alternativa de reducción de una base de datos. Primero, se pueden 
#seleccionar algunas variables u observaciones. 

casen13alfa <- casen13final[2:8]  #Elegí la 2da,3ra,...,8va variables de la base
head(casen13alfa)


casen13beta <- casen13final[1:5,2:8] #Elegí las primeras 5 observacones y las variables
#2,3,4,...,8
head(casen13beta)

#Con el comando subset() se puede hacer lo mismo.Aún más, es más fácil indicar 
#qué columnas(variables) se desean seleccionar.

casen13final <- casentotal1


names(casen13total1)

casen13gamma <- subset(casentotal1,
                       select=c("region","comuna","pobreza_multi"))
dim(casen13gamma)
head(casen13gamma)

#Para seleccionar observaciones, resulta más recomendable elegir según un criterio

summary(casen13gamma$region)

casenMaule <- subset(casen13gamma,region=="vii. maule")
dim(casenMaule)



dim(casen13)

casen13delta <- subset(casen13final,sexo.x=="hombre")
summary(casen13delta$sexo.x)
dim(casen13delta)

#Si se quiere resolver el nivel vacío (mujer=0)

casen13delta <- droplevels(casen13delta)
summary(casen13delta$sexo.x)
dim(casen13delta)

#Por último, un ejemplo más elaborado. Primero veamos el % de pobreza según nivel
#educativo.

round(prop.table(table(casen13final$educ,casen13final$pobreza_mn),1)*100,digits=2)

#Ahora tomemos sólo las mujeres mayores a 18 años (y sólo las variables de interés)

casen13e <- subset(casen13final,sexo.x=="mujer" & edad>18,select=c("pobreza_mn","educ"))

round(prop.table(table(casen13e$educ,casen13e$pobreza_mn),1)*100,digits=2)

#GENERACIÓN DE VARIABLES

#La generación de variables es idéntica a la creación de cualquier objeto. Eso
#sí, es recomendable asignar el nuevo objeto a una base de datos.

names(casen13final)
summary(casen13final$ypchtrabajo)  #Son los ingresos per capita del Trabajo con Nueva M.
plot(casen13final$ypchtrabajo)

casen13final$ypctlog <- log(casen13final$ypchtrabajo+0.1)
summary(casen13final$ypctlog)


names(casen13)
summary(casen13$ypctlog) #Los logaritmos no son negativos. El problema son los 0

log(0)

#Usemos un comando específico: ifelse

#ifelse(prueba_lógica,qué_pasa_si_es_V,qué_pasa_si_es_F)

casen13$ypctl <- ifelse(casen13$ypchtrabajo==0,0,log(casen13$ypchtrabajo))

summary(casen13$ypctl)

#Otra posibilidad es eliminar los valores 0 o transformarlos en NAs.

casen13$ypctln <- ifelse(casen13$ypchtrabajo==0,NA,log(casen13$ypchtrabajo))

summary(casen13$ypctln)

#ifelse es un comando muy flexible para la recodificación de variables.

casen13$adulto <- as.factor(ifelse(casen13$edad>17,1,0))

summary(casen13$edad)
summary(casen13$adulto)

#Ahora haremos algo más avanzado. Recodificaremos una variable

install.packages("car")
library(car)

summary(casen13$edad)
casen13$edadT <- car::recode(casen13$edad,"0:17=NA;c(18,19,20,21,22,23,24,25)='0';26:30='1';31:45='2';46:60='3';61:75='4';76:108='4'",as.factor.result=T)

summary(casen13$edadT)

#Agregación
names(casen13final)

casenagregada <- aggregate(casen13final,by=list(casen13final$region),FUN=mean, na.rm=TRUE)


######################################################################################################################

#MAS SOBRE VALORES FALTANTES

load("BancoMundial2010.RData")
ls()

#Los resultados de cualquier análisis estadístico (p. ej. calcular una media)
#dependen de cuáles son las observaciones incluidas. R facilita la realización
#de la prueba,generación de gráfico,etc. pero dificulta la visualización de las
#observaciones consideradas.

#Siempre es buena idea 'ver' las bases de datos, para lo cual el comando fix()
#es un buen punto de partida:

fix(BancoMundial)   #fix permite analizar pero también editar la base de datos.

#Otros comandos de cierta utilidad:

dim(BancoMundial)    #Dimensiones del Objeto: filas, columnas
str(BancoMundial)    #La estructura del objeto
class(BancoMundial)  #La clase del objeto
names(BancoMundial)  #Los nombres de los componentes de un objeto, en 
#particular aquí se aprecian los nombres de las columnas.   

#Lo anterior debe complementarse con la generación de gráficos descriptivos.

#Sin embargo, quiero detenerme en un punto básico: esta base de datos 
#particular contiene muchos NAs (not available). No se les puede imputar un
#valor o comportamiento a priori a los NA (simplemente no hay info), por lo que
#no es posible realizar ningún análisis:

mean(BancoMundial$GDP.capita)
length(BancoMundial$GDP.capita)

#Tal como vimos previamente,la solución consiste en removerlos de la base de 
#datos, recodificarlos o tratar de considerar únicamente las observaciones 
#relevantes en que la información sí está completa:

NAs<-is.na(BancoMundial$GDP.capita)  #Preguntarle a R si es o no un NA
summary(NAs)

bm<-na.omit(BancoMundial)   #na.omit: OMITIR LOS NAs. Elimina dichas obs.
fix(bm)
mean(bm$GDP.capita)
length(bm$GDP.capita)

bm1<-na.omit(BancoMundial$GDP.capita)
fix(bm1)
mean(bm1)
length(bm1)

#Ahora bien si el número total de observaciones en la variable GDP.capita era
#223 y 32 de ellas no contenían la información (NAs).

223-32    #191, el valor antes calculado.

#De esto último se extraen dos importantes conclusiones:

#El comando na.omit borra TODAS las observaciones en que para una o más de 
#las variables no hay información disponible (NA), por lo que es importante
#ser cuidadoso al respecto.

#Dentro de una base de datos uno puede generar SUB-CONJUNTOS, ya sea incluyendo
#solo algunas observaciones (como en este caso al dejar fuera los NAs) o solo
#algunas variables.

#Para esto, se utiliza el comando subset() ->Sub-conjunto. Es una función
#muy simple y flexible para seleccionar variables y/observaciones.

names(BancoMundial)

nuevo1<-subset(BancoMundial, GDP.growth >=2,select=c("Country.Name", "enrollment.primary","GDP.growth","inflation"))
fix(nuevo1)
dim(nuevo1)

#Aquí, especifiqué que deseo generar un sub-conjunto con TODAS las
#observaciones cuyo GDP.growth >= 2 (Mayor o igual), SELECCIONANDO únicamente 
#las variables sobre el nombre del país, porcentaje de alumnos que asisten a 
#educ. primaria, crecimiento del PIB e inflación.

mean(BancoMundial$GDP.growth)

bm3<-na.omit(BancoMundial$GDP.growth)
mean(bm3)

mean(nuevo1$GDP.growth)

#En los tres casos se aprecian resultados distintos.

