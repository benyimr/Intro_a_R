##########################################################################################################################
######################################                                              ######################################
######################################   MODULO 3: ANALISIS EXPLORATORIO DE DATOS   ######################################
######################################                                              ######################################
######################################                Benjamín Muñoz                ######################################
###################################### Escuela de Verano de Metodos Mixtos 2017 PUC ######################################
##########################################################################################################################

rm(list=ls())
setwd("/Users/Benjamin/Dropbox/3 Docencia/4 Taller de R EVMM2017/Codigos/Modulo_03")

#ESTADÍSTICA DESCRIPTIVA

#Hasta el momento hemos visto los comandos de Estadística Descriptiva como 
#ejemplos del trabajo en R. Ahora un breve repaso de las funciones que tenemos

library(sjmisc)
coes <- read_stata("/Users/Benjamin/Dropbox/3 Docencia/4 Taller de R EVMM2017/Codigos/Modulo_03/ENACOES_2014_V4.dta",atomic.to.fac = T)
View(coes)

View(coes)
str(coes)
names(coes)
colnames(coes)

colnames(coes) <- tolower(names(coes))
names(coes)


#Indicadores Descriptivos

#P1: Sexo
summary(coes$p1)
class(coes$p1)

mean(coes$p1)     #Al parecer hay problemas....
median(coes$p1)

#P2: Edad
summary(coes$p2)
class(coes$p2)

hist(coes$p2)

#EJERCICIO 1: MANIPULEMOS LA VARIABLE EDAD
#A) QUE SEA UN NÚMERO Y NO UN FACTOR
#B) CONSTRUIR UNA VERSIÓN EN TRAMOS DE EDAD: HAGA UNA PROPUESTA QUE CONTEMPLE 4-5 CATEGORÍAS.
#C) Y SI BUSCO VERSIONES MÁS COMPLEJAS: POR EJEMPLO QUIERO
#                                                           - EDAD CUADRÁTICA.
#                                                           - EDAD ESTANDARIZADA
#                                                           - EDAD CENTRADA

coes$p2 <- as.numeric(as.character(coes$p2))
class(coes$p2)
summary(coes$p2)

coes$p2cuadrado <- coes$p2^2
summary(coes$p2cuadrado)

install.packages("car")
library(car)
coes$p2tramos <- car::recode(coes$p2," c(18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35)=1;c(36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64)=2;else=3",as.factor.result = T)

coes$p2tramos <- car::recode(coes$p2,"18:35=1;36:64=2;65:75=3",as.factor.result = T)

summary(coes$p2tramos)
table(coes$p2,coes$p2tramos)

addmargins(table(coes$p2,coes$p2tramos))


#Calculemos algunos estadísticos descriptivos relevantes para el nivel de medición:

mean(coes$p2)
median(coes$p2)

moda1 <- table(as.vector(coes$p2))
moda1
names(moda1)[moda1==max(moda1)]

sort(summary(as.factor(coes$p2)),decreasing = T)
sort(summary(as.factor(coes$p2)),decreasing = T)[1]

hist(coes$p2)
#No hay un comando built-in para la moda.

quantile(coes$p2)
quantile(coes$p2,0.4)

#EJERCICIO 2: CALCULEMOS LA VARIANZA, DESVIACIÓN ESTÁNDAR Y COEFICIENTE DE VARIACIÓN PARA EDAD.
#CONSIDERE LOS SUPUESTOS MUESTRALES QUE HACE SOBRE LOS DATOS.


#Continuemos con la manipulación de datos:

summary(coes$b1m1_a)  #Razones para surgir en la vida: 

#Exploremos las dimensiones de los datos
addmargins(table(coes$b1m1_a))    #358+248+254+154+46+5
addmargins(table(coes$b1m1_a))[7]
dim(coes)[1]                      #2025-1065

#R no está reconociendo todos los valores como perdidos ¿Cómo podemos resolverlo?
#Recodificando...

library(car)
coes$b1m1_a <- car::recode(coes$b1m1_a,"1=1;2=2;3=3;4=4;5=5;else=NA",as.factor.result = T)
summary(coes$b1m1_a)

sjmisc::flat_table(coes$b1m1_a)
sjmisc::flat_table(coes$b1m1_b,margin="counts")
sjmisc::flat_table(coes$b1m1_b,margin="cell")
sjmisc::flat_table(coes$b1m1_b,margin="row")
sjmisc::flat_table(coes$b1m1_b,margin="col")


summary(coes$b1m1_a)
summary(coes$p1)
tabla <- table(coes$b1m1_a,coes$p1)
tabla
sjstats::table_values(tabla)$cell
sjstats::table_values(tabla)$row
sjstats::table_values(tabla)$col

sjPlot::sjtab(data.frame(coes$b1m1_b))
sjPlot::sjt.frq(coes$b1m1_b)



#Ahora trabajemos con percepción del salario de un obrero...

summary(coes$b6_a)  #Percepción salarial: obrero 

coes$b6_a1 <- ifelse(coes$b6_a==88,NA,
                    ifelse(coes$b6_a==9,NA,coes$b6_a))

summary(coes$b6_a1)

#No funciona bien...

coes$b6_a <- as.numeric(as.character(coes$b6_a))
summary(coes$b6_a)

coes$b6_a1 <- ifelse(coes$b6_a==88,NA,
                     ifelse(coes$b6_a==99,NA,coes$b6_a))
summary(coes$b6_a1)

#Volvamos a los estadísticos:
min(coes$b6_a1)
min(coes$b6_a1,na.rm=T)  #Las estadísticas descriptivas dependen de los NA

#Rango
range(coes$b6_a1,na.rm=T)
max(coes$b6_a1)-min(coes$b6_a1)
max(coes$b6_a1,na.rm=T)-min(coes$b6_a1,na.rm=T)

#Rango intercuartílico
IQR(coes$b6_a1)
IQR(coes$b6_a1,na.rm=T)
quantile(coes$b6_a1,0.75,na.rm=T)-quantile(coes$b6_a1,0.25,na.rm=T)

#Otra alternativa, un tanto más simple es utilizar el comando describe()
#en el paquete psych que incluye el nombre de la variable, el número, 
#el número de observaciones válidos, la media, la desviación estándar,
#mediana, desviación absoluta de la mediana, mínimo, máximo, sesgo,
#curtosis y error estándar.
#Se puede aplicar a la base de datos completa.

install.packages("psych")
library(psych)
describe(coes$b6_a1)

options(scipen=999)

#Ahora, trabajemos con percepción salarial de un parlamentario:
#EJERCICIO 3: CALCULE ESTADISTICOS DESCRIPTIVOS PARA b6_b

?describe
describe(coes$b6_b) 

#EJERCICIO 4: CALCULE LA FRECUENCIA RELATIVA DE UNA VARIABLE:

summary(coes$b1m1_a)


#Volvamos al análisis. Describe también permite distinguir por grupos.

?describeBy
psych::describeBy(coes$b6_a1,coes$p1) #Necesita una v. escalar (numérica) y una condicionante categórica

#Correlación

summary(coes$b7_a)

coes$b7_a <- as.numeric(as.character(coes$b7_a))
summary(coes$b7_a)

coes$b7_a1 <- ifelse(coes$b7_a==88,NA,ifelse(coes$b7_a==99,NA,coes$b7_a))
summary(coes$b7_a1)

cor(coes$b6_a1,coes$b7_a1)
cor(coes$b6_a1,coes$b7_a1,na.rm=T) #No utiliza este argumento
?cor
cor(coes$b6_a1,coes$b7_a1,use="everything")
cor(coes$b6_a1,coes$b7_a1,use="all.obs")
cor(coes$b6_a1,coes$b7_a1,use="complete.obs")


cor.test(coes$b6_a1,coes$b7_a1)
cor.test(coes$b6_a1,coes$b7_a1,use="complete.obs")


###################################################################################
#ELABORACIÓN DE TABLAS

#Primeramente nos centraremos en lo sustantivo (tener la información adecuada
#en el gráfico o en la tabla). Posteriormente nos preocuparemos de la presentación
#de la información. Este último punto no debe considerarse menor: tablas y 
#gráficos dentro de un trabajo/investigación buscan 'hacer un punto o presentar
#una idea', por lo que el medio de presentación resulta crucial.

#Ahora bien, ¿qué elementos deben tenerse en consideración al momento de 
#elaborar una tabla?

#Las variables a incluir en la tabla.
#La naturaleza de dichas variables (categórica, n-discreta,n-continua) y su
#frecuencia de manera aproximada.
#El número de niveles dentro de cada variable.
#La presencia de NAs.

#El siguiente paso es revisar los comandos necesarios. Al utilizar la coma (,) para 
#separar las variables incluidas se tiene que la primera variable se presenta como 
#filas y la segunda como columnas de la tabla. 

#table()        #Comando básico de tabulación.Si se usa más de una variable,
#deben ir separadas por comas.

#ftable()       #Genera tablas 'aplastadas', ya que permite ajustar estructuras
#de datos más complejas a una tabla típica. En términos simples,
#genera tablas más ordenadas.

#margin.table() #Tablas marginales.

#addmargins()   #Agrega los marginales a una tabla.

#prop.table()   #Tabla de proporciones.

#Generaremos una tabla como objeto. Es preferible para almacenarlas.

#Mejorar la presentación de los datos. Redondearemos los números en las celdas
#con el comando round (redondear), donde necesitamos especificar los dígitos de
#redondeo:

?round
#round(objeto,digits=número de dígitos)


#TABLA UNIVARIADA: FRECUENCIAS.

tabla1<-table(coes$b15_a)
tabla1                         #¿Es necesario hacer más modificaciones?
ftable(coes$b15_a)

#Lo primero que noto es que hay un nivel extra dentro de la tabla: los NAs. Por lo 
#tanto, procederé a descartarlos, utilizando subset y el comando droplevels (descartar
#niveles).

coes$b15_a1 <- car::recode(coes$b15_a,"9=NA")
table(coes$b15_a1)

#Y sucederá lo mismo con cualquier base de datos?

#Pensemos un poco sobre la opinión/percepción de los chilenos sobre la desigualdad:
#EJERCICIO 5: Identifique una o varias preguntas útiles para describir la percepción sobre la desigualdad en Chile
#Realice una descripción y juicio crítico del indicador



#TABLA BIVARIADA: ASOCIACIONES ENTRE 2 VARIABLES.

sjt.frq(coes$f3)

#Estudiemos participación electoral reportada según sexo.
#p1 es sexo
#f3 es participación electoral 2013

tabla4<-table(coes$p1,coes$f3)
tabla4                                   #Fíjense en los valores. 


#EJERCICIO 6: Formateen esta tabla para que se utilizable en una presentación 


#Ahora generaremos tablas con porcentajes.
#Muchas veces es preferible utilizar frecuencias relativas (presentadas como %)
#pero es importante definir el cálculo relevante. En general, nunca es útil
#calcular el porcentaje respecto al total (describe limitadamente, no permite
#estudiar asociaciones entre variables).

#Si ubicamos la variable de interés (a describir) en las filas, se calcula el 
#porcentaje-columna, si se ubica en las columnas se utiliza el porcentaje-fila.
#Otro modo de plantear lo mismo. Si la variable independiente está en las filas
#calculamos el porcentaje respecto al total de cada fila. Si la variable
#independiente se encuentra en las columnas, utilizamos el porcentaje respecto 
#a las columnas. 


#El comando indicado es prop.table (tabla de proporciones).El comando se aplica
#sobre una tabla.

?prop.table
#prop.table(tabla,margen) #Si no se especifica algun margin, se calcula sobre 
#el total. Si se especifica margin=1 se hace sobre las filas, si se especifica
#margin=2 se hace sobre las columnas.

#prop.table(tabla)       #Frecuencia dividida por el total de observaciones.
#prop.table(tabla,1)     #Frecuencia dividida por el marginal de las filas.
#prop.table(tabla,2)     #Frecuencia dividida por el marginal de las columnas. 

prop.table(tabla4)                #Calcula la proporción sobre el total
addmargins(prop.table(tabla4))    #Fíjense en la parte inferior de Sum (es 1)
addmargins(prop.table(tabla4,1))  #Calcula la proporción sobre el marginal 
#de las filas. 
addmargins(prop.table(tabla4,2))  #Calcula la proporción sobre el marginal 
#de las columnas. 


#Para transformarla en una tabla de porcentajes simplemente multiplicamos por 
#100

round(addmargins(prop.table(tabla4,1)),digits=3)*100


#CUIDADOS ESPECIALES EN TABLAS CON VARIABLES CONTINUAS

#Ahora consideraremos los casos en que se utilizan dos variables numéricas (toman
#un alto Nº de valores). Resulta deseable condicionar según intervalos. 

load("BancoMundial2010.RData")
table(BancoMundial$GDP.growth)   #No es un resumen de información

#Usaremos cut y quantile. Recordar que por defecto se generan cuartiles. Estos tienen
#múltiples aplicaciones, en particular al condicionar una variable o analizar un 
#conjunto específico dentro de la distribución.


tabla6<-table(cut(BancoMundial$GDP.capita, quantile(BancoMundial$GDP.capita, na.rm=TRUE)),
              cut(BancoMundial$inflation, quantile(BancoMundial$inflation, na.rm=TRUE)))
tabla6

#La realización de la tabla (ambas variables fueron 'cortadas' en intervalos, en 
#este caso particular los cuartiles. Cada celda indica el número de observaciones
#para las cuales AMBAS variables toman los valores dentro del intervalo en 
#cuestión.

#TABLAS MULTIVARIADAS: ASOCIACIONES ENTRE 3 O MÁS VARIABLES.

#Analizaremos tablas con 3 variables.

#Asociación entre sexo, participación electoral y edad en tramos

tabla7<-table(coes$p1,coes$p2,coes$f3)
tabla7

#EJERCICIO 7: Pésima tabla: hacer los ajustes para formatear..


####Más sobre tablas: plataforma de Strange Jack

sjmisc::flat_table(coes$b1m1_a)
sjmisc::flat_table(coes$b1m1_b,margin="counts")
sjmisc::flat_table(coes$b1m1_b,margin="cell")
sjmisc::flat_table(coes$b1m1_b,margin="row")
sjmisc::flat_table(coes$b1m1_b,margin="col")


summary(coes$b1m1_a)
summary(coes$p1)
tabla <- table(coes$b1m1_a,coes$p1)
tabla
sjstats::table_values(tabla)$cell
sjstats::table_values(tabla)$row
sjstats::table_values(tabla)$col

sjPlot::sjtab(data.frame(coes$b1m1_a))
sjPlot::sjt.frq(coes$b1m1_b)

summary(coes$b1m1_a)
sjt.frq(coes$b1m2_c)
coes$b1m1_a <- car::recode(coes$b1m1_a,"1=1;2=2;3=3;4=4;5=5;else=NA")
coes$b1m1_a <- set_labels(coes$b1m1_a,c("Muy en desacuerdo","En desacuerdo","Ni de acuerdo, ni en desacuerdo","De acuerdo","Muy de acuerdo"),force.labels = T)
sjp.xtab(coes$b1m1_a,grp=coes$p1R)

tempora1 <- data.frame(coes$b6_a1,coes$b7_a1)
sjt.corr(tempora1)
sjt.df(tempora1)
sjt.frq(temporal1)

library(sjPlot)

tabla <- table(coes$p1R,coes$f3R)
chisq.test(tabla)
sjp.chi2(data.frame(coes$p1R,coes$f3R))
?sjp.chi2

library(gmodels)
CrossTable(tabla)


datos <- data.frame(coes$p1R,coes$b1m1_a,coes$b1m1_b,coes$b1m1_c)
sjp.chi2(datos)

install.packages("sjPlot")
library(sjPlot)
names(BancoMundial)
bm <- subset(BancoMundial,select=c("enrollment.primary","enrollment.tertiary","gov.spending.education","GDP.growth","GDP.capita","Debt.service","inflation"))
sjp.corr(bm)


#####################################################################################
#GRÁFICOS UNIVARIADOS

#Los dos comandos básicos de graficación son plot() y lines()

plot()        #Graficar
lines()       #Generar una línea.

datos<-c(1,2,4,6,7,5,3,4,4,5,6,7,10,2,5,7,8,8,1,1,3)
plot(datos)

plot(datos,pch=17,cex=1.5)
lines(datos,lwd=2,col="red",lty=5)

#Ahora bien, si se fijan en el eje horizontal (X), la variable es "Index", vale decir
#las observaciones según su orden o índice dentro del vector que grafiqué (datos).

plot(sort(datos))
lines(sort(datos),lwd=2,lty=4)

#Aquí únicamente ORDENE las observaciones contenidas en datos (de menor a mayor).
#El gráfico resultante es totalmente distinto. Debe tenerse en cuenta que al generar
#gráficos univariados con plot() se está comparando la posición de la observación y el
#valor que toma. El gráfico resulta de interés si la POSICIÓN indica algo relevante.

?plot        #Es el comando básico de graficación. Por defecto genera gráficos de
#dispersión, en cuyo eje horizontal aparecen las observaciones 
#ordenadas (Index).
#Como se verá más abajo, se pueden especificar varios tipos.


#Dentro de la Estadística Descriptiva Univariada resulta preferible centrarse en
#gráficos y tablas que indiquen la frecuencia de las observaciones, o en estadígrafos
#de posición, tendencia central o dispersión.

#Analicemos con algún detalle los tipos de Gráficos que se genera

plot(BancoMundial$GDP.capita)
plot(BancoMundial$GDP.capita,type="p")  #Gráfico de Puntos. Elegido por defecto
plot(BancoMundial$GDP.capita,type="l")  #Gráfico de Líneas
plot(BancoMundial$GDP.capita,type="b")  #Gráfico de Puntos y Líneas 'both'
plot(BancoMundial$GDP.capita,type="h")  #Histograma
plot(BancoMundial$GDP.capita,type="s")  #Gráfico de Escalones 'steps'
plot(BancoMundial$GDP.capita,type="n")  #Gráfico Nulo

#Los dos gráficos más básicos son: el gráfico de barras (barplot, para variables 
#categóricas) y el histograma (hist, para variables numéricas, especialmente si son
#continuas).

?barplot
barplot(lapop$q1)                #Error
barplot(table(lapop$q1))         #Es importante generar un tabla para el uso de este 
#comando.
barplot(BancoMundial$GDP.capita) #No necesita la Tabla si es numérica

#Siendo preciso, no necesita la variable en sí, si no que las alturas a graficar.

?hist
hist(BancoMundial$GDP.capita)
hist(lapop$q1)                 #El comando necesita una variable numérica

#¿Cuál es la diferencia entre un Histograma y un Gráfico de Barras?
#¿Cuál es el efecto de incrementar el número de barras (5,10)?

hist(BancoMundial$GDP.capita,breaks=5)

#Ahora, no siempre debe graficarse la frecuencia

hist(BancoMundial$gov.spending.education) 
hist(BancoMundial$gov.spending.education,prob=F) 
hist(BancoMundial$gov.spending.education,prob=T) 

#Este último gráfico (aún cuando se mantengan las proporciones) no representa lo
#mismo. Se muestran la densidad (densidades de probabilidad). En este caso, el
#área total del Gráfico es 1 (como la suma de todas las probabilidades).

#Gráfico de Torta.  http://www.statmethods.net/graphs/pie.html 

?pie #Los comandos de R para gráfico de torta son muy débiles.

#Generaremos un gráfico de torta para la variable sexo La variable toma sólo dos 
#valores 0 y 1, indicando si es Hombre o Mujer.

pie(coes$p1) #El gráfico tiene problemas.

#Generaremos una variable auxiliar para realizar el Gráfico

summary(coes$p1)

#Necesitamos saber cuantas mujeres hay. Para esto, necesitamos que  la variable 
#sea un factor (no una variable numérica), así sabremos su frecuencia con summary().

summary(as.factor(coes$p1))

#Ahora generaremos la variable auxiliar mujer1.

mujer1<-c(823,1202)
etiquetas<-c("Hombre","Mujer")

pie(mujer1,labels=etiquetas)

#Formato Completo del Gráfico de Torta

porcentajes <- round(mujer1/sum(mujer1)*100)  #Calculamos los porcentajes de cada 
#grupo
etiquetas   <- paste(etiquetas,porcentajes)   #Unimos los % a las etiquetas
etiquetas   <- paste(etiquetas,"%",sep="")    #Agregar el símbolo % a las etiquetas
pie(mujer1,labels = etiquetas, col=c("red","yellow"),main="Grafico 1: Encuestados según sexo)",
    sub="Fuente: COES, 2014")


#GRÁFICO DE LÍNEAS USANDO lines()

#Un gráfico de líneas se genera con plot y luego se unen con lines.

#Se tienen los sgtes datos respecto a la inflación mensual de Chile, medido
#mediante el IPC

#	 Período	         	Inflación
#	 Febrero    2015	    1,302 %
#	 Enero      2015		1,578 %
#	 Diciembre  2014	    1,486 %
#	 Noviembre  2014	    2,134 %
#	 Octubre    2014	    2,924 %
#	 Septiembre 2014	    2,843 %
#	 Agosto     2014	    2,562 %
#	 Julio      2014		2,509 %
#	 Junio      2014		2,646 %
#	 Mayo       2014		3,129 %

inflacion<-c(3.129,2.646,2.509,2.562,2.843,2.924,2.134,1.486,1.578,1.302)
tiempo<-c(1,2,3,4,5,6,7,8,9,10)
names(tiempo)<-c("May-14","Jun-14","Jul-14","Ago-14","Sep-14","Oct-14",
                 "Nov-14","Dic-14","Ene-15","Feb-15")
plot(tiempo,inflacion,xlim=c(1,10),ylim=c(0,3.5),xaxt='n')
axis(1,at=tiempo,labels=names(tiempo))
lines(inflacion)

#Dot-Plot (Grafico de Puntos)

sub<-subset(lapop,y4!="")
subA<-droplevels(sub)
tabla8<-table(subA$y4)
tabla8<-as.matrix(tabla8)
tabla8
rownames(tabla8)<-c("Asuntos Economicos","Asuntos Politicos","Derechos Humanos",
                    "Educacion","Servicios Publicos","Otros","Seguridad",   
                    "Medioambiente")
colnames(tabla8)<-"Tematicas"
dotchart(tabla8,labels=row.names(tabla8),xlab="Numero de Menciones",xlim=c(0,30),
         sub="Fuente: LAPOP(2010)",main="Grafico 1.1: Razones Aludidas para
         Participar en Protestas Publicas")

#Grafico de Caja y Bigotes (boxplot)

?boxplot
boxplot(coes$b15_a1)               #¿Cuál es el problema?

summary(BancoMundial$inflation)
boxplot(BancoMundial$inflation,ylim=c(-5,30),
        ylab="Inflacion en Terminos %",sub="Fuente: Banco Mundial (2010)",
        main="Grafico 1.2:Distribucion de la Tasa de Inflacion en Paises del Mundo",col="orange")

summary(BancoMundial$GDP.growth)
boxplot(BancoMundial$GDP.growth,ylim=c(-10,30),
        ylab="Tasa Anual de Crecimiento del Producto",sub="Fuente: Banco Mundial (2010)",
        main="Grafico 1.3: Distribucion de la Tasa de 
        Crecimiento Economico en los Paises del Mundo",col="blue")

#Otra alternativa idéntica, pero permite identificar outliers univariados

library(car)
Boxplot(BancoMundial$GDP.growth,ylim=c(-10,30),
        ylab="Tasa Anual de Crecimiento del Producto",sub="Fuente: Banco Mundial (2010)",
        main="Grafico 1.3: Distribucion de la Tasa de 
        Crecimiento Economico en los Paises del Mundo",col="blue")  

#Identificar los valores descritos.

summary(BancoMundial$GDP.growth)
mean(na.omit(BancoMundial$GDP.growth))
median(na.omit(BancoMundial$GDP.growth))
sd(na.omit(BancoMundial$GDP.growth))
range(na.omit(BancoMundial$GDP.growth))
diff(range(na.omit(BancoMundial$GDP.growth)))
IQR(na.omit(BancoMundial$GDP.growth))
fivenum(BancoMundial$GDP.growth)        #Números Claves para el Boxplot

boxplot(BancoMundial$GDP.growth,ylim=c(-10,30),
        ylab="Tasa Anual de Crecimiento del Producto",sub="Fuente: Banco Mundial (2010)",
        main="Grafico 1.3: Distribucion de la Tasa de 
        Crecimiento Economico en los Paises del Mundo",col="blue")
abline(h=median(na.omit(BancoMundial$GDP.growth)),lty=2)           #Mediana
abline(h=max(na.omit(BancoMundial$GDP.growth)),lty=2)              #Maximo
abline(h=min(na.omit(BancoMundial$GDP.growth)),lty=2)              #Minimo
abline(h=quantile((na.omit(BancoMundial$GDP.growth)),0.25),lty=2)  #Percentil 0.25
abline(h=quantile((na.omit(BancoMundial$GDP.growth)),0.75),lty=2)  #Percentil 0.75

#¿Cuál es el efecto de los NAs en los gráficos

summary(BancoMundial$gov.spending.education)

gasto1<-BancoMundial$gov.spending.education
gasto2<-na.omit(BancoMundial$gov.spending.education)

par(mfrow=c(1,2)) #Comando para especificar que se 'adjunten' 2 gráficos
#Se genera 1 fila con 2 columnas 
boxplot(gasto1)
boxplot(gasto2)


#Veamos con mayor detalle lo que se puede hacer con plot: Formateo

summary(BancoMundial$GDP.capita)      #Importante analizar ciertos estadísticos
#descriptivos.
length(BancoMundial$GDP.capita)

plot(BancoMundial$GDP.capita,xlim=c(0,230),ylim=c(0,70000),
     xlab="Paises",ylab="Frecuencia Absoluta",
     sub="Fuente: Banco Mundial (2010)",
     main="Grafico 1.4: PIB per capita de los paises del Mundo")
abline(v=111,lty=3,lwd=3)
abline(h=18000,lwd=4,col="red")


base5<-subset(BancoMundial,gov.spending.education!="")
base5a<-droplevels(base5)
summary(base5a$gov.spending.education)
hist(base5a$gov.spending.education,xlim=c(0,40),ylim=c(0,10),
     xlab="Gasto Gubernamental en Educación",ylab="Frecuencia",
     sub="Fuente: Banco Mundial (2010)",
     main="Grafico 1.7: Histograma de Gasto Educacional",breaks=20)

hist(base5a$gov.spending.education,xlim=c(0,40),ylim=c(0,0.2),
     xlab="Gasto Gubernamental en Educación",ylab="Frecuencia",
     sub="Fuente: Banco Mundial (2010)",
     main="Grafico 1.7: Histograma de Gasto Educacional",prob=T,
     breaks=20)
lines(density(base5a$gov.spending.education),lty=2,lwd=2,col="blue")

#Profundicemos en los gráficos de densidades.

install.packages()
library(lattice)
summary(BancoMundial$GDP.capita)
densityplot(BancoMundial$GDP.capita,xlim=c(-20000,70000),ylim=c(-0.00001,0.00015),
            ylab="Densidad",xlab="PIB per cápita",sub="Banco Mundial (2010)",
            main="Grafico 1.8:Densidad de Kernel del Producto per
            Capita en Muestra Seleccionada de Paises")

densityplot(lapop$ing4)               #¿Cuál es el problema?


#GRÁFICOS BIVARIADOS: RELACIONES ENTRE VARIABLES

#Un Gráfico de Barras condicionado por otra variable


tabla9<-table(coes$p1R,coes$f3R) 
tabla9                            

barplot(tabla9,ylim=c(0,500),legend.tex=c("Hombre","Mujer"),col="rainbow"(2),
        ylab="Frecuencia Absoluta",sub="Fuente: LAPOP (2010)",xlab="Escala de Opinion",
        main="Grafico 1:¿Participó en las elecciones de 2013?")

#NO es para nada bueno el gráfico (siempre hay más mujeres que hombres)

prop.table(tabla9,2)*100 #Esto está reflejando el Gráfico
prop.table(tabla9,1)*100 

barplot(prop.table(tabla9,1)*100,ylim=c(0,100),legend.tex=c("Hombre","Mujer"),col="rainbow"(2),
        ylab="Porcentaje de Menciones",sub="Fuente: LAPOP (2010)",xlab="Escala de Opinion",
        main="Grafico 1:¿Participó en las Elecciones de 2013?")

#Sigue siendo un gráfico deficitario. Pero sirve para ejemplificar el gráfico BiVar.


#Un Gráfico de Dispersión que representa la asociación entre variables.

base7<-subset(BancoMundial,GDP.capita!=""&inflation!=""&GDP.growth!="")
base7a<-droplevels(base7)

summary(base7a$GDP.capita)
summary(base7a$inflation)
summary(base7a$GDP.growth)
plot(base7a$GDP.capita,base7a$inflation,xlab="PIB per capita",
     ylab="Inflacion (en %)",xlim=c(0,60000),sub="Fuente: Banco Mundial (2010)",
     main="Grafico 2.2: Relacion entre Tasa de Inflacion 
     y PIB per Capita en el Año 2010")

plot(base7a$GDP.growth,base7a$inflation,
     xlab="Tasa de Crecimiento del Producto (%)",
     ylab="Tasa de Inflacion (%)",sub="Fuente: Banco Mundial (2010)",
     main="Grafico 2.3: Relacion entre Inflacion y 
     Crecimiento Economico el Año 2010" )
abline(v=0,lwd=3,lty=2,col="red")

cor(base7a$GDP.capita,base7a$inflation)
cor(base7a$GDP.growth,base7a$inflation)








