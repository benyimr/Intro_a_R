##########################EJERCICIO 1
summary(as.numeric(coes$p2))
?factor

#¿Cómo transformar un factor en una variable numérica
summary(as.numeric(levels(coes$p2))[coes$p2])
summary(as.numeric(as.character(coes$p2)))

coes$p2 <- as.numeric(as.character(coes$p2))    #No obstante es menos eficiente, es más evidente lo que hacemos

#Pero ¿cómo puedo construir edad en tramos?

coes$p2tramos <- sjmisc::group_var(coes$p2,groupsize=25)
summary(coes$p2tramos)
table(coes$p2,coes$p2tramos)


coes$p2tramos1 <- sjmisc::split_var(coes$p2,groupcount=4)
summary(coes$p2tramos1)
table(coes$p2,coes$p2tramos1)

#Y si quisiera estandarizar la variable..

coes$p2std <- sjstats::std(coes$p2)
summary(coes$p2std)

#O simplemente centrarla:
coes$p2cen <- sjstats::center(coes$p2)
summary(coes$p2cen)

##########################EJERCICIO 2

#Cálculo de varianza y desviación estándar
de1 <- coes$p2-mean(coes$p2)
de2 <- de1^2
de3 <- sum(de2)
de4 <- length(coes$p2)
de5 <- de3/(de4-1)
de5
sqrt(de5)

var(coes$p2)
sd(coes$p2)

(sum((coes$p2-mean(coes$p2))^2))/(length(coes$p2))

#El comando var() -y tb sd()- calculan varianzas y desviaciones estándares muestrales

sjstats::var_pop(coes$p2)
sjstats::sd_pop(coes$p2)


#Coeficiente de Variación y otros
sd(coes$p2)/mean(coes$p2)
min(coes$p2)
max(coes$p2)

library(sjstats)
sjstats::cv(coes$p2)


##########################EJERCICIO 3

#Problema por el tipo de variable

#¿Existen alternativas?

install.packages("prettyR")
library(prettyR)

?describe
prettyR::describe(coes$b6_a1)

prettyR::describe(coes$b6_b).


##########################EJERCICIO 4

library(sjmisc)
?frq
sjmisc::frq(coes$b1m1_a)



##########################EJERCICIO 5


summary(coes$b6_a1)
summary(coes$b6_c)
coes$b6_c <- as.numeric(as.character(coes$b6_c))
summary(coes$b6_c)

coes$b6_c1 <- ifelse(coes$b6_c==88,NA,
                     ifelse(coes$b6_c==99,NA,coes$b6_c))
summary(coes$b6_c1)

coes$brecha <- coes$b6_c1/coes$b6_a1
summary(coes$brecha)

tabla2 <- table(coes$brecha)   #Ingresos derivados del Trabajo a nivel Individual
tabla2a <- ftable(coes$brecha)
tabla2
tabla2a

#No es un resumen de datos. Construiremos intervalos para la variable.

?cut
tabla2b <- table(cut(coes$brecha,breaks=5))
tabla2c <- table(cut(coes$brecha,breaks=quantile(coes$brecha,na.rm=T)))
tabla2d <- table(cut(coes$brecha,breaks=c(0,5,10,max(coes$brecha,na.rm=T))))

tabla2b
tabla2c
tabla2d

#cut contruye intervalos (nótese que distingue entre intervalos abiertos y cerrados)

#Las tablas de estadísticos descriptivos se generan vía comandos descriptivos.

summary(coes$brecha)
describe(coes$brecha)


#########################EJERCICIO 6

sjt.xtab(coes$p1,coes$f3)

##########################EJERCICIO 7

summary(coes$p1)
coes$p2 <- as.numeric(as.character(coes$p2))  
coes$p2tramos1 <- sjmisc::split_var(coes$p2,groupcount=4)
summary(coes$p2tramos1)
table(coes$p2,coes$p2tramos1)
summary(coes$f3)

coes$p1R <- car::recode(coes$p1,"1='Hombre';2='Mujer';else=NA")
coes$p2tramosR <- car::recode(coes$p2tramos1,"1='18-31';2='32-44';3='45-57';4='58-75'=4';else=NA")
coes$f3R <- car::recode(coes$f3,"1='Si';2='No';else=NA")

table(coes$p1R,coes$p2tramosR,coes$f3R)
table(coes$p2tramosR,coes$f3R,coes$p1R)





##########################EJERCICIO 8




##########################EJERCICIO 9


##########################EJERCICIO 10



#####################################################################################
#########ANEXO: PARÁMETROS SOBRE LÍNEAS Y SÍMBOLOS Y COMANDOS DE GRAFICACIÓN#########

#Puntos y Líneas

#pch=       #Especifica el símbolo utilizado al graficar puntos. Del 0 al 25.

#cex=       #Especifica el tamaño del símbolo. Es un número que indica el tamaño
#de graficación de los símbolos tomando 1 como default. 1.5 es 50% 
#más grande, 0.5 es 50% más pequeño.  

#lty=       #Especifica el tipo de línea.Del 1 al 6.

#lwd=       #Especifica el grosor de la línea expresado tomando como default 1.
#lwd=2 genera una línea con el doble del grosor por default.

#####################################################################################

#Colores

#col=       #Especificar el colo utilizado en la graficación, pudiendo 
#seleccionarse más de uno.

#Existen otros comandos para especificar los colores del eje, el título, 
las etiquetas,etc.  

#col.axis     #Color del texto de los ejes.

#col.lab      #Color de las etiquetas de los ejes.

#col.main     #Color del título.

#col.sub      #Color de subtítulo.

#fg           #Color del primer plano del gráfico.

#bg           #Color del fondo del gráfico.

#####################################################################################

#Texto

#cex=         #Número que indica la escala el texto del gráfico. Default es 1,
#por lo que 1.5 es 50% más grande y 0.5 es 50% más pequeño.

#cex.axis=    #Magnificación del texto de los ejes relativo a cex.

#cex.lab=     #Magnificación de las etiquetas de los eje relativo a cex.

#cex.main=    #Magnificación de los títulos relativo a cex.

#cex.sub=     #Magnificación de los subtítulos relativo a cex.

#font=        #Especifica la 'fuente' del texto graficado. 1=normal;2=negrita
#énfasis; 3=itálica. Hasta 5.

#font.axis=   #Fuente para el texto de los ejes.

#font.lab=    #Fuente para las etiquetas de los ejes.

#font.main=   #Fuente para los títulos.

#font.sub=    #Fuente para los subtítulos.

#ps=          #Fuente para el tamaño del punto. El tamaño del texto es ps*cex

#####################################################################################

#Dimensiones del Gráfico

#pin=c(a,b)   #Dimensiones del gráfico (ancho, alto) en pulgadas.

#mai          #Vector numérico indicando el tamaño de los márgenes donde se 
#tiene c(abajo, izquierda,arriba,derecha) en pulgadas.

#mar          #Vector numérico indicando el tamaño de los márgenes (abajo,
#izq.,arriba,der.) expresados en líneas. 

#####################################################################################

#Opciones de los Títulos, Subtítulos y Ejes.

#Son argumentos que se especifican dentro del gráfico generado:

#main=""     #Comando para cambiar el título del Gráfico.

#sub=""      #Comando para adherir un subtítulo al Gráfico. En ciertos 
#gráficos como los qqplot() del paquete 'car' no está disponible.

#xlim=c(a,b) #Especifica los valores mínimo y máximo del eje horizontal.

#ylim=c(a,b) #Especifica los valores mínimo y máximo del eje vertical.

#xlab=""     #Modifica la etiqueta del eje horizontal

#ylab=""     #Modifica la etiqueta del eje vertical. 

#Comandos que se pueden utilizar

#title()     #Alternativa para especificar títulos diversos:

#title(main="Título",sub="Subtítulo",xlab="Eje Horizontal",ylab="Eje Vertical")

#axis       #Modificar los ejes del gráfico. El formato del comando es:

#axis(side, at=, labels=, pos, lty=, col=, las=, tck=,...)

#Especificaciones de axis()

#side       #Indica el lado del gráfico al cual se dibuja el eje, siendo
#1=abajo, 2=izquierda, 3=arriba, 4=derecha.

#at         #Vector numérico indicando donde se dibujan marcas de graduación

#labels     #Vector de carácteres de las etiquetas a colocar en las marcas
#de graduación. Por default es Nulo, utilizando los valores de at

#pos        #Coordinada a las cual se dibuja la línea del eje (donde se 
#intersectan los ejes).

#las       #Etiquetas son paralelas (=0) o perpendiculares al eje (=2).

#tck        #Longitud de las marcas de graduación como fracción de la región
#de graficación. Si es un n° negativo es fuera del gráfico, positivo
#dentro del área, 0 las suprime y 1 crea grillas. 


#legend()   #Ingresa una leyenda dentro del Gráfico (cuadro visual que
#complementa y facilita la interpretación del gráfico).

#legend(location, title, legend,...)

#location     #Locación: ¿en qué parte del gráfico? Lo más común es especificar
#una coordenada (x,y). locator(1) permite utilizar el mouse
#para esta operación.

#title        #Título de la leyenda.

#legend       #Vector de palabras con las etiquetas. 


#text()       #Agrega texto a los gráficos dentro del área de graficación.

#mtext()      #Agrega texto pero en uno de los márgenes.

#text(location, "texto",pos,...)
#mtext("texto",side,...)

#Los argumentos son equivalentes al caso anterior 

#pos          #Posición relativa a la locación 1=abajo, 2=izquierda, 3=arriba
#4=derecha.

#side         #En qué margen colocar el texto 1=abajo, 2=izquierda, 3=arriba
#4=derecha.       

#####################################################################################

#Combinación de Gráficos

#par(mfrow=c(n.filas,n.columnas)   #La ventana de Graficación de R se divide
#siguiendo la especificación

#par(mfcol=c(n.filas,n.columnas    #Equivalente al comando anterior.

#layout(matriz)                    #Matriz que especifica la localización 
#de los múltiples gráficos a combinar.
#Debe generarse la matriz como objeto con
#matrix(), siendo más flexible en las 
#divisiones.

#Se pueden especificar el ancho y alto (widths y heights) en pulgadas. 

#Más fácil utilizar paquetes que layout().

