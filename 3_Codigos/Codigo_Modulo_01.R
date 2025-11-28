##########################################################################################################################
######################################                                              ######################################
######################################          MODULO 1: INTRODUCCION A R          ######################################
######################################                                              ######################################
######################################                Benjamín Muñoz                ######################################
##########################################################################################################################

#UN NUEVO SCRIPT

#En la Barra de Herramientas Superior, vayan a 'Archivo', donde la primera opción que encuentran es Nuevo Script ('Ctrl+N'). Debería aparecer una hoja en blanco. 

#Ahora, vuelvan a 'Archivo' y apreten 'Abrir Script' (Ctrl+O o el símbolo deapertura de una carpeta- el primero de los íconos-). Aquí pueden buscar el archivo del Script que deseen utilizar. 

#Por comodidad, les recomiendo que se dirijan otra vez a la Barra de Herramientas de la parte superior 
#y vayan a la sección 'Ventanas'. Aquí apreten 'Divida Verticalmente'. Ahora deberían tener en sus 
#pantallas lo mismo que aprecian aquí en el proyector. Al estar trabajando con dos ventanas, es 
#importante destacar que sólo una de ellas está activa. Al estar escribiendo en el Script es ésta 
#la ventana  activa. Lleven el cursor del mouse a la Consola y apreten el botón derecho. Escriban 
#cualquier cosa en la Consola. Ahora es dicha ventana la que está activa.

#R funciona tipeando códigos directamente en la Consola y apretar ENTER. Otra opción (y preferible) es 
#tipear los comandos en el Script y enviarlos a la Consola. Dicha función varía según el computador. 
#En el mío se logra apretando a la vez CMD+Enter (En windows puede ser SHIFT+F5).

#Las líneas que comienzan con un '#' son ignoradas por la Consola. De ahí a que sean utilizadas al 
#principio de cada línea de texto en este Script. Loanterior permite evitar los errores de sintaxis. 


#Ingreso de valores
1

-222222222222   #No hay separador de miles. 

1.50000000000000 #El punto es el separador de decimales. 

0.000000000000000000095 #R usa por defecto notacion cientifica para valores extremadamente grandes o pequeños.

options(scipen=999)



TRUE


a     #Arroja un error, veremos que esto se explica a que R lo trata como el nombre de un objeto

#####TEMA 1: OPERACIONES ARITMETICAS

2 + 3   # suma
2 - 3   # resta
2*3     # multiplicación
2/3     # divisió
2^3    # exponenciación
2**3

#Claro está, se pueden combinar operaciones aritméticas. R sigue las convenciones
#estándares de procedencia de los operadores matemáticos.

4^2-3*2

1 - 6 + 4

(4^2) - (3*2)

#No está demás mencionar que el uso de paréntesis resulta crucial. A modo de 
#ejemplo, las siguientes operaciones son distintas:
  
(4 + 3)^2

4 + 3^2

#Espacios para facilitar lectura de codigo
-2--3

-2 - -3


#Si una operación aritmética debe ser presentada en dos líneas distintas del 
#Script, la separación debe hacerse en un operador, tal como se muestra a 
#continuación:

2+3*4+(36/6)+48-13*2+(2*3*6/9+15-27+12*3)

2+3*4+(36/6)+48-13*2+
  (2*3*6/9+15-27+12*3)

2+3*4+(36/6)+48-13*2
+(2*3*6/9+15-27+12*3)


##########################################################################################################################

#####TEMA 2: ASIGNACION (GENERACION DE OBJETOS)

#Corresponde a la generación de VARIABLES, ya que se le asigna un nombre a uno
#o varios valores. 

#nombre <- valores

a <- 4

#El resultado del proceso de asignación no es visible. Si se desea ver el resultado se
#puede tipear el objeto:

a

b <--2
b



#Facilitar la lectura
c <- -2
c

#Es importante que los símbolos '<' y '-' no tengan espacios entre sí. No  ocurre lo mismo 
#respecto al resto. Un ejemplo simple es el siguiente:

d<-0.5
d

d< -0.5

#Para los nombres pueden usarse letras minúsculas y mayúsculas, números, y algunos símbolos 
#como puntos o guiones bajos (. y _). NO hay una longitud  máxima, lo importante es que cuando
#se utilice la variable se debe escribir de manera exacta el nombre. 

numero_muy_importante <- 3


valor_1 <- 5

valor.z <- 56

valorX <- 35

2a <- 2

#Indexación

y <- 4
y

#Nótese que antes del resultado('output') aparece un [1]. Implica que dicho resultado es el primer
#resultado obtenido. Esto tiene utilidad ya que R puede realizar distintas operaciones aprovechando
#la posición/indexación de los elementos contenidos en un objeto.


##########################################################################################################################

#####TEMA 3: COMBINACION (GENERACION DE OBJETOS)

#La función c() permite COMBINAR diversos valores u objetos en un único objeto. 

fibonacci<-c(0,1,1,2,3,5,8,13)   #8 primeros elementos de sucesión de Fibonacci
fibonacci

objeto <- seq(100,250,1)
objeto

veintiuno <- 0
veintiuno

fibonacci1 <- c(fibonacci,veintiuno,34)
fibonacci1

#EJERCICIO:EVALÚEN ESTOS OBJETOS Y DETERMINEN EL ERROR.

error1 <- c(1,2,3,4,,6)
error1


#Todas las operaciones aritméticas funcionan usando c.

c(1,2,3,4,5,6)*c(2,2,2,2,2,2)
c(1,2,3,4,5,6)*2

#Se pueden realizar las operaciones con las variables generadas, siempre y 
#cuando ambas sean vectores numéricos:

alfa<-c(1,2,3,4)
beta<-c(2,6,10,12)
gamma<-c(2,2)
delta<-c(1,3,5)
epsilon<-10

alfa+beta
alfa-delta    #Nótese el Problema. No son mútliplos por lo que no hace la 
#operación
alfa-gamma

alfa*gamma
beta*delta  #Otra vez el mismo problema

beta/gamma
beta/delta  #Problema de nuevo

alfa+epsilon
beta-epsilon
gamma*epsilon
delta/epsilon

#Las operaciones requiere que tengan longitudes (n° de elementos contenidos)
#idénticos o a lo menos que sean múltiplos.

#El uso de paréntesis cuadrado [] permite encontrar un valor dentro de un vector:

#nombre.de.variable[i]

prueba <- c(2,4,6,8,10,12,14,16,18,20,22,24,26,28,30)
prueba

prueba[1]
prueba[10]
prueba[c(2,4,6)]

#El uso de un índice negativo, del tipo [-i], busca todos los valores a
#excepción del indicado (i).

prueba[-3]

#También se puede usar para reemplazar algún valor:

prueba
prueba[10]<-100
prueba


###################################################################################

#####TEMA 4: FUNCIONES BASICAS

#Las Funciones incorporadas en R pueden entenderse en base al siguiente diagrama:

# VALORES INICIALES -> FUNCIÓN -> VALORES DE SALIDA (RESULTADOS)

#Su uso adecuado implica escribir de manera adecuada el NOMBRE DE LA FUNCIÓN e
#ingresar los ARGUMENTOS necesarios:

# función(argumentos)   #Puede ser 1 o varios argumentos

#Algunas funciones básicas son:

#sqrt(x)  #square-root o raíz cuadrada. 
#log(x)   #logaritmo natural o logaritmo con base e
#exp(x)   #Función exponencial e^x. Función inversa a logaritmo natural

#Ahora bien, ¿cómo puedo saber cuáles son los argumentos de una función?
#Una alternativa es utilizar las diversas fuentes de ayuda en R.
#Otra opción es utilizar la función args:

args(log)   

#Logaritmo
log(100)
log(100, base=10)
log10(100) # equivalente
log(100, b=10)

#EJERCICIO: Utilice la función print() sobre q. Determine para que sirve:

q <- 60

#La mayoría de los objetos son creados mediante la operación de ASIGNACIÓN. En 
#general, al crearse el objeto no hay un resultado 'impreso' en la Consola.

a<-c(1,2,3,4,5,6,7,8,1,1,1,2,2,2,2,2,2,3,3,7,7,7,7,7,7,7,7)       
b<-c(2,4,6,10)                                   
c<-c(5,5,5,5)

table(b,c) #Comando básico para generar tablas

tabla<-table(b,c)       #Generación del Objeto
tabla

hist(a) #Comando básico para generar histogramas

histograma<-hist(a)     #Generación del Objeto
histograma             
plot(histograma)


#Es distinto lo que ha ocurrido cuando se ha realizado la operación de 
#asignación, no obstante los comandos utilizados son idénticos. 

#Volviendo al tema de los comandos básicos...

ls()    #El comando LISTAR OBJETOS se usa de este modo, sin ingresar ningún 
        #argumento entre paréntesis.
rm()   #Comando para remover objetos en el espacio de trabajo.

rm(list=ls()) #Permite eliminar todos los elementos en el espacio de trabajo.

#Lección: las funciones SIEMPRE tienen asociados paréntesis ( ), mientras los objetos no.

a <- 5

rm(a)

##########################################################################################################################

#####TEMA 5: CLASES DE OBJETOS ATOMICOS


#Tipos atómicos

#1 CARACTER 

a <- "Hola" #Caracter
a

a1 <- "999"
a1

#Corresponden a listas de palabras. Éstas deben ser ingresadas entre comillas " "/ ' '.

elementos<-c("Hidrogeno","Helio","Litio","Berilio","Boro","Carbono","Nitrogeno",
             "Oxigeno","Fluor","Neon")
elementos

#Hay funciones que operan con vectores de caracteres. A su vez, pueden asociarse 
#a vectores numéricos:

no.de.C<-c(1,2,3,4,5,6,7,8,9,10)
names(no.de.C)<-c("Hidrogeno","Helio","Litio","Berilio","Boro","Carbono","Nitrogeno",
                  "Oxigeno","Fluor","Neon")
no.de.C
no.de.C["Litio"]
no.de.C[2]

#2 NUMERICO 
#R por defecto asume doble precisión (asume que es posible que el número tenga decimales)

b <- 234.4545  #Numérico
b

#NaN NOT A NUMBER
#Es un número especial que refleja el infinto, en el sentido que es un valor indefinido. 

0/0


#3 ENTERO

c <- 3  #¿Entero?
c

#Usaremos la función class() para conocer la clase atómica de un objeto.
class(c)

c <- 3L
c
class(c)

#4 COMPLEJO

#Los numeros complejos o class:complex usan el símbolo i

d <- sqrt(-4)
d

d <- sqrt(-4+0i)
d
class(d)

#5 LOGICOS

e <- F
e
#Corresponden a listas de elementos lógicos: Verdadero y Falso (True o False).

valores<-c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)
valores

v<-c(T,F,T,F,F,F)
v

!v     #El símbolo ! se utiliza para negar (invertir el significado) de un 
#operador lógico.  

#La mayor utilidad de los vectores lógicos va de la mano de operaciones 
#lógicas:

prueba<-c(1,2,3,4,5,6,7,8,9,10)
prueba
prueba==5
prueba!=5

prueba<5
prueba>5

prueba<=5
prueba>=5

# '=='     Igual a  
# '!='     No igual a
# '<'      Menor que   
# '>'      Mayor que    
# '<='     Menor o igual a      
# '>='     Mayor o igual a      
# '&'      y
# '|'      o
# '&&'     y, tomando los valores lógicos individuales como argumentos
# '||'     o, tomando los valores lógicos individuales como argumentos


##COERCIÓN

#Al mezclar dos clases de tipos atómicos en un único objeto, R realiza una operación llamada
#COERCIÓN, transformando los valores de forma tal que todos los elementos sean de la misma clase:

#Numerico + Caracter = Caracter
q1 <- c(a,b)
q1

#Logico + Numerico = Numerico
q2 <- c(b,e)
q2

#Caracter + Logico = Caracter
q3 <- c(a,e)
q3

#Es posible transformar un objeto de una clase a otra. Esto se llama COERCIÓN EXPLÍCITA
#Si la coerción no tiene sentido el resultado es una advertencia y NA:

#as.character()
#as.numeric()
#as.integer()
#as.complex()
#as.logical()

#Caracter
b <- as.character(b)
as.character(c)
as.character(d)
as.character(e)

#Numerico
as.numeric(a) #Error
as.numeric(c)
as.numeric(d) #Examinar este caso
as.numeric(e)

#Logico
as.logical(a) #Error
as.logical(b) #Le asigna TRUE

b1 <- 0
b2 <- -2

as.logical(b1) #Sólo el cero corresponde al FALSE: vínculo con binario
as.logical(b2)

as.logical(c)
as.logical(d)


#Usaremos el comando as.integer() para la transformación
c <-  as.integer(c)
c
class(c)
is.integer(c) #is.integer() es una función que hace la pregunta lógica sobre la clase

#Podemos aprovechar los comandos de coerción para definir complejos:

sqrt(as.complex(-1))


#ATRIBUTOS

#Los objetos pueden tener atributos (no es obligatorio) que reflejan propiedades de éstos.
#Ya vimos uno de estos: class()

class(a)
class(b)
class(c)
class(d)
class(e)
class(sexo4)

#Otros ejemplos básicos de atributos son:

names(a)
names(no.de.C)

length(a)
length(no.de.C)

#El comando attributes() sirve para examinar y modifcar los atributos de un objeto.

#FACTORES

#En R, las variables categóricas son llamadas FACTORES. No es un tipo atómico de objetos,
#pero su importancia radica es que determinan como se realizan los análisis y son presentados 
#visualmente. Existen ciertos comandos que requieren que los datos sean considerados como factores. 
#Hay otros que transforman (proceso conocido como "coerción de datos") los datos en factores. 

#Los comandos utilizados para aquello son factor () para crear un factor y 
#as.factor() para transformar algún objeto en un factor.

#Un factor se compone de diversos niveles o categorías. 

sexo <- c("Hombre","Mujer")
class(sexo)

#No lo reconoce como factor

summary(sexo)

sexo1 <- as.factor(sexo)
sexo2 <- factor("Mujer","Hombre")
class(sexo1)
class(sexo2)
summary(sexo1)
summary(sexo2) #¿Problemático? Cuidado con la combinación

sexo3 <- factor(c("Mujer","Hombre"))
class(sexo3)
summary(sexo3)

sexo4 <- factor(c(1,2))
class(sexo4)
summary(sexo4)

sexo5 <- factor(c(0,1),labels=c("Hombre","Mujer"))
summary(sexo5)

#Ahora veamos una aplicación completa. El atributo levels sirve para fijar el orden
#
educacion <- factor(c("Sin educación formal","Educación Primaria","Educación Secundaria","Educación Terciaria"))
educacion

table(educacion)

educacion <- factor(c("Sin educación formal","Educación Primaria","Educación Secundaria","Educación Terciaria"),levels=c("Sin educación formal","Educación Primaria","Educación Secundaria","Educación Terciaria"))
educacion

table(educacion)


#VALORES FALTANTES, PERDIDOS/ MISSING VALUES O SIMPLEMENTE NA'S

#Si en un conjunto de datos falta el valor de alguna de las observaciones, R muestra en 
#reemplazo del valor ausente un NA (not available) en un conjunto de datos.

#Es utilizado para los distintos tipos de datos utilizados por R. NO soncomparables ni 
#tienen mayor utilidad, por lo que el usuario debe DECIDIR según sus objetivos si 
#ELIMINARLOS, REMOVERLOS o RECODIFICARLOS.

ej<-c(1,2,5,7,3,9,11,12,13,12,13,13,4,5,6,8,9,10,10,7,9,NA,4,NA,5,5,11,15,NA,2)

is.na(ej)          #El comando identifica con un TRUE los NAs.
summary(is.na(ej)) #Resumen del comando anterior

ej1<-na.omit(ej)  #El comando permite omitir los NAs
ej1
is.na(ej1)
summary(is.na(ej1))

#CUIDADO!: R HACE LISTWISE DELETION AL ELIMINAR NA...

#El principal cuidado con este tipo de operaciones es al utilizar data frames
#o formatos similares. Piénsese en un marco de datos compuesto de 20 
#observaciones y 4 variables. La existencia de un NA en una columna determina
#que sea borrada toda la observación correspondiente, sin importar si en las 
#otras columnas la información estaba presente o no. 


#########################################################################################################################

#####TEMA 6: ESTRUCTURAS DE DATOS 


#Hasta el momento hemos visto dos tipos de conjuntos de datos:

#1)ESCALAR: corresponde a una variable con un único valor. Equivale a un vector
#con un solo elemento.

45
pi

pi <- 3

rm(pi)

#2)VECTOR: corresponde a una lista unidimensional.

a <- c(1,2,3)
a
is.vector(a)

b <- rep(10,15)
b
is.vector(b)

#Durante este Taller trabajaremos con formatos más complejos pero que se circunscriben
#a datos rectangulares, en dónde hay filas y columnas. En general, en las filas se 
#ubican OBSERVACIONES y en las columnas las VARIABLES.

#En R existen múltiples formas de almacenar datos, teniendo cada una usos 
#distintos y ciertas propiedades relacionadas con el tipo de datos que pueden
#contener.

#3)MATRIZ: conjunto de datos bidimensional, en que CADA elemento es del MISMO
#TIPO (numérico, caracter, lógico). Se crean con la función matrix(), y se
#caracterizan por que filas y columnas son indicadas por números seguidos de
#comas.

#nombre<-matrix(vector,nrow,ncol,byrow,dimnames=list())

#No obstante no usaremos matrices en el curso, es útil para introducir los
#argumentos de la función matrix(), que son idénticos a los de varias 
#funciones:

#nrow              Número de Filas
#ncol              Número de Columnas
#byrow             Ordenar por Filas  (Verdadero o Falso) 
#bycol             Ordenar por Columnas
#dimnames=list()   Asignar nombres a filas y columnas 

#Basta con indicar una de las dos opciones: byrow o bycol. La opción por
#default es rellenar por columnas. 

datos<-c(2,20,3,30,5,50,7,70,11,110,25,250)

filas<-c("F1","F2","F3","F4","F5","F6")
columnas<-c("C1","C2")

#nombre<-matrix(vector,nrow,ncol,byrow,dimnames=list())
m<-matrix(datos,ncol=2,byrow=F,dimnames=list(filas,columnas))
m

#Otras formas de construir matrices
m1 <- 1:10
m1
dim(m1) <- c(2,5)
m1

m1 <- 1:10
m2 <- 11:20
m1
m2

#Los comandos de unión básicos -rbind() y cbind()- generan por defecto matrices:
matriz1 <- rbind(m1,m2)
matriz2 <- cbind(m1,m2)

matriz1
matriz2

#Las matrices solo pueden contener dos dimensiones (1 vector o 1 escalar
#también pueden ser matrices, solo que tienen dimensiones 2x1 y 1x1, 
#respectivamente). Sólo pueden tener datos de un único tipo (normalmente numérica). 

#El comando as.matrix() permite convertir un conjunto de datos en una matriz:

vector<-c(1,2,3,4,5)
vector
is.vector(vector)
v1<-as.matrix(vector)
v1
is.matrix(v1)

#4)COLECCIÓN DE DATOS (ARRAY)

#Son similares a las matrices pero pueden tener más de dos dimensiones. Se
#crean con el comando array().

#nombre<-array(vector,dimensiones,dimnames)

#La forma más común de colección de datos es la tridimensional:

v2<-1:50
d1<-c("N1","N2","N3","N4","N5")
d2<-c("L1","L2","L3","L4","L5")
d3<-c("A1","A2")
ar<-array(v2,c(5,5,2))#,dimnames=list(d1,d2,d3))
ar


#Al igual que las matrices deben contener datos de un único tipo. 

#5)MARCO DE DATOS (DATA FRAME)

#Es la más utilizada en el curso. Estructura muy similar a una hoja Excel o a
#un conjunto de datos de SPSS o STATA. Las filas son observaciones y las
#columnas son variables. Puede almacenar información de diverso tipo como el 
#numérico, caracteres, factores en un mismo formato.

#Se pueden crear en R utilizando el comando data.frame():

#nombre<-data.frame(col1,col2,col3,....,coln)

numeros<-c(1,2,3,4,5) 
letras<-c("A","B","C","D","E")
logica<-c("TRUE","TRUE","FALSE","TRUE","FALSE")
df<-data.frame(numeros,letras,logica)
df
View(df)

#Cada columna debe ser de un único tipo de datos, pero las columnas pueden ser 
#distinto tipo.

df$numeros
df$letras

#Los marcos de datos serán el formato con que tenderemos a trabajar en R.
#La manera de extraer elementos (columnas/variables) de éstos es con el símbolo $.

#6)LISTAS

#Es probablemente el formato de datos más complejo utilizado en R. Corresponde
#a una colección ordenada de distintos objetos (sus componentes). Es así que se 
#tienen una variedad de objetos, no necesariamente relacionados bajo un único
#nombre.

#Se crean con el comando list(), permitiendo combinar vectores, matrices, 
#marcos de datos, etc.

lista <- list(vector,m,v1,ar,df)
lista

#Con el doble paréntesis cuadrado [[]] se extraen los macro-elementos contemplados.

lista[[1]]
lista[[2]]
lista[[3]]
lista[[4]]
lista[[5]]

lista[[5]][1]
lista[[5]][1,2]  #Filas, Columnas

#########################################################################################################################

#####TEMA 7: INSTALACION DE PAQUETES


#Los paquetes o 'packages' son colecciones de funciones, datos y otro elementos 
#compilados en un formato adecuado. Pueden entenderlos como "expansiones" a las 
#funciones básicas de R. 

#El directorio donde son almacenados los paquetes en tu computador es llamado
#BIBLIOTECA o LIBRARY. El comando library() muestra los paquetes almacenados

library()     #Muestra los paquetes almacenados en la biblioteca.

#Existen múltiples paquetes que vienen incluidos en R. Otros deben ser 
#descargados para su posterior uso. En general, trabajaremos con paquetes
#binarios (los más simples de instalar).

search()      #Muestra los paquetes cargados y listos para ser utilizados.

#INSTALACIÓN DE UN PAQUETE

#Existen dos modos de instalar un paquete

#De manera MANUAL, dirigiéndose a la barra de herramientas superior, en el 
#botón Paquetes, seleccionando el botón Instalar paquete(s). Posteriormente 
#deben seleccionar el "espejo" que utilizarán para la descarga (usen Chile). 
#Por último encuentren el paquete en la lista (orden alfabético).

#Utilizando comando install.packages():

install.packages("Rcmdr")
install.packages("car")

#Los paquetes, en especial los más utilizados, son actualizados constantemente.
#Sólo requieren ser instalados una vez, por lo que en caso de que necesiten una
#versión más nueva deben actualizar el paquete con el comando 
#update.packages(). Siempre deben utilizarselas comillas.

#Una vez instalado, deben activar los paquetes almacenados en la biblioteca.
#Para esto, usen el comando library().

library(Rcmdr)

#########################################################################################################################

#####TEMA 8: OTRAS FUNCIONES

#Existen otras maneras de generar secuencias de valores:

#SECUENCIA COMPLETA (ÍNTEGRA)

1:100
100:1

#SECUENCIA ESPECIFICADA (Comando seq)

#seq(valor mínimo, valor máximo, argumentos_extra)

seq(1,100)

#Especificando el intervalo entre los valores. Si no se especifica el tercer 
#argumento es by (tamaño del intervalo).

seq(1,100,by=3)

#Especificando la longitud total de la secuencia

seq(1,100,length=34)
seq(1,100,length=50)

#SECUENCIA INVERSA (Comando rev)

rev(1:100)

#SECUENCIA CONSTANTE (Comando rep)

rep(1,100)

#SECUENCIAS COMPLEJAS

min<-1; max<-100; inter<-4    #El ; permite separar comandos utilizados e 
# ingresarlos a la vez.  
min+inter*(0:max)

# sum(elementos)     #Suma todos los elementos incluidos, sean valores o vectores
# length(x)          #Indica la longitud de un vector (el número de elementos contenidos)
# abs(x)             #Calcula el valor absoluto.
# trunc(x)           #Trunca un valor.
# round(x,digits=n)  #Redondea un valor según el número de dígitos especificados.
# sort(x)            #Ordena los valores de un vector de menor a mayor. 
# summary(x)         #Función de análisis general y global.
# mean(x)            #Calcula la media de una variable (conjunto de valores num.)
# sd(x)              #Calcula la desviación estándar de una muestra
# plot(x)            #Función Básica de Graficación en R
# summary(x)         #Descripción de Variables



##########################################################################################################################

#####TEMA 9: PROGRAMACION BASICA Y ESTRUCTURAS DE CONTROL EN R.

#IF ELSE

#Un ejemplo (variar el x)
x <- 4
x <- 2

if(x>3){
  y <- 10
}else{
  y <- 0
}

y

#Forma equivalente	

y <- if(x>3){
  10
} else {
  0
}

y

#FOR

#Cuatro modos equivalentes para lograr mismo objetivo.

x <- c("a","b","c","d")

for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x)){
  print(x[i])
}

for(letter in x){
  print(letter)
}

for(i in 1:4) print(x[i])

#Anidamiento de bucles

x <- matrix(1:6,2,3)
x

for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

#WHILE

#No es claro cuando terminara el loop.
#Involucra un random walk
z <- 5

while(z>=3 && z <=10){
  print(z)
  coin <- rbinom(1,1,0.5)
  if(coin==1){
    z <- z+1
  } else{
    z <- z-1
  }
}


#########################
#ESCRIBIR FUNCIÓN EN R

#EJEMPLO 1: SUMAR

add2 <- function(x0,x1){
  x0+x1
}

add2(3,4)
add2(2,5,3) #Error

#EJEMPLO 2: EXTRAER ELEMENTOS MAYORES A 10

above10 <- function(x){
  use <- x>10
  x[use]
}

set.seed(12345)
x <- seq(1,30,1)
x
above10(x)

above <- function(x,n){
  use <- x>n
  x[use]
}

above(x,20)
above(x,5)
above(x,30) #¿Es esto un error?

#Argumentos se pueden fijar por defecto (para permitir omisión)

above <- function(x,n=10){
  use <- x>n
  x[use]
}
above(x)
above(x,n=15)
above(x,19)

#EJEMPLO 3: PROMEDIO POR COLUMNAS

columnmean <- function(y){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i])
  }
  means
}

#iris es un típico conjunto de datos que se encuentra anexado a la versión básica de R.
data("iris")
summary(iris)
columnmean(iris)

iris1 <- iris[,1:3] #Seleccionó todas las filas y algunas de las columnas -las primeras 3-
summary(iris1)
columnmean(iris1)

alfa <- c(2,5,8,11,21,10,5,7,NA,NA,23,5,3,7,8,19,12,20,NA,NA)
beta <- c(1,2,5,8,3,4,6,12,21,3,9,10,11,3,24,15,7,5,8,9)
datos <- data.frame(alfa,beta)

columnmean(datos)

columnmean <- function(y,removeNA=T){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i],na.rm=removeNA)
  }
  means
}
columnmean(datos)


#Elaboremos ahora una función sencilla que calcule la media de un conjunto de valores.

x <- seq(from=1,to=1000,by=9)
x

#La media aritmetica es la suma de los valores divido por el numero de estos. Necesitamos sumar los valores y dividirlos por el total de casos.

sum(x)             
length(x)
sum(x)/length(x)

mean(x)


promedio <- function(x) {
  sum(x)/length(x)
}

promedio(x)

#EJERCICIO PROPUESTO: Construya una función que calcule la varianza poblacional y otra que calcule la varianza muestral:


#varianza.pob <- 


#varianza.mues <-   

##################
#REGLAS DE ALCANCE

make.power <- function(n){
  power <- function(x){
    x^n
  }
  power
}

cube <- make.power(3)
square <- make.power(2)

square(3)
cube(3)

ls()
ls(cube)
ls(environment(cube))
get("n",environment(cube))

##########################################################################################################################

#####TEMA 10: AYUDA EN R

#Ayuda general
help.start()

#Ayuda específica
help(log)

?log

example("log")

args(log)

RSiteSearch("log") 

#Búsquedas más amplias

help.search("log") #Búsqueda de ayudas que contienen la palabra "log". A veces puede ser útil.

apropos("log", mode="function") 
