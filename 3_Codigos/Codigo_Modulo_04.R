##########################################################################################################################
######################################                                              ######################################
######################################   MODULO 4: ESTADISTICA INFERENCIAL BASICA   ######################################
######################################                                              ######################################
######################################                Benjamín Muñoz                ######################################
###################################### Escuela de Verano de Metodos Mixtos 2017 PUC ######################################
##########################################################################################################################

#VARIABLES ALEATORIAS

#Otro modo de plantear probabilidades. Por lo tanto, se aplican los mismos
#axiomas:

#1)TODAS las probabilidades asociadas a sucesos en el espacio muestral se
#  mueven entre 0 y 1.
#2)La suma de TODAS las probabilidades de los sucesos del espacio muestral es 1.

#De otro modo, la probabilidad del espacio muestral es 1 y la probabilidad de la 
#unión de dos eventos disjuntos es igual a la suma de las probabilidades de esos 
#eventos.

#Una VARIABLE ALEATORIA  es una regla (es decir, es una función matemática)
#que asocia un ÚNICO número real a cada resultado de un experimento aleatorio,
#de un modo tal que la probabilidad asociada con cada uno de estos números equivale
#a la probabilidad asociada con el resultado que dicho número representa.


##Un par de detalles

#Un experimento es cualquier proceso que produce un resultado.
#Experimento Aleatorio: más de un resultado posible.
#Espacio Muestral: conjunto de todos los resultados posibles de un experimento
#                  aleatorio.
#Suceso o Evento: subconjunto del espacio muestral. Es decir, es cualquier
#                 subconjunto de resultados de un experimento es un evento.


#La función va desde el espacio muestral a los Reales. 

#LAS VARIABLES ALEATORIAS SON VEHÍCULOS MATEMÁTICOS PARA REPRESENTAR UN 
#EVENTO EN TÉRMINOS ANALÍTICOS.

#Se le puede asociar a una v.a. X una función de probabilidad (o de densidad) 
#que cumpla las siguientes propiedades:

#1) P(Xi)>=0
#2) Sumatoria P(Xi)=1
#3) La función asocia probabilidades equivalentes a los números reales
#   y a los eventos asociados a éstos (Correspondencia).

#Antes de detallar esto último, debe mencionarse que existen dos tipos de v.a.:

#A) Discretas: toma un número finito o infinitamente contable de valores.
#B) Continuas: toma un número infinito de valores.

#####################################################################################
##	  								                             				  ##	
##R tiene ayuda para trabajar con distribuciones. Incluye para casos particulares  ##
##	  								                             				  ##	
help(Distributions)										                          ##
##	  								                             				  ##	
#####################################################################################

#Existen 4 funciones en R asociadas a cualquier distribución.

#d DISTRIBUCIÓN = Probabilidad Puntual o Densidad.
#p DISTRIBUCIÓN = Probabilidad Acumulada o Función de Distribución.
#q DISTRIBUCIÓN = Cuantiles de una Distribución.
#r DISTRIBUCIÓN = Números Pseudo-Aleatorios en base a una distribución.

#ddistr(x, parametros)   densidad								
#pdistr(q, parametros)   función de distribución acumulada 					
#qdistr(p, parametros)   función cuantil: función inversa de la acumulativa 
#y permite la comparación de las acumulaciones                         
#rdistr(n, parametros)   números aleatorios

#qDISTR tendrán mayor utilidad para el cálculo de test estadísticos (equivale a las 
#tablas que usaban en dócimas de hipótesis), mientras que rDISTR se utiliza para 
#calcular ejemplos.

#####################################################################################

#La distribución de la v.a. X es el conjunto de las probabilidades P(X E C), para
#todos los conjuntos C de números reales tales que (X pertenece C) es un evento.

#La función de probabilidad de densidad (p.d.f. en inglés) describe las
#probabilidades asociadas a obtener determinados valores.
#¿Caso Discreto y Caso Continuo?

#Una v.a. tiene una distribución discreta (X es una v.a. discreta) si X sólo
#puede tomar un n° k finito de valores x1,...,xk o una secuencia infinita de 
#diferentes valores x1,x2,...

#Si una v.a. X tiene una distribución discreta, la función de probabilidad de X
#es definida como una función f tal que para n° real x:

# f(x)=Pr(X=x)

#Si x no es uno de los posibles valores de X, entonces f(x)=0. Si la secuencia
#x1,x2,... incluye todos los valores posibles de X, la suma de todos estos es
#1. Sumatoria f(xi)=1

#Para v.a. discretas, la función de probabilidad toma valores "puntuales"

# px(x)=P(X=x)

#Se le conoce como función de cuantía (o 'probability mass function').


#Una v.a. continua puede tomar cualquier valor dentro de un intervalo. Existe
#una función no negativa f definida en los reales, de manera tal que para cada
#intervalo de valores reales , la probabilidad de que X tome dicho valor en el
#intervalo es una integral de f sobre el intervalo.

# Pr( a=X=b)=Integral f(x) dx

#Si X tiene una distribución continua, f es una función de densidad de la 
#probabilidad de X. Toda f.d.p.  debe satisfacer dos requerimientos:

f(x)=0
Integralf(x)dx=1

#Las distribuciones continuas asignan una probabilidad de 0 a los valores 
#individuales.
#La densidad no equivale a la probabilidad. 

#Discreta f.p. (p.f.)
#Continua f.d.p. (p.d.f.)
#Toda distribución tiene una caracterización común mediante su función de
#distribución cumulativa (f.d.c. o en inglés c.d.f).

#El inverso de la f.d.c. es la función cuantil, útil para indicar dónde la 
#probabilidad se localiza en una distribución.

#La función cumulativa de distribución F  de una v.a. X  es una función

#F(x)= Pr(X=x) para -Inf<x<Inf

#F(x) es una función no decreciente a medida que x crece.
#F(x) se mueve entre 0 y 1 (límites de los valores).
#F(x) es una función continua hacia la derecha.

#Para cada valor x

# Pr(X>x)=1-F(x)

#Para dos valores x1 y x2 tales que x1<x2

# Pr(x1<X=x2)=F(x2)-F(x1)

# Pr(x1<X=x2)+Pr(X=x1)=Pr(X=x2

#La función de probabilidad acumulada describe la probabilidad de obtener
#valores igual o menores a x para una distribución.


#Antes de pasar al cálculo de probabilidades con Variables Aleatorias, un detalle 
#importante ¿Cómo calcular un factorial?

1*2*3*4*5
prod(5:1)
factorial(5)

#Combinatoria o Coeficiente Binomial
#   n
#  C    o      C(n,k)    o      n C k    (n k)
#   k

#Es el número de  subconjuntos de k elementos escogidos  de un conjunto
#con n elementos

#Existe una función en R. Se debe especificar n y k (en ese orden).
?choose
choose(5,3)

#####################################################################################
#Analizaremos el caso de la v.a. Binomial 

#Hay más de un suceso, para los cuales se pueden obtener dos resultados:
#ÉXITO O FRACASO (PRESENCIA O AUSENCIA/ OCURRENCIA O NO OCURRENCIA).
#Dichos sucesos pueden ser reemplazados por 1 y 0.

#Cada ocurrencia toma únicamente UNO de los dos valores.

#Se asume que la probabilidad de ocurrencia del evento es constante en
#cada experimento (o intento 'trial'), pero dichos intentos son estadísticamente
#independientes entre sí.

#Una secuencia binomial se puede describir TOTALMENTE mediante:

#1) Un número de ocurrencias del evento éxito       ->  X
#2) Un número fijo de intentos del experimento      ->  n
#3) Una probabilidad de ocurrencia del evento éxito -> p

#Entonces, la probabilidad de que ocurran x éxitos en los n intentos está
#representado por la distribución binomial:

#	      x	 n-x        
#px(x)=(n) p  (1-p)        x=0,1,...,n
#      (x)

#Se tienen aquí 2 PARÁMETROS: n y p (es lo que deben especificar en R).
#El valor x corresponde a lo que uds. desean calcular.


x<-0:50
x
d<-dbinom(x,size=50,prob=0.33)
plot(x,d,type="h")

p <- pbinom(x,size=50,prob=0.33)
plot(x,p,type="h")


#Ejercicios de Probabilidad

#Suponga que tiene una prueba para un curso de la universidad, dónde se
#realizan 20 preguntas de verdadero o falso. Un estudiante no estudia
#para la prueba, por lo que decide contestar la prueba aleatoriamente, no
#dependiendo la respuesta de una pregunta a las previas. 
#Se les informa que con 15 preguntas correctas aprueban la evaluación.

#Tenemos 20 preguntas          -> n=20
#La Probabilidad de 'acertar'  -> p=0.5

#¿Cuál es la probabilidad de contestar 15 preguntas correctamente?

#Apliquemos la fórmula:

# choose(n,x) es la función para calcular las combinaciones posibles de x
#             elementos de un total de n

choose(20,15)*(0.5^15)*((1-0.5)^(20-15))

#Esta es la probabilidad de obtener 15 respuestas correctas si el alumno
#contesta al azar.

#Ahora bien, es más fácil realizar este cálculo mediante los comandos de 
#distribuciones. Por un momento, distingamos entre sucesos 'simples' y 'complejos', 
#entendiendo los primeros como los "casos de valores concretos".
#Para el caso particular de la distribución Binomial, el comando es el siguiente:

#dbinom(x,n,p) Siendo x el número de casos positivos, n el n° de intentos
#              y p la probabilidad de ocurrencia.

#Por lo tanto, un modo equivalente de obtener los resultados es:

dbinom(15,20,0.5)

#También se puede utilizar la probabilidad Acumulada

pbinom(15,20,0.5)-pbinom(14,20,0.5)

#Lo que acabamos de calcular es un suceso 'simple', y también lo sería calcular
#la probabilidad de una respuesta correcta, de dos, tres, etc.

numero.intentos<-20
probabilidad<-0.5
sucesos<-seq(from=1,to=20,by=1)
sucesos
dbinom(sucesos,numero.intentos,probabilidad) 
binomial<-dbinom(sucesos,numero.intentos,probabilidad) 

plot(sucesos, binomial,xlab="N° de Casos Positivos",ylab="Probabilidad de Ocurrencia",ylim=c(0,0.2),main="Grafico 1: Probabilidad de Obtener Respuestas 
     Correctas en la Prueba de Análisis de Datos",sub="Fuente: Elaboración Propia")

#Buena idea presentar esto como un Spike Plot

#Para esto se especifica el tipo de gráfico particular, type="h", es decir
#un gráfico de alturas 'heights'

plot(sucesos, binomial,xlab="N° de Casos Positivos",ylab="Probabilidad de Ocurrencia",ylim=c(0,0.2),main="Grafico 1: Probabilidad de Obtener Respuestas 
     Correctas en la Prueba de Análisis de Datos",sub="Fuente: Elaboración Propia",
     type="h")
points(sucesos, binomial, pch=16,cex=1)

#Para identificar el caso analizado en la pregunta se puede 'destacar' la 
#altura mediante el comando segments

#segments(x0,y0,x1,y1, parámetros de gráficación)

prob<-dbinom(15,20,0.5)
prob
segments(x0=15,y0=0,x1=15,y1=prob,lwd=3,col="red")
points(15,prob,col="red",pch=16,cex=2)

#En el eje vertical está la p.d.f.

#El comando points gráfica puntos. pch y cex son especificaciones generales
#de graficación. pch alude a la forma del punto y cex a su tamaño (Capítulo 3 
#de Manning, página 51).

#Otra dimensión relevante son los 'sucesos complejos', cuando consideramos
#las probabilidades asociadas a que se tome un n° determinado de casos positivos.
#Ya no buscamos la probabilidad de que tome un valor x en específico, si no que
#un intervalo de valores.

#Otro aspecto es considerar la probabilidad de que una v.a. X tome valores
#A LO MÁS iguales a x. 
#Es decir, calcular la probabilidad:

#P(X=<x)

#Esto corresponde a la función cumulativa de densidad (c.d.f. en inglés) o
#función acumulada de probabilidad. 

#Se usa el comando pbinom

pbinom(sucesos,numero.intentos,probabilidad)

plot(pbinom(sucesos,numero.intentos,probabilidad),xlab="N° de Casos Positivos",
     ylab="Probabilidad de Ocurrencia",
     main="Grafico 2: Función de Densidad Cumulativa",
     sub="Fuente: Elaboración Propia",
     type="h")
points(sucesos,pbinom(sucesos,numero.intentos,probabilidad), pch=16,cex=1)

##########Puede entenderse como un equivalente de la Frecuencia Acumulada############

#EJERCICIO 2

#En el contexto de una elección de centro de estudiantes, se realiza una 2da
#vuelta entre las dos listas más votadas. Se realizó una encuesta, de la cual
#se concluyó que la probabilidad de apoyar a la lista A es de 0.6. 
#La participación en la elección es obligatoria, y se tiene un padrón de 30
#votantes.

#A)¿Cuál es la probabilidad de que gane la lista A?

#1) Para ganar, la lista A requiere más de la mitad de los votos. Es decir,
#requiere 16 votos o más. 

#P(X>=16)=P(X=16)+P(X=17)+P(X=18)+P(X=19)+P(X=20)+P(X=21)+P(X=22)+P(X=22)+
#         P(X=23)+P(X=24)+P(X=25)+P(X=26)+P(X=27)+P(X=28)+P(X=29)+P(X=30)

#También se podría calcular como 1- P(X<16).

#2)Asumiremos una distribución binomial. Del enunciado sabemos que:

n<-30
p<-0.6

#3)Realizar el cálculo:

dbinom(16,30,0.6) #Es muy demoroso hacer esto manualmente, para todos los 
#valores.

#Definimos un objeto que contenga todos los sucesos (valores de x)

votos<-seq(from=16,to=30,by=1)
votos
dbinom(votos,30,0.6)
dbinom(votos,n,p)              #Aquí se calcularon las probabilidades 'simples'
sum(dbinom(votos,30,0.6))      #Corresponde a la probabilidad de que gane la 
#lista A.

1-pbinom(15,n,p)              #1- P(X<16)
pbinom(15,n,p,lower.tail=F)   #Cambiar la 'cola' considerada. 

votos1<-seq(from=1,to=30,by=1)
prob1<-dbinom(votos1,n,p)
plot(votos1,prob1, xlab="N° de Casos Positivos",
     ylab="Probabilidad de Ocurrencia",ylim=c(0,0.16),
     main="Grafico 3: Probabilidad de Triunfo en
     Elecciones para la Lista A",sub="Fuente: Elaboración Propia",
     type="h")
points(votos1, prob1, pch=16,cex=1)

segments(x0=16,y0=0,x1=16,y1=dbinom(16,30,0.6),lwd=3,col="red")
points(16,dbinom(16,30,0.6),col="red",pch=16,cex=2)
segments(x0=17,y0=0,x1=17,y1=dbinom(17,30,0.6),lwd=3,col="red")
points(17,dbinom(17,30,0.6),col="red",pch=16,cex=2)
segments(x0=18,y0=0,x1=18,y1=dbinom(18,30,0.6),lwd=3,col="red")
points(18,dbinom(18,30,0.6),col="red",pch=16,cex=2)
segments(x0=19,y0=0,x1=19,y1=dbinom(19,30,0.6),lwd=3,col="red")
points(19,dbinom(19,30,0.6),col="red",pch=16,cex=2)
segments(x0=20,y0=0,x1=20,y1=dbinom(20,30,0.6),lwd=3,col="red")
points(20,dbinom(20,30,0.6),col="red",pch=16,cex=2)
segments(x0=21,y0=0,x1=21,y1=dbinom(21,30,0.6),lwd=3,col="red")
points(21,dbinom(21,30,0.6),col="red",pch=16,cex=2)
segments(x0=22,y0=0,x1=22,y1=dbinom(22,30,0.6),lwd=3,col="red")
points(22,dbinom(22,30,0.6),col="red",pch=16,cex=2)
segments(x0=23,y0=0,x1=23,y1=dbinom(23,30,0.6),lwd=3,col="red")
points(23,dbinom(23,30,0.6),col="red",pch=16,cex=2)
segments(x0=24,y0=0,x1=24,y1=dbinom(24,30,0.6),lwd=3,col="red")
points(24,dbinom(24,30,0.6),col="red",pch=16,cex=2)
segments(x0=25,y0=0,x1=25,y1=dbinom(25,30,0.6),lwd=3,col="red")
points(25,dbinom(25,30,0.6),col="red",pch=16,cex=2)
segments(x0=26,y0=0,x1=26,y1=dbinom(26,30,0.6),lwd=3,col="red")
points(26,dbinom(26,30,0.6),col="red",pch=16,cex=2)
segments(x0=27,y0=0,x1=27,y1=dbinom(27,30,0.6),lwd=3,col="red")
points(27,dbinom(27,30,0.6),col="red",pch=16,cex=2)
segments(x0=28,y0=0,x1=28,y1=dbinom(28,30,0.6),lwd=3,col="red")
points(28,dbinom(28,30,0.6),col="red",pch=16,cex=2)
segments(x0=29,y0=0,x1=29,y1=dbinom(29,30,0.6),lwd=3,col="red")
points(29,dbinom(29,30,0.6),col="red",pch=16,cex=2)
segments(x0=30,y0=0,x1=30,y1=dbinom(30,30,0.6),lwd=3,col="red")
points(30,dbinom(30,30,0.6),col="red",pch=16,cex=2)


#B)¿Cuál es la probabilidad de que el triunfo sea por un margen estrecho?
#Por ejemplo, que gane a lo más con 19 votos.

dbinom(16,n,p)+dbinom(17,n,p)+dbinom(18,n,p)+dbinom(19,n,p)

dbinom(16:19,n,p)   #Son las probabilidades individuales
sum(dbinom(16:19,n,p))
pbinom(19,n,p)-pbinom(15,n,p)

plot(votos1,prob1, xlab="N° de Casos Positivos",
     ylab="Probabilidad de Ocurrencia",ylim=c(0,0.16),
     main="Grafico 3: Probabilidad de Triunfo en
     Elecciones para la Lista A",sub="Fuente: Elaboración Propia",
     type="h")
points(votos1, prob1, pch=16,cex=1)

segments(x0=16,y0=0,x1=16,y1=dbinom(16,30,0.6),lwd=3,col="red")
points(16,dbinom(16,30,0.6),col="red",pch=16,cex=2)
segments(x0=17,y0=0,x1=17,y1=dbinom(17,30,0.6),lwd=3,col="red")
points(17,dbinom(17,30,0.6),col="red",pch=16,cex=2)
segments(x0=18,y0=0,x1=18,y1=dbinom(18,30,0.6),lwd=3,col="red")
points(18,dbinom(18,30,0.6),col="red",pch=16,cex=2)
segments(x0=19,y0=0,x1=19,y1=dbinom(19,30,0.6),lwd=3,col="red")
points(19,dbinom(19,30,0.6),col="red",pch=16,cex=2)

#####################################################################################

#Para v.a. continuas, los valores puntuales NO tienen sentidos (volver a la
#definición). Por lo tanto, el análisis se concentrará en intervalos de valores del 
#tipo [a,b], dónde a y b pertenecen a los Reales.

#La función de densidad de probabilidad (p.d.f.) de una v.a. continua cumple:

#1) f(x)>=0, para todo a=< x =< b
#           Inf
#2) Integral    f(x)dx=1
#          -Inf
#3) Para un intervalo tal que -Inf < a < b < Inf, se tiene que:

#                          b
# P(a =< x =< b) = Integral f(x)dx
#                          a

#Por lo tanto, se tiene que la función de densidad cumulativa (c.d.f) es:

#                      x
# P(X =< x) = Integral  f(x)dx
#                   -Inf

#Y mide la probabilidad de que la v.a. tome valores menores o iguales a x.

#Esto la lógica general, no es necesario (para este curso), la manipulación
#con integrales. Lo único relevante es la intución de la integral (el área 
#bajo la curva).

#Analizaremos el caso de la v.a. Normal o Gaussiana

#Es bastante utiliza en la modelación de fenómenos naturales y sociales.
#Tiene una forma acampanada y simétrica en torno a un parámetro (valor central).

#La p.d.f de una variable aleatoria X con distribución Normal (mu, sigma2) es
#de la forma: 

#                1                1       x-mu   2
# fx(x) = _______________ exp{ - ____ (_________)  },  con -Inf < x < Inf    
#        sqrt(2 pi sigma2)        2       sigma

#Con un parámetro de localización mu y un parámetro de forma tales que:

#  -Inf < mu < Inf ,        0 < sigma2 < Inf 

y<-seq(-4,4,0.1)
y
dnorm(y)
pnorm(y)
plot(y,dnorm(y),type="l")
plot(y,pnorm(y),type="l")


#En el trabajo 'en papel' se tiende a usar la forma estandarizada. 

#Un gráfico cualquier de Distribución Normal (ignorar valores)

plot(seq(-3,3,.1), dt(seq(-3,3,.1), df = 9),col = "powderblue", type = "l",
     main="Grafico 4: Distribucion Normal Estandarizada",lwd=4,ylim=c(0,0.45))
abline(v=0)
text(x=0,y=0.41,"Media")

plot(seq(-3.2,3.2,.1), dt(seq(-3.2,3.2,.1), df = 9),col = "powderblue", type = "l",
     main="Grafico 4: Distribucion Normal Estandarizada",lwd=4,ylim=c(0,0.45),
     xlim=c(-3.2,3.2),xaxt='n',yaxt='n')
segments(x0=0,y=0,x1=0,y1=0.39)
segments(x0=-1,y0=0,x1=-1,y1=0.23)
segments(x0= 1,y0=0,x1= 1,y1=0.23)
segments(x0=-2,y0=0,x1=-2,y1=0.06)
segments(x0= 2,y0=0,x1= 2,y1=0.06)
segments(x0=-3,y0=0,x1=-3,y1=0.01)
segments(x0= 3,y0=0,x1= 3,y1=0.01)
text(x=0,y=0.41,"Media")
text(x=-0.4,y=0.19,"0.34")
text(x= 0.4,y=0.19,"0.34")
text(x=-1.4,y=0.07,"0.135")
text(x= 1.4,y=0.07,"0.135")
text(x=-2.4,y=0.01,"0.024")
text(x= 2.4,y=0.01,"0.024")

#Simetría respecto a la media (también coincide con moda y mediana).
#Las observaciones se concentran en torno a la media: 68% a una desviación 
#estándar, 95 a 2 d.e. y 99.7 aprox. a 3 d.e.

#El comando dnorm asume como caso 'default' la forma estandarizada. 
#En caso contrario especificar los parámetros media (mean) y desviación
#estándar (sd), en ESE orden.

?dnorm
dnorm(1,mean=0,sd=1)
dnorm(1)

#EJERCICIO 3

#Se plantea que se puede modelar mediante una variable normal con media 52 y
#varianza 100 el autoposicionamiento de las personas en el eje izquierda-derecha.

#¿Cuál es la probabilidad de que tome valores entre 40 y 60

pnorm(60,mean=52,sd=10)-pnorm(40,mean=52,sd=10)

sucesos<-seq(from=1,to=100,by=1)
p1<-dnorm(sucesos,mean=52,sd=10)
plot(p1,col="powderblue",type="l",lwd=3,xlab="Índice de Ubicación",
     ylab="Probabilidad",main="Grafico 5: Auto-Posicionamiento de Individuos
     en el Eje Izquierda-Derecha",sub="Fuente:Elaboración Propia")

#Sea mayor a 50

1-pnorm(50,mean=52,sd=10)

#Sea menor que 40

pnorm(40,mean=52,sd=10)

#Sea menor que 40 o mayor que 60

pnorm(40,mean=52,sd=10)+(1-pnorm(60,mean=52,sd=10))

#La edad de un grupo de estudiantes puede ser descrito mediante una
#distribución normal con media 13.2 y desviación estándar 1.3
#Si un estudiante tiene 16 años ¿Qué porcentaje del grupo tiene una edad igual
#o mayor?

1-pnorm(16,mean=13.2,sd=1.3)

#Otro Ejercicio de Probabilidades

#Distribución Binomial

#1) Esta es la composición de la Comisión de Salud de la Cámara de Diputados (13 
#   miembros)

#Pdta:     Marisol Turres          (UDI)
#Miembros: Enrique Accorsi         (PPD)
#          Juan Luis Castro        (PS)
#          José Antonio Kast       (UDI)
#          Cristián Letelier       (UDI)  
#          Javier Macaya           (UDI)   
#          Nicolás Monckeberg      (RN)  
#          Manuel Monsalve         (PS)
#          Marco Antonio Nuñez     (PPD)
#          Karla Rubilar           (RN)  
#          Gabriel Silber          (DC)   
#          Víctor Torres           (DC)
#          Gastón von Mühlenbrock  (UDI) 

#Próximamente se votará un proyecto de Ley presentado por el ministerio de 
#Salud. El ministro le pregunta sobre la viabilidad del proyecto, buscando
#determinar con cuánto apoyo contará. El informe político le indica que es una
#temática que no divide ideológicamente a los congresistas ni tiene mayor relevancia
#pública, por lo que no votarán en bloque y evaluarán el proyecto en su mérito.
#Lo anterior redunda en que todos los congresos tienen la misma probabilidad de 
#aprobar el proyecto. 

#a)Si es una iniciativa técnica orientada a reglamentar ciertos procedimientos
#del procesamiento de alimentos, por lo que la probabilidad de apoyo es 0.5.
#Determine las probabilidades asociadas a cada resultado posible.

prob1<-dbinom(x=0:13,size=13,p=0.5)
prob1

#b)Si se reemplaza el proyecto por uno que implica distribución de recursos a los
#distritos de los congresistas, por lo que están inclinados en un 75% a apoyarla.

prob2<-dbinom(x=0:13,size=13,p=0.75)
prob2

#c)Si a la iniciativa original se le agrega una indicación que prohíbe toda la 
#comida chatarra, poco saludable, el alcohol y los dulces, lo que es muy 
#resistido por la ciudadanía, por lo que los congresistas sólo tienen un
#20% probabilidad de aprobarla.

prob3<-dbinom(x=0:13,size=13,p=0.2)
prob3

#c)Ahora grafique lo anterior para comparar los resultados

par(mfrow=c(1,3))

votos<-0:13
par(mfrow=c(1,3))
plot(votos,prob1,type="h",ylim=c(0,0.30),
     ylab="Probabilidad de Votación a Favor",
     main="Grafico 1: Probabilidad de
     Apoyo para el 
     Proyecto Original")
points(votos,prob1,pch=16,cex=1)

plot(votos,prob2,type="h",ylim=c(0,0.30),
     ylab="Probabilidad de Votación a Favor",
     main="Grafico 2: Probabilidad de
     Apoyo para el
     Proyecto Alternativo")
points(votos,prob2,pch=16,cex=1)

plot(votos,prob3,type="h",ylim=c(0,0.30),
     ylab="Probabilidad de Votación a Favor",
     main="Grafico 3: Probabilidad de
     Apoyo para el
     Proyecto Modificado")
points(votos,prob3,pch=16,cex=1)

#d)Para que la iniciativa sea aprobada se requiere mayoría simple, es decir 7
#diputados (asuma que son responsables y asisten todos a la votación).¿Cuáles
#son las posibilidades de que la iniciativa prospere?

1-pbinom(q=6,size=13,prob=0.5)
1-pbinom(q=6,size=13,prob=0.75)
1-pbinom(q=6,size=13,prob=0.2)

sum(dbinom(x=7:13,size=13,prob=0.5))
sum(dbinom(x=7:13,size=13,prob=0.75))
sum(dbinom(x=7:13,size=13,prob=0.2))


#Distribución Normal

#2)La investigación ha determinado que el tiempo de tramitación de las leyes en la
#Comisión de Salud de la Cámara toma una distribución normal, con una media de 24 
#meses y una desviación estándar de 10 meses. 

#a)Hace 2 años y medio (36) el gobierno introdujo un proyecto de ley sobre isapres 
#¿Cuál sera la probabilidad de que la tramitación de dicha ley fuera igual o mayor
# a dicho período?

#media=24 meses
#sd= 10

a<-(36-24)/10
a

b<-1-pnorm(q=a,mean=0,sd=1)
b
c<-pnorm(q=a,mean=0,sd=1)
c

plot(seq(-3,3,.1), dt(seq(-3,3,.1), df = 9),col = "powderblue", type = "l")
abline(v = c(c))
segments(x0= seq(c,3,.01), x1 = seq(c,3,.01), y0 = 0, 
         y1 = dt(seq(c,3,.01), df = 9), col = "powderblue")

segments(x0= seq(-3,c,.01), x1 = seq(-3,c,.01), y0 = 0, 
         y1 = dt(seq(-3,c,.01), df = 9), col = "red")


#b)La cercanía de las elecciones disminuirá el ritmo del trabajo legislativo, a tal 
#nivel de que resultará muy difícil aprobar la normativa posterior a Septiembre. 
#¿Cuál es la  probabilidad de que sea aprobada entre Mayo y Septiembre? (al terminar 
#Abril se cumplen los 36 meses).

a1<-(37-24)/10
a1
b1<-(41-24)/10
b1

pnorm(q=b1,mean=0,sd=1)-pnorm(q=a1,mean=0,sd=1)
plot(seq(-3,3,.1), dt(seq(-3,3,.1), df = 9),col = "powderblue", type = "l")
abline(v = c(a1,b1))
segments(x0= seq(a1,b1,.01), x1 = seq(a1,b1,.01), y0 = 0, 
         y1 = dt(seq(a1,b1,.01), df = 9), col = "blue")


#c)En vista de los problemas antes expuestos, se estudia la posibilidad de enviar una
#ley fast track que trate solo los temas urgentes. ¿Cuál es la probabilidad de que 
#sea aprobada en 6 meses?

f<-(6-24)/10.2
f

pnorm(q=f,mean=0,sd=1)

plot(seq(-3,3,.1), dt(seq(-3,3,.1), df = 9),col = "powderblue", type = "l")
abline(v = c(f))
segments(x0= seq(-3,f,.01), x1 = seq(-3,f,.01), y0 = 0, 
         y1 = dt(seq(-3,f,.01), df = 9), col = "powderblue")


#####################################################################################

#Test de Significancia Estadística

library(car)
library(MASS)

#El argumento general de un test es el siguiente:

# t.test(base.de.datos$variable, mu=0,alt="two-sided",conf.level=0.95)
#two-sided dos colas
#less      una cola, valores menores al parámetro (mu)
#greater   una cola, valores mayores al parámetro (mu)

#Lo importante ahora no es el cálculo, si no que los supuestos.

#Usaremos los datos de Anscombe.
#Son datos para los Estados de EEUU (1970) resumiendo información sobre
#el gasto per cápita en educación (USD), el ingreso per cápita (USD),
#la proporción de jóvenes (menores de 18 años) cada 1000 habitantes y
#la proporción de urbanización cada 1000 habitantes

head(Anscombe)
sum(Anscombe$education)
length(Anscombe$education)
10012/51
mean(Anscombe$education)
var(Anscombe$education)
sd(Anscombe$education)

t<-(sqrt(length(Anscombe$education))*mean(Anscombe$education))/sd(Anscombe$education)
t
t<1.671

prueba<-t.test(Anscombe$education, mu=0,alt="two.sided",conf.level=0.95)
prueba
names(prueba)
prueba$p.value<0.05

#Un caso de diferencia de medias

fix(Baumann)
names(Baumann)
summary(Baumann$group)

baumann<-subset(Baumann, group=="Basal"|group=="DRTA",select=c("group",
                                                               "pretest.1","post.test.1"))

t.test(pretest.1~group,data=baumann)

a<-t.test(post.test.1~group,data=baumann)
names(a)
a$p.value<0.05

#LABORATORIO N° 4: TEST DE HIPÓTESIS


#Inferencia Estadística

?t.test

#Dócima de Hipótesis sobre una Población.

#3)El consumo energético diario (en Kj) para 11 mujeres que presentan una 
#cierta enfermedad.

consumo<-c(5260,5470,5640,6180,6390,6515,6805,7515,7515,8230,8770)

#La investigación nutricional recomienda un consumo calórico de 7725 kJ, pudiendo
#ser esta una de las causas de su enfermedad. ¿Se desvía de manera sistemática
#el consumo calórico de las pacientes? Asuma distribución normal.

#a)Plantee las hipótesis nula y alternativa

#R:
#H0: el consumo energético diario medio de las mujeres enfermas es 7725 kJ.
#HA: el consumo energético diario medio de las mujeres enfermas se desvía de manera
sistemática del consumo recomendado de 7725 kJ.

#b)Responda la pregunta e interprete los resultados

#R:
t.test(consumo,mu=7725)

#c)Interprete

#R:
#Con un 95% de confianza se puede afirmar que el consumo energético diario de las mujeres
#enfermas se desvía sistemáticamente del recomendado. 


#4)Se maneja la siguiente información sobre el consumo de marihuana entre niños, 
#recolectados por el Archivo de Abuso de Sustancia y Salud Mental. La variable marijuana
indica si un individuo ha probado la marihuana(1=si, 2=no). Si previamente el 50% de 
#la población ha probado la marihuana, ¿indican los datos un incremento en su consumo? 

encuestados<-c(rep("Sí",309),rep("No",281))

#a)Plantee los resultados en una tabla

#R:
table(encuestados)

#b)Determine las hipótesis

H0:p=0.5
HA:p>0.5

#c) Realice el cálculo

x = 309; n = 309+281
prop.test(x,n,p=.5,alt="greater")

#Interprete

#R:
#No es estadísticamente significativo.


#Dócimas de Hipótesis Independientes

#5)La base de datos energy contiene información que asocia el consumo calórico con una
#categorización de mujeres entre delgadas y obesas.

install.packages("ISwR")
library(ISwR)
data(energy)
head(energy)

#Determine hipótesis nula y alternativa, realice el cálculo asumiendo que las varianzas
#de las poblaciones son distintas (test de Welch) y que son idénticas. Interprete

t.test(expend~stature,data=energy)

#El operador de tilde especifica que el consumo es descrito por la estatura.

#El intervalo de confianza para la diferencia en las medias no contiene el cero, lo que
#va en línea con el valor p, indicando diferencias significativas a un nivel del 5%.

#El test de Welch es el calculado por default, donde no se asume que la varianza sea
#igual en los dos grupos. Para asumir lo anterior, debe especificarse en un comando
#opcional

t.test(expend~stature, var.equal=T,data=energy)

#Los resultados varían mínimamente, pero las conclusiones se sostienen.


#6)Contiene info sobre los efectos de los regímenes de castigo en las tasas de 
#criminalidad en 47 estados norteamericanos en 1960. Las variables de resultado son
#Prob (probabilidad de encarcelamiento), U1 (tasa de desdempleo para hombres urbanos
#entre 14 y 24 años), U2 (lo mismo para un rango entre 35 y 39). La variable So
#es categórica y permite generar grupos, indicando si es o no un Estado sureño.

library(MASS)
data(UScrime)

#Visualiza la base de datos (siempre es relevante un análisis previo).

fix(UScrime)

#a)¿Es más probable ser encarcelado si se comete un crimen en un Estado sureño? 
#Explicite los supuestos relevantes.

#R:
#Los dos grupos en cuestión (E° sureño, no-sureño) son independientes y que los
#datos son una muestra extraída de una población que se distribuye normalmente 
#(o que puede ajustarse a ésta).

#b)Plantea las hipótesis nula y alternativa:

#H0: No dif
#HA: si dif

#c)Realiza el cálculo en sí

#R:
t.test(Prob~So,data=UScrime)

#c)Interpreta los resultados

#R: 
#Se puede rechazar la hipótesis nula (preguntar por el nivel de significancia).
#NO importa el hecho de que las variables de interés sean proporciones.


#Dócimas de Hipótesis Dependientes

#7)¿Es la tasa de desempleo para hombres jóvenes (14-24) mayor que para los
#hombres adultos(35-39)?

#a) Cómo son los grupos entre sí

#R: 
#Los grupos son dependientes entre sí.Claramente las tasas de desempleo estarán
#relacionadas.

#b) Plantea las hipótesis nula y alternativa y el supuesto de distribución:

#R:
#La diferencia entre los grupos se distribuye normalmente:

#H0: son iguales
#HA: son distintas

t.test(UScrime$U1,UScrime$U2,paired=T)

#¿Y que pasa si no usamos paired?

t.test(UScrime$U1,UScrime$U2)

#8)La base de datos contiene el consumo calórico antes y después de someterse a una
#terapia innovadora que busca acelerar el metabolismo

#Plantee las hipótesis, calcule e interprete.

data(intake)
intake

t.test(intake$pre, intake$post, paired=T)

#9) Se desea determinar si el apoyo a la "mano dura" es dependiente del género

#a)Plantee las hipótesis.
#b)Realice el test de hipótesis

#R:
setwd("C:/Users/Benjamin/Documents/Laboratorio R")
load("LAPOP.2010.RData")

ls()
lapop<-LAPOP.2010

base<-subset(lapop,q1!=""&dem11!="")
base<-droplevels(base)
tabla<-table(base$q1,base$dem11)
tabla

ji2<-chisq.test(tabla)
ji2


#10) Usando los datos de LAPOP, existe alguna relación entre Género y la
# Necesidad de tener un Líder electo.

#R:
table(lapop$q1,lapop$aut1)
base1<-subset(lapop,aut1!=""&q1!="")
base1<-droplevels(base1)
tabla1<-table(base1$q1,base1$aut1)
tabla1
chi2<-chisq.test(tabla1)
chi2



#Test de Significancia Estadística

#El argumento general de un test es el siguiente:

# t.test(base.de.datos$variable, mu=0,alt="two-sided",conf.level=0.95)
#two-sided dos colas
#less      una cola, valores menores al parámetro (mu)
#greater   una cola, valores mayores al parámetro (mu)

#Lo importante ahora no es el cálculo, si no que los supuestos.

#Usaremos los datos de Anscombe.
#Son datos para los Estados de EEUU (1970) resumiendo información sobre
#el gasto per cápita en educación (USD), el ingreso per cápita (USD),
#la proporción de jóvenes (menores de 18 años) cada 1000 habitantes y
#la proporción de urbanización cada 1000 habitantes

head(Anscombe)

sum(Anscombe$education)
length(Anscombe$education)
10012/51
mean(Anscombe$education)
var(Anscombe$education)
sd(Anscombe$education)
t<-(sqrt(length(Anscombe$education))*mean(Anscombe$education))/sd(Anscombe$education)
t
t<1.671

prueba<-t.test(Anscombe$education, mu=0,alt="two.sided",conf.level=0.95)
prueba
names(prueba)
prueba$p.value<0.05


df<-length(Anscombe$education)-1
df
#Prueba de Diferencia de Medias.

head(Bfox)



#Prueba de Significancia para observaciones pareadas.
#Ahora analizaremos el caso de observaciones pareadas.
#Aquí lo central es especificar paired=T.

head(AMSsurvey)

##############################################################################

load("pdciales99.RData")


library(car)
qqPlot(pdciales99$votoc)
qqPlot(pdciales99$votoc2)
qqPlot(pdciales99$votoinv)
shapiro.test(pdciales99$votoc)
shapiro.test(pdciales99$votoc2)
shapiro.test(pdciales99$votoinv)

pdciales99$porcvoto<-pdciales99$votoc/pdciales99$votov*100
pdciales99$porcinv<-pdciales99$votoinv/pdciales99$votot*100
pdciales99$porcvoto1<-pdciales99$votoc2/pdciales99$votov2*100

qqPlot(pdciales99$porcvoto)
qqPlot(pdciales99$porcvoto1)
qqPlot(pdciales99$porcinv)
shapiro.test(pdciales99$porcvoto)
shapiro.test(pdciales99$porcvoto1)
shapiro.test(pdciales99$porcinv)

jlavin<-subset(pdciales99,nombrec=="Joaquin Lavin Infante")
rlagos<-subset(pdciales99,nombrec=="Ricardo Lagos Escobar")

###############################################################################

t1<-t.test(jlavin$porcvoto)
t2<-t.test(rlagos$porcvoto)

names(t1)
puntos<-c(t1$estimate,t2$estimate)
sup<-c(t1$conf.int[2],t2$conf.int[2])
inf<-c(t1$conf.int[1],t2$conf.int[1])
plot(puntos,ylim=c(45,52),xlim=c(0.5,2.5),pch=20,cex=2)
points(sup,pch=25)
points(inf,pch=24)
segments(x0=1,y0=t1$conf.int[1],x1=1,y1=t1$conf.int[2],lty=5)
segments(x0=2,y0=t2$conf.int[1],x1=2,y1=t2$conf.int[2],lty=5)

t3<-t.test(pdciales99$porcvoto1~pdciales99$nombrec,var.equal=F)
names(t3)
t3$estimate[1]
puntos1<-c(t3$estimate[1]-t3$estimate[2])
sup1<-c(t3$conf.int[2])
inf1<-c(t3$conf.int[1])
plot(puntos1,ylim=c(-5,5),xlim=c(0.8,1.2),pch=20,cex=2)
points(sup1,pch=25)
points(inf1,pch=24)
segments(x0=1,y0=sup1,x1=1,y1=inf1,lty=5)
abline(h=0,lty=2,lwd=2)

###############################################################################
###############################################################################
#LABORATORIO ¿5?: INTRODUCCIÓN A LA REGRESIÓN

#La regresión es uno de los principales instrumentales estadísticos de las 
#ciencias sociales. Es un concepto que siempre va anclado a un "apellido" que
#especifica el tipo utilizado (lineal simple, lineal múltiple, polinomial,
#multivariada, logística, Poisson, serie de tiempo, no lineal, no paramétrica,
#robusta, etc.)

#En el curso, trabajaremos con las dos primeras.

#R. Lineal Simple: busca predecir una variable cuantitativa de respuesta en
#(Bivariada)       base a una variable cuantitativa explicativa.


#Es importante destacar:

#Trabajaremos con datos de CORTE TRANSVERSAL.
#Trabajaremos, por el momento, con variables CUANTITATIVAS (numéricas continuas
#o discretas).
#La estimación se realizará mediante MÍNIMOS CUADRADOS ORDINARIOS (MCO).

#Lo que se busca es EXPLICAR la V.D en TÉRMINOS de la V.I.

#VD: v. explicada o regresando.
#VI: v. explicativa o regresor.

#El modelo de regresión lineal simple: 

#              y=ß0+ß1 x+u 

#Incluye además un:

#Intercepto (parámetro).
#Término de Error o perturbación.

#FORMA FUNCIONAL: LINEALIDAD: un cambio de 1 en x implica siempre el mismo
#efecto sobre y, sin importar los valores iniciales.
#El término de ERRROR incluye todos los otros factores que pueden tener 
#impacto sobre y (se consideran constantes). 


#EJEMPLO DE LABORATORIO

#Utilizaremos la base de datos Tolerancia.Contiene las siguientes variables:

#años.educacion      número de años de escolaridad de los encuestados.
#indice.tolerancia   indice que mide la tolerancia política de los encuestados.
#                    Se transformó en un rango de 0 a 20.                      

setwd("C:/Users/Benjamin/Documents/Laboratorio R")
load("Tolerancia.RData")
names(tolerancia)

summary(tolerancia)
fix(tolerancia)

#Analizaremos la relación entre los años de escolaridad y los niveles de
#tolerancia política. ¿Cómo es la relación entre ambas?

plot(tolerancia$años.educacion,tolerancia$indice.tolerancia,pch=19,
     xlim=c(0,21),ylim=c(0,21),xlab="Años de Escolaridad",
     ylab="Índice de Tolerancia Política",sub="Fuente: Elaboración Propia (2013)",
     main="Gráfico 1: Relación entre la 
     Escolaridad y la Tolerancia Política")

#El comando que deben utilizar al momento de calcular regresiones lineales
#es lm():  LINEAR MODEL.
#Existen dos alternativas: realizar el cálculo únicamente o construir un
#objeto. Sigan este segundo camino.

#Al interior de lm() deben especificar:

#V.D.
#V.I.(s)
#Forma Funcional con que ingresan los regresores en la relación.

#El símbolo '~' separa la V.D de las V.I.(s).

lm(indice.tolerancia~1+años.educacion,data=tolerancia)

#Los datos utilizados pueden especificarse mediante '$' o simplemente mediante
#data=nombre.base.de.datos

#Les recomiendo agregar un 1 antes de ingresar las variables dependientes,
#especificando así el intercepto. NO es necesario incluirlo: 

lm(indice.tolerancia~años.educacion,data=tolerancia)


#Tiene utilidad incluirlo por:

#A) Razones Teóricas: R realiza la estimación del modelo mediante matrices. 
#   Al calcular una regresión "manualmente" se requiere un vector de 1 previo
#   a las V.I.(s).

#B) Razones Prácticas: Les recuerda que el intercepto es fácilmente eliminable
#   en una regresión.

lm(indice.tolerancia~-1+años.educacion,data=tolerancia) #¿A qué corresponde 
#esto? Tip: Wooldridge

#Tal como mencioné anteriormente, es mejor almacenarla mediante un objeto.

modelo1<-lm(indice.tolerancia~1+años.educacion,data=tolerancia)

modelo1              #Genera los mismos resultados previos.
summary(modelo1)     #Entrega una mayor cantidad de información.


#¿Qué elementos están contenidos al interior de mi objeto?

names(modelo1)

#Coeficientes del Modelo

coefficients(modelo1)

#Por lo tanto, mi modelo de regresión lineal bivariada es 

#    indice.tolerancia=3.1278693+0.8967047*años.educacion

coefficients(modelo1)[1]
coefficients(modelo1)[2]

coefficients(modelo1)["(Intercept)"]

#Valores "Ajustados" (Predichos)

#Los valores de la V.D. que son predichos por el modelo ajustado al conjunto
#de datos observados. 

modelo1$fitted.values

#Residuos

#Valores Observados- Valores Ajustados

modelo1$residuals

#Contrastemos lo anterior con la base de datos.
fix(tolerancia)

#El primer valor observado es  6
#El primer valor predicho  es  6.714688
#El residual es               -0.714688

#Intervalos de Confianza ¿Qué son?

confint(modelo1)

#Sumemos el cuadrado de los residuos ¿Para qué?

#Suma Total Cuadrados        STC
#Suma Explicada de Cuadrados SEC
#Suma Residual de Cuadrados  SRC


SEC<-sum((modelo1$fitted.values-mean(modelo1$fitted.values))^2)

STC<-sum((tolerancia$indice.tolerancia-mean(modelo1$fitted.values))^2)

SRC<-sum((modelo1$residuals)^2)

R.2<-SEC/STC
R.2

r.2<-(1-SRC/STC)
r.2

summary(modelo1)

#Determinemos los Principales estadísticos de interés

summary(modelo1)
resultados1 <- summary(modelo1) #Permite extraer una mayor gama de elementos

names(modelo1)
names(resultados1)

#Por ejemplo, los errores estándares se pueden extraer desde resultados1 pero 
#no desde modelo1

modelo1$coef[,2]
resultados1$coef[,2]

#Ahora bien, en términos gráficos ¿qué es una regresión lineal bivariada?

plot(tolerancia$años.educacion,tolerancia$indice.tolerancia,pch=19,
     xlim=c(0,21),ylim=c(0,21),xlab="Años de Escolaridad",
     ylab="Índice de Tolerancia Política",sub="Fuente: Elaboración Propia (2013)",
     main="Gráfico 1: Relación entre la 
     Escolaridad y la Tolerancia Política")
abline(modelo1,col="darkred")

#Agreguemos las líneas de residuales en el gráfico:

segments(x0=tolerancia$años.educacion, x1=tolerancia$años.educacion,
         y0=tolerancia$indice.tolerancia,y1=modelo1$fitted, col="red")



#EJERCICIO EN CLASES

#Steven Fish analiza, en su artículo 'Islam and Authoritarianism', si las 
#sociedades musulmanas son desaventajadas en términos de democratización.
#Analiza si dichas sociedades tienen empíricamente un déficit democrático.

#Tomaremos como variable dependiente un índice de democracia. En vista de que
#Fish asume una definición dahliana, utilizar Freedom House adquiere utilidad.

#Los datos de Freedom House fueron reversados por mayor simpleza (en vez de
#1=Más Libre, ahora será 7).

#Testeen las siguientes hipótesis:

#Las sociedades predominantemente islámicas son menos democráticas.
#Teoría de la Modernización.
#Divisiones Socioculturales: Heterogeneidad y Efectos Desestabilizadores de la
#Segmentación.
#Desempeño económico en el corto plazo
#Desempeño económico teniendo un efecto marginal.
#Herencia colonial Británica (+)
#Cultura Política y Legado comunista
#"Maldición de los Recursos Naturales": Autoritarismo y Petróleo

names(fish)
crec<-fish$growth
crec2<-((fish$growth)^2)
plot(fish$growth,fish$fhrev)
plot(crec2,fish$fhrev)



setwd("C:/Users/Benjamin/Documents/Laboratorio R")
load("Islam.Authoritarianism.RData")
ls()

fix(fish.data)
names(fish.data)
fish<-fish.data

a<-lm(fhrev~1+muslim,data=fish)
summary(a)

b<-lm(fhrev~1+log(income),data=fish)
summary(b)

c<-lm(fhrev~1+elf,data=fish)
summary(c)

c1<-lm(fhrev~1+10*(elf),data=fish)

d1<-lm(fhrev~1+income^2,data=fish)
summary(d1)

plot(fish$fhrev,log(fish$income))

plot(fish$fhrev,(fish$income^2))

###############################################################################
LABORATORIO: REGRESIÓN MÚLTIPLE EN R


#Cargar los Datos de Fish correspondientes a su trabajo "Islam and 
#Authoritarianism".
ls()
names(fish.data)
fix(fish.data)

#1) Estime un modelo completamente especificado (que incluye todas las variables
#independientes incluidas).

modelo1a<-lm(fhrev~1+muslim+income+elf+growth+opec,
             data=fish.data)
summary(modelo1a)

#2) Interprete los resultados obtenidos: regresores y bondad de ajuste.
#3) ¿Tienen concordancia con la teoría? ¿Tienen lógica?
#4) ¿Qué posible explicación puede tener el intercepto?
#5) Analizar el cumplimiento de los supuestos del modelo estimado por MCO.

#A) Linealidad

#Para las variables binarias (muslim y opec) no es relevante,ya que siempre 
#pueden modelarse linearmente (toman 2 valores, siempre hay una recta).

library(car)
crPlots(modelo1a)

plot(fish.data$fhrev~fish.data$income,
     main="Gráfico 1: Relación entre FH
     e Ingreso del País (Bruto)",
     xlab="PIB en miles de USD")
abline(lm(fhrev~1+income,data=fish.data))

plot(fish.data$fhrev~fish.data$elf)
abline(lm(fhrev~1+elf,data=fish.data))

plot(fish.data$fhrev~fish.data$growth)
abline(lm(fhrev~1+growth,data=fish.data))

#B) No Colinealidad Perfecta

attach(fish.data)

cor(muslim,income)
cor(muslim,elf)
cor(muslim,growth)
cor(muslim,opec)

cor(income,elf)
cor(income,growth)
cor(income,opec)

cor(elf,growth)
cor(elf,opec)

cor(growth,opec)

#C) Media Condicional Cero

plot(modelo1a$residuals,ylim=c(-4,4))
abline(h=0)
mean(modelo1a$residuals)

#D) Homocedasticidad

#Sí tiene relevancia analítica con las variables dummy, pero tiene complejidad
#hacerlo, ignorarlas.

plot(modelo1a$residuals~fish.data$income)
plot(modelo1a$residuals~fish.data$elf)
plot(modelo1a$residuals~fish.data$growth)

residualPlots(modelo1a,~1)
spreadLevelPlot(modelo1a)
ncvTest(modelo1a)

#6) Analizar la Normalidad

qqPlot(modelo1a$residuals)
library(lattice)
densityplot(rstudent(modelo1a))  

#7) ¿Qué correcciones pueden resultar relevantes? ¿Qué pasa con la 
#forma funcional especificada en el modelo?

modelo1b<-lm(fhrev~1+muslim+log(income)+elf+growth++opec,
             data=fish.data)
summary(modelo1b)

#8) Analizar los supuestos: el problema es linealidad

scatterplot(fish.data$fhrev~fish.data$income)

plot(fish.data$fhrev~log(fish.data$income),
     main="Gráfico 2:Relación entre FH
     y el Ingreso (logaritmo)",
     xlab="Logaritmo del PIB")
abline(lm(fhrev~1+log(income),data=fish.data))

#9) Interpretar los coeficientes.
#10) Calcular los intervalos de confianza para cada intervalo.

names(modelo1b)
modelo1b$coefficients
summary(modelo1b)
0.27239+1.96*0.66711
0.27239-1.96*0.66711
confint(modelo1b)

#11) Si alcanza el tiempo se puede avanzar a selección de variables y a 
#Análisis de Varianza. 

###############################################################################
#Primero que TODO: Normalidad

#La Normalidad de los residuos no es un supuesto MCO, es un supuesto MLC.No se
#necesita para realizar la estimación ni para que tenga propiedades deseables
#como estimador. Se necesita para la Inferencia Estadística, ya que ésta 
#requiere conocer toda la distribución muestral de los coeficientes estimados.
#Con este fin se asume que el error no observado (población) está distribuido
#normalmente (y es independiente)

#Esto permite obtener distribuciones de muestreo exactas de los estimadores MCO 
#(condicionales en las VI). De ahí se deriva el estadístico t y F (con sus
#distribuciones t y F exactas). Si no se cumple normalidad, no es tan grave.
#En muestras grandes, la distribución se aproxima a la Normal (TLC) por las
#propiedades asintóticas del estimador.

library(lmtest)
library(car)

getwd()
setwd("C:/Users/Benjamin/Documents/Laboratorio R")

#PRUEBA DE HIPÓTESIS SOBRE UN ÚNICO PARÁMETRO POBLACIONAL (T TEST)

#La Hipótesis Nula corresponde a plantear que es igual a cierta constante.

#¿Cómo calcular el estadístico t? 

#La Fórmula de dicho estadígrafo es:

# t=  (estimación del parámetro - constante)/(error estándar de la estimación)

#Claro está, cuando se testea que el parámetro estimado difiere, de manera
#estadísticamente distinguible del cero, esta fórmula se simplifica. Es así 
#que para este caso tenemos:

#1)Al estimar un modelo, autómaticamente se calcula. Tercera columna.
#2)Calcular directamente, dividiendo la estimación del parámetro por su
#  error estándar (primera columna y segunda columna respectivamente). R
#  utiliza menos decimales. 

#La idea, al igual que siempre, es acumular "la mayor cantidad de información"
#posible en contra de H0 (a favor de H1). Si tomamos valores-p, menores valores
#corresponden a una mayor evidencia en contra de la hipótesis nula.

#Sin embargo, trabajaremos con regiones críticas (y de manera manual).

#¿El estadístico t es dependiente de la forma funcional del modelo? 
#Discutir en torno a la inclusión de variables y la especificación.

#Lo Primero es calcular el área considerada de la distribución correspondiente
#al percentil de interés. Lo llamaremos p.

#1 COLA: 1- NIVEL DE SIGNIFICANCIA

# 00.5%     0.005     0.995
# 01.0%     0.010     0.990
# 02.5%     0.025     0.975
# 05.0%     0.050     0.950
# 10.0%     0.100     0.900 

#2 COLAS: 1- (NIVEL DE SIGNIFICANCIA)/2

# 01.0%     0.010     0.995
# 02.0%     0.020     0.990
# 05.0%     0.050     0.975
# 10.0%     0.100     0.950 
# 20.0%     0.200     0.900

#GRADOS DE LIBETAD: N-K-1. K son los regresores estimados. Lo llamaremos df.

#Se toman ambos valores y se ingresan a la función que genera los valores críticos
#correspondientes a la distribución t.

# qt( p, df)

#No olvidar las propiedades asintóticas: en muestras grandes se puede aproximar
#mediante una Normal.

#La regla de rechazo depende de la hipótesis alternativa:

#1) Beta >  0   =>     t  >  c
#2) Beta <  0   =>     t  < -c
#3) Beta != 0   =>    |t| >  c

#Entonces lo que deben hacer es contrastar el estadístico t con la región
#crítica.

#     t value  >  qt(p, df) en el primer caso.
#     t value  < -qt(p, df) en el segundo caso.
# abs(t value) >  qt(p, df) en el tercer caso.

#En (1) estadísticos t negativos no aportan evidencia a favor de H1.
#En (2) estadísticos t positivos no aportan evidencia a favor de H1.
#En (3) el signo del estadístico t no tiene relevancia.

#La hipótesis alternativa se determina según:

#A) La Teoría.
#B) El "Sentido Común" o Lógica.
#C) Ciertamente la "confianza" en los resultados. 

#El cálculo de la región crítica NO depende del estadístico t. 

#El cálculo del valor p no es algo complicado. La idea es calcular el área de 
#la función de densidad  (probabilidad). Se utiliza la siguiente expresión para
#el caso de dos colas:

# 2*pt( - abs(t value), df)

#Para el caso de una sola cola (sea cual sea la hipótesis alternativa), la
#expresión es:

# pt( - abs(t value), df)

#¿Se acepta la Hipótesis Nula? ¿No es posible rechazarla a cierto nivel de
#significancia?

#INTERVALO DE CONFIANZA

#La construcción de un intervalo de confianza sólo requiere modificar el
#siguiente comando:

intervalo<-c(estimate-(qt(p,df)*std.error,estimate+(qt(p,df)*std.error))
             
             #Esto resalta que la interpretación de un test de un único parámetro poblacional
             #es idéntica a la de un intervalo de confianza (el caso más simple es respecto
             #a una H0 de efecto nulo tras controlar por otras variables). Otra ventaja
             #es remarcar que se trabaja respecto al valor del parámetro poblacional (valor
             #verdadero, fijo y desconocido). 
             
             #En R se logran resultados prácticamente idénticos con el comando confint:
             
             confint(modelo,parámetros.utilizados=1,2,...,n (Opcional), 
                     nivel.significancia=entre 0 y 1 (0.95 default)).
             
             #También se puede aplicar, si es posible una aproximación normal:
             
             intervalo<-c(estimate-1.96*std.error,estimate+1.96*std.error)
             
             #Para generar un intervalo de confianza del 95% (se modifica el valor).
             
             #PRUEBA DE HIPÓTESIS SOBRE UNA ÚNICA COMBINACIÓN LINEAL DE PARÁMETROS POBLACIONES
             
             #Corresponde a situaciones en que se testea un único par de hipótesis (H0 y HA),
             #pero aludiendo a los valores de dos parámetros poblacionales. Las versiones 
             #más básicas de este tipo de dócimas de hipótesis deberían ser:
             
             # Betai = Betaj
             
             #Con una cola tendríamos como HA una de las dos:
             
             # Betai > Betaj
             # Betai < Betaj
             
             #Para dos colas tendríamos:
             
             # Betai != Betaj
             
             #Lo primero es reescribir las hipótesis :
             
             # Betai- Betaj = 0
             
             # Betai- Betaj >  0
             # Betai- Betaj <  0
             # Betai- Betaj != 0
             
             #Por lo tanto, lo que se busca es acumular evidencia respecto a que la diferencia
             #entre los valores estimados entregue la suficiente evidencia para poder
             #rechazar H0. 
             
             #La fórmula del estadístico no es tan fácil de calcular:
             
             t=  [ Betai - Beta j ]
             ______________________
             
             s.e.(Betai - Betaj)
             
             =   [ Betai - Beta j ]
             ______________________
             
             {[error.estándar(Betai)]^2 +[error.estándar[Betaj)]^2- 
                                            2 covarianza(Betai,Betaj)}^1/2
             
             #En http://journal.r-project.org/accepted/2012-02/Fox+Friendly+Weisberg.pdf
             #aparece el siguiente comando:
             
             linear.hypothesis(modelo,especificación.de.hipótesis.nula/s)
             
             #También funciona:
             
             linearHypothesis(modelo,especificación.de.hipótesis.nula/s)
             
             #Sirve también para testear varias a la vez. Siempre entre comillas.
             #No he descubierto aún como manipular para que sea de una sola cola (ejemplo
             #de Wooldridge). 
             
             #Especificar nuevo parámetro que sea la diferencia entre Betai y Betaj.
             #Testear si éste es estadísticamente distinto del cero. 
             
             #Hacerlo según Wooldridge:
             
             #1) Estimar "manualmente" el modelo original.
             #2) Generar una nueva variable que sea la suma de Variablei y Variablej.
             
             # nueva.variable<-base$variablei+base$variablej
             
             # nueva.base<-data.frame(base,nueva.variable)
             
             #3) Estimar un nuevo modelo reemplazando Betaj por la nueva variable.
             #4) Seguir el procedimiento estándar, presentado anteriormente. 
             
             #Los parámetros poblacionales "no involucrados" son idénticos en ambos casos.  
             
             #PRUEBA DE HIPÓTESIS SOBRE RESTRICCIONES LINEALES MÚLTIPLES (TEST F).
             
             #Permite analizar hipótesis respecto los parámetros poblaciones subyacentes de
             #manera grupal.
             
             #Testeo de Restricciones de Exclusión
             
             #¿Es posible excluir un grupo de variables? Existen múltiples razones por las 
             #cuales esto podría pasar (teoría, teoría y blaadfksdj). Wooldridge trata
             #la hipótesis de que un grupo de variables no tiene impacto sobre el regresando,
             #tras controlar por las restantes (no incluidas en el subconjunto pero sí forman
             #parte del modelo).
             
             #H0: Betai=0 , Betaj=0, .... , Betak=0
             
             #Es lo que se conoce como k restricciones de exclusión. En caso de que la 
             #evidencia no permita rechazar H0, se concluye que dichos parámetros no son
             #relevantes al momento de explicar la variable de interés (no tienen impacto
             #después de controlar por las otras) por lo que podrían ser excluidas. 
             
             #Aquí la hipótesis tiene un carácter múltiple o conjunta.
             
             #La manera de especificar la HA es indicar que ésta no se cumple ("no es cierta").
             #Es decir, basta con que para una de las variables no se cumpla para que ya
             #no sea válida la hipótesis nula.
             
             #NO es lo mismo que testear para cada parámetro de manera individual. Lo que
             #se evalúa es el subconjunto.
             
             #Hay que especificar dos modelos: el original y el restringido (sin las
             #variables del subconjunto). Luego comparar los SSR
             
             sum((modelo.original$residuals)^2)
             sum((modelo.restringido$residuals)^2)
             
             #El Estadístico F se calcula como
             
             F=  (SSR.m.restringido-SSR.m.original)/(df.m.restringido-df.m.original)
             ______________________________________________________________________
             
             SSR.m.original/( n-k-1)
             
             
             # df.m.restringido-df.m.original= q
             # n-k-1 = df.m.original
             
             #Por lo tanto, F equivale a:
             
             F= [(SSR.r-SSR.nr)/(SSR.nr)] * [(n-k-1)/q]
             
             #Otra alernativa es:
             
             F=   (R^2.nr-R^2.r)       ( q )
             ______________   *  _______ 
             
             (1- R^2.nr)         (n-k-1)
             
             
             #Recordar que SSR sólo puede mantenerse constante o crecer con aumento de 
             #variables. 
             
             #Mucho más fácil usar anova(). En clases vimos tb. aov. Cuidado con usar Anova(),
             #genera otra cosa.
             
             anova(modelo.original,modelo.restringido)
             
             #No importa el orden, sólo cambia el Df Sum y el Sum of Sq., pero el estadístico
             #siempre es positivo y la probabilidad también lo es.
             
             #La región crítica se calcula del siguiente modo:
             
             #   qf(p, q, (n-k-1) )
             
             #Luego se compara F con dicho valor.
             
             # F > qf (p, q, (n-k-1))   #Siempre es de una cola (por la especificación de H0).
             
             #Distribución F está sesgada.
             #A valores muy altos de (n-k-1) se vuelve insensible a estos (ya no afectan).
             
             #Normalmente q será mucho más pequeño que (n-k-1). Si este último es pequeño
             #probablemente no funcionarán.
             
             #Rechazo H0 implica que los parámetros poblacionales del subconjunto de manera
             #conjunta son estadísticamente significativas. En caso que no sea posible rechazar
             #son conjunta insignificantes. Esto puede dar pie a su exclusión del modelo.
             
             #No hay una relación directa (1 a 1) entre significancia estadística individual y
             #significancia conjunta. 
             
             #El cálculo del valor sigue, supongo, la siguiente fórmula:
             
             # pf( - abs(estadístico F), q , (n-k-1) )
             
             
             #Utilidad mayor del test F es con variables altamente correlacionadas (en el
             #límite no identificación).
             
             #Test F de un subconjunto de una variable = (Test t de esa misma variable)^2
             
             #Ventajas en flexibilidad del t test para hipótesis individuales.
             
             #En el summary() de un modelo se incluye un test F que corresponde a contrastar
             #un modelo que únicamente considera el intercepto en la explicación del 
             #regresando con el modelo especificado. Es así que se obtiene la significancia
             #global del modelo.
             
             #Para el testeo de hipótesis múltiples más conjuntas no he encontrado algún
             #comando. No puede usarse anova ya que exige redefinir la variable dependiente
             #en el modelo restringido:
             
             #Si se testea que uno de los parámetros tiene un valor de 1, se debe plantear
             #un modelo en que y sea restado con dicho parámetro. Luego se estima dicho
             #modelo sólo con intercepto.
             
             #Luego se construye el F
             
             F= [(SSR.r-SSR.nr)/SSR.nr]*[(n-k-1)/q]
             
             
             ################################################################################
             
             load("HousePrice1.RData")
             ls()
             
             names(house.price.data)
             
             m1<-lm(log(price)~1+log(assess)+log(lotsize)+log(sqrft)+bdrms,
                    house.price.data)
             summary(m1)
             
             get<-log(house.price.data$price)-log(house.price.data$assess)
             hous<-data.frame(house.price.data,get)
             
             m2<-lm(get~1,data=hous)
             summary(m2)
             
             a1<-sum((m1$residuals)^2)
             a2<-sum((m2$residuals)^2)
             a1
             a2
             83
             87
             
             F1<-((a2-a1)/a1)*(83/4)
             F1
             
             F1>
               qf(0.95,4,83)
             
             ?qfF>qf(p, df1, df2)
             
             F>qf(0.95,3,60)
             
             
             
             
             pf( - abs(117.1),5,347)
             
             
             mlb1<-read.dta("C:/Users/Benjamin/Documents/Laboratorio R/MLB1.dta")
             
             mlb1<-read.table(file.choose(),header=T,sep="\t")
             fix(mlb1)
             
             names(mlb1)
             
             m2<-lm(log(salary)~1+years.+gamesyr+bavg+hrunsyr+rbisyr,data=mlb1)
             summary(m2)
             m4<-lm(log(salary)~1,data=mlb1)
             summary(m4)
             anova(m2,m4)
             
             names(m2)
             a<-sum((m2$residuals)^2)
             b<-sum((m3$residuals)^2)
             a
             b
             347
             350
             F<-((b-a)/(a))*(347/3)
             F
             
             m3<-lm(log(salary)~1+years.+gamesyr,data=mlb1)
             summary(m3)
             
             anova(m2,m3)
             
             
             md<-lm(lwage~1+jc+univ+exper,data=two)
             summary(md)
             alea<-two$jc+two$univ
             two1<-data.frame(two,alea)
             fix(two1)
             
             md1<-lm(lwage~1+jc+alea+exper,data=two1)
             summary(md1)
             
             -0.0102/0.0069
             
             pt( - abs(-1.48), 6759)
             
             
             
             
             
             library(foreign)
             two<-read.dta("C:/Users/Benjamin/Documents/Laboratorio R/twoyear.dta")
             ls()
             names(two)
             
             
             modelo3<-lm(lwage~1+jc+univ+exper,data=two)
             summary(modelo3)
             
             linear.hypothesis(modelo2,
                               
                               linearHypothesis(modelo3,"jc=univ")
                               
                               linearHypothesis(modelo3,c("(Intercept)=1.47","jc=0.67","univ=0.77",
                                                          "exper=0.005"))
                               linearHypothesis(modelo3,c("(Intercept)=0","jc=0","univ=0","exper=0"))
                               
                               
                               ?
                               load("MEAP93.RData")
                               
                               ls()
                               meapdata<-data
                               names(data)
                               names(wage.data)
                               
                               modelo2<-lm(math10~1+totcomp+staff+enroll,data=meapdata)
                               summary(modelo2)
                               
                               linear.hypothesis(modelo2)
                               Anova(modelo2)
                               
                               4.570  >   qt(0.95,404)
                               1.204  >   qt(0.95,404)
                               -0.918  < - qt(0.95,404)
                               
                               confint(modelo3)
                               
                               int<-c(21.1550-(qt(0.975,404)*4.0555),21.1550+(qt(0.975,404)*4.0555))
                               int
                               
                               0.0004586-qt(0.95,404)*0.0001004,0.0004586+qt(0.95,404)*0.0001004)
             int
             
             modelo3<-lm(math10~1+ltotcomp+lstaff+lenroll,data=meapdata)
             summary(modelo3)
             
             5.216  >  qt(0.95,404)
             0.950  >  qt(0.95,404)
             -1.829  < -qt(0.95,404)
             
             
             load("GPA1.RData")
             ls()
             names(GPA1)
             modelo4<-lm(colGPA~1+hsGPA+ACT+skipped,data=GPA1)
             summary(modelo4)
             coeftest(modelo4)
             
             abs(4.3963) > qt(0.995,137)
             
             2*pt(-0.918,404)
             2*pt(-4.396,137)
             2*pt(-4.191,137)
             
             1-pt(1.85,40)
             ?pt
             
             ###############################################################################
             ###############################################################################
             #Test de Hipótesis
             #Utilizar Votación.txt 
             
             library(car)
             
             base<-read.table(file.choose(),header=T)
             
             modelo1<-lm(voteA~1+log(expendA)+log(expendB)+prtystrA,data=base)
             summary(modelo1)
             
             linearHypothesis(modelo1,"log(expendA)=0")
             
             linearHypothesis(modelo1,"log(expendA)=log(expendB)")
             
             
             ###############################################################################
             #MODELO LINEAL INTERACTIVO
             
             
             log(10)
             exp(2.302585)
             
             
             #Un breve repaso de forma funcional: forma logarítmica y cuadrática.
             
             #Es un tipo particular de especificación de modelos. 
             #En su forma más simple, puede plantearse de la siguiente manera:
             
             Y= ß0 + ß1X + ß2Z + ß12XZ+ u
             
             #Su utilización debe sustentarse en criterios teóricos.
             #Este modelo corresponde a una teoría orientada a sostener que la Variable de
             #interés es explicada por el efecto de dos regresores como por la RELACIÓN
             #CONDICIONAL ENTRE ambos regresores X y Z. 
             
             #La relación entre Y y X es condicional a Z como la relación entre Y y Z es
             #condicional a X.
             
             #Las interacciones son simétricas. No pueden distinguirse por razones 
             #matemáticas, sino que por motivos teóricos o lógicos.
             #Por lo tanto, X y Z necesariamente deben intervenir con la otra en relación
             #a Y.
             
             #La incorporación de elementos estocásticos genera residuales compuestos
             #reteniendo la media condicional cero esperada y la no covarianza entre los
             #regresores. Los supuestos garantizan el insesgamiento y consistencia de los 
             #coeficientes estimados. Esto puede derivar en ciertos casos en la presencia
             #de heteroscedasticidad (debe analizarse empíricamente). 
             
             #En el caso del modelo lineal aditivo puro, los coeficientes estimados por
             #MCO son los efectos sobre la variable de interés del incremento de una 
             #unidad (o valor correspondiente según la forma funcional) en el valor de 
             #cada regresor(ceteris paribus y controlando por otros regresores), siendo
             #siempre idénticos.
             
             #Las interacciones se describen mediante dos operadores matemáticos en R.
             
             # *   Describe todas las interacciones posibles entre las variables.
             # :   Describe una de las posibles interacciones entre las variables.
             
             #Claro que en el caso de interacciones entre dos variables, ambos signos
             #tienen el mismo sentido/significado.
             
             #Las interacciones incluidas comparten múltiples características. Ahora bien
             #es posible estructurar interacciones de distintos modos:
             
             #A) Interacción entre 2 variables
             
             # 1 variable cuantitativa * 1 variable cuantitativa
             # 1 variable cuantitativa * 1 variable dummy (dicotómica o politómica) 
             # 1 variable dummy        * 1 variable dummy 
             
             #B) Entre 3 o más variables
             
             #La única complejización la constituyen las variables categóricas ordinales. 
             
             #Mediante todas las combinaciones posibles entre estos tipos de variables. 
             
             #Los derivadas parciales son los efectos de las variables.
             #El coeficiente de x corresponde al efecto cuando z es 0. 
             #Bxz corresponde a cuanto el efecto de sobre Y varía al
             #incrementarse z.
             
             #Ahora, estimaremos un modelo simple, basado en el trabajo de Octavio Amorim
             #Neto y Gary Cox. Se plantea que el Número efectivo de candidatos presidenciales
             #es producto del número de grupos étnicos (se considera muy asociado a la
             #existencia de clivajes). 
             
             #Antes de interpretar, estudiemos el funcionamiento práctico en R de los
             #modelos lineales interactivos.
             
             ls()
             fix(netocox)
             names(netocox)
             RUNOFF<-as.factor(netocox$RUNOFF)
             
             modelo1<-lm(ENPRES~1+RUNOFF+ENETH+RUNOFF*ENETH,data=netocox)
             summary(modelo1)
             
             modelo1a<-lm(ENPRES~1+RUNOFF+ENETH+RUNOFF:ENETH,data=netocox)
             summary(modelo1a)
             
             fix(netocox)
             
             modelo1b<-lm(ENPRES~1+RUNOFF*ENETH,data=netocox)
             summary(modelo1b)
             
             modelo1c<-lm(ENPRES~1+RUNOFF*ENETH-RUNOFF,data=netocox)
             summary(modelo1c)
             
             modelo1d<-lm(ENPRES~1+RUNOFF*ENETH-RUNOFF-ENETH,data=netocox)
             summary(modelo1d)
             
             Intercepto<-c(4.3033595,4.3033595,4.3033595,2.75942534,2.6826394)
             RUNOFF<-c(-2.4910913,-2.4910913,-2.4910913,"NE","NE")
             ENETH<-c(-0.9792191,-0.9792191,-0.9792191,-0.05850207,"NE")
             Interacción<-c(2.0053733,2.0053733,2.0053733,0.59658877,0.5776543)
             tabla<-cbind(Intercepto,RUNOFF,ENETH,Interacción)
             rownames(tabla)<-c("modelo1","modelo1a","modelo1b","modelo1c","modelo1d")
             tabla
             
             #Otro ejemplo de estimación de un modelo lineal interactivo:
             
             library(car)
             data(Prestige)
             names(Prestige)
             
             modelo.2<-lm(prestige~1+income+women+type+women*type+income*type+women*income+
                            women*income*type,data=Prestige)
             summary(modelo.2)
             
             
             modelo.3<-lm(prestige~1+women*income*type,data=Prestige)
             summary(modelo.3)
             
             women.1<-seq(from=min(Prestige$women),to=max(Prestige$women),by=1)
             
             efecto.income.prof<-0.00497-(0.00420*1)-(0.00051*0)+(0.00006*women.1)-(0.00005*1*women.1)
             efecto.income.prof
             
             efecto.income.wc<-0.00497-(0.00420*0)-(0.00051*1)+(0.00006*women.1)-(0.00005*0*women.1)
             efecto.income.wc
             
             efecto.income.bc<-0.00497-(0.00420*0)-(0.00051*0)+(0.00006*women.1)-(0.00005*0*women.1)
             efecto.income.bc
             
             income.1<-seq(from=min(Prestige$income),to=max(Prestige$income),by=10)
             
             efecto.women.prof<-(-0.04861)-(0.00314*1)+(0.11690*0)+(0.00006*income.1)-(0.00005*1*income.1)
             efecto.women.prof
             
             efecto.women.wc<-(-0.04861)-(0.00314*0)+(0.11690*1)+(0.00006*income.1)-(0.00005*0*income.1)
             efecto.women.wc
             
             efecto.women.bc<-(-0.04861)-(0.00314*0)+(0.11690*0)+(0.00006*income.1)-(0.00005*0*income.1)
             efecto.women.bc
             
             
             #Ahora, con un Modelo Considerado más simple: Generación de Gráficos
             
             modelo.3<-lm(prestige~women+type+women*type,data=Prestige)
             summary(modelo.3)
             
             library(effects)
             plot(allEffects(modelo.3,default.levels=50),ask=FALSE, layout=c(2,2),
                  xlab="Prestigio",ylab="Porcentaje de Mujeres Incumbentes",
                  main="Gráfico 1:Efecto de la Interacción
                  entre Women y Type",
                  sub="Fuente: Fox (1999)")
             
             
             #Ahora volveremos a trabajar con la base de Neto y Cox.
             
             fix(netocox)
             summary(modelo1)
             
             #¿Cuáles son los efectos?
             #En un modelo lineal interactivo: Coeficientes NO es lo mismo que Efectos.
             
             modelo1$effects
             modelo1a$effects
             modelo1b$effects
             modelo1c$effects
             modelo1d$effects
             
             #¿Fácil de comprender? Existe algo más simple
             
             library(effects)
             efectos<-allEffects(modelo1)    
             efectos                       #¿Cuál es el defecto este comando?
             fix(netocox)
             plot(efectos)                 #Notar la parte inferior del Gráfico. 
             
             
             plot(allEffects(modelo1,default.level=2),ask=F)
             plot(allEffects(modelo1,default.level=10),ask=F)
             plot(allEffects(modelo1,default.level=25),ask=F)
             
             plot(effect("RUNOFF",modelo1))
             plot(effect("ENETH",modelo1))
             
             #Cuidado al utilizar gráficos de efecto marginal
             #¿Cómo podemos interpretar los coeficientes/estimar los efectos a partir de 
             #nuestras estimaciones?
             
             #Efecto Condicional: cuando la otra variable toma un valor de Cero.
             #¿Es relevante? Analizar el rango de valores relevantes. 
             
             segunda.vuelta<-seq(from=min(netocox$RUNOFF),to=max(netocox$RUNOFF),by=1)
             efecto.grupos.etnicos<-segunda.vuelta*2.005-0.979
             efecto.grupos.etnicos                 
             
             grupos.etnicos<-seq(from=min(netocox$ENETH),to=max(netocox$ENETH),by=0.5)
             efecto.segunda.vuelta<-grupos.etnicos*2.005-2.491
             efecto.segunda.vuelta
             
             #¿Qué es lo que ha pasado? ¿Qué otros efectos genera?
             
             #Ahora calcularemos los valores predichos de ENPRES
             
             grupos.etnicos
             segunda.vuelta
             a<-c(rep(0,5),rep(1,5))
             b<-c(1,1.5,2,2.5,3,1,1.5,2,2.5,3)
             candidatos<-(4.303-(0.979*(b))-(2.491*(a))+(2.005*(a*b)))
             candidatos
             
             library(effects)
             
             ls()
             canda<-as.data.frame(cand1)
             fix(candi1)
             summary(cand1)
             
             names(modelo1c)
             effects(modelo1c)
             ?effects
             
             efectos<-allEffects(modelo1)
             efectos
             plot(efectos)
             
             a<-(-0.979)+2.005*(netocox$RUNOFF)
             a
             b<-(-2.491)+2.005*(netocox$ENETH)
             b
             ###############################################################################
             
             
             #Interacciones y No Linealidades
             #Utilizar govduration
             
             setwd("C:/Users/Benjamin/Documents/z-R/Técnicas Avanzadas de Análisis Estadístico/Tarea 3/zippedKamFranzese2007")
             load("govduration.RData")
             
             names(govduration)
             
             modelo2a<-lm(govdur~1+PS,data=govduration)
             summary(modelo2a)
             
             plot(govduration$PS,govduration$govdur)
             crPlots(modelo2a)
             
             modelo2b<-lm(govdur~1+PS+ I(PS^2),data=govduration)
             summary(modelo2b)
             
             crPlots(modelo2b)
             
             ?predict
             summary(govduration$PS)
             dim(govduration)
             40/22
             rangoPS2<-seq(40,80,1.818182)
             rangoPS2
             length(rangoPS2)
             
             datos<-data.frame(govduration$govdur,govduration$PS)
             datos$PS<-rangoPS2
             
             ?predict
             a<-predict(modelo2b,newdata=datos)
             
             plot(datos$PS,a,type="n",xlim=c(40,80),ylim=c(20,50))
             lines(x=datos$PS,y=a)
             
             summary(modelo2b)
             summary(govduration$PS)
             rangoPS<-seq(40,80,1)
             efecto<-(-2.73366+2*(0.02568)*rangoPS)
             plot(rangoPS,efecto)
             
             
             
             plot(rangoPS,efecto,ylim=c(-1,2),type="n")
             lines(rangoPS,efecto)
             
             setwd("C:/Users/Benjamin/Documents/z-R/Técnicas Avanzadas de Análisis Estadístico/Replicación Boix")
             load("BoixFinal.RData")
             boix.1<-subset(boix,interwar==1)
             
             ################################################################################
             #REPLICACIÓN DE LOS RESULTADOS DE LOS MODELOS DE REGRESIÓN LINEAL.
             
             #Lo primero es replicar los resultados de la Tabla 1 de Boix (1999).
             
             modelo1<-lm(threshold~1+threat+area+trade+population+ethnic,data=boix.1)
             summary(modelo1)
             
             modelo2<-lm(threshold~1+threat+socperc+parties+area,data=boix.1)
             summary(modelo2)
             
             modelo3<-lm(threshold~1+threat+interaction,data=boix.1)
             summary(modelo3)
             
             #Ahora replicaré los resultados presentados en el Apéndice B.
             
             modelo4<-lm(threshold~1+threat+area+trade+population+ethnic,data=boix)
             summary(modelo4)
             
             modelo5<-lm(threshold~1+threat+socperc+parties+area,data=boix)
             summary(modelo5)
             
             modelo6<-lm(threshold~1+threat+interaction,data=boix)
             summary(modelo6)
             
             ###############################################################################
             #REPLICACIÓN DE LA TABLA 2.
             
             mean(boix.1)
             
             #Claro está, 20*4 es lo mismo que 4*20 a 40*2, etc. No se calculan las
             #"simulaciones" redundantes. 
             
             simulación1<-lm(threshold~1+I(threat-0.2)+I(area-3)+I(trade-3.8609409)+
                               I(population-2.3872727)+I(ethnic-0.2469641),data=boix)
             summary(simulación1)
             
             simulación2<-lm(threshold~1+I(threat-0.4)+I(area-3)+I(trade-3.8609409)+
                               I(population-2.3872727)+I(ethnic-0.2469641),data=boix)
             summary(simulación2)
             
             simulación3<-lm(threshold~1+I(threat-0.6)+I(area-3)+I(trade-3.8609409)+
                               I(population-2.3872727)+I(ethnic-0.2469641),data=boix.1)
             summary(simulación3)
             
             simulación4<-lm(threshold~1+I(threat-0.8)+I(area-3)+I(trade-3.8609409)+
                               I(population-2.3872727)+I(ethnic-0.2469641),data=boix.1)
             summary(simulación4)
             
             simulación5<-lm(threshold~1+I(threat-1.2)+I(area-3)+I(trade-3.8609409)+
                               I(population-2.3872727)+I(ethnic-0.2469641),data=boix.1)
             summary(simulación5)
             
             simulación6<-lm(threshold~1+I(threat-1.8)+I(area-3)+I(trade-3.8609409)+
                               I(population-2.3872727)+I(ethnic-0.2469641),data=boix.1)
             summary(simulación6)
             
             simulación7<-lm(threshold~1+I(threat-1.6)+I(area-3)+I(trade-3.8609409)+
                               I(population-2.3872727)+I(ethnic-0.2469641),data=boix.1)
             summary(simulación7)
             
             simulación8<-lm(threshold~1+I(threat-2.4)+I(area-3)+I(trade-3.8609409)+
                               I(population-2.3872727)+I(ethnic-0.2469641),data=boix.1)
             summary(simulación8)
             
             #Volveré a correr las regresiones originales pero sin usar threat. En 2 casos
             se reespecifican los modelos
             
             
             modelo1a<-lm(threshold~1+(socperc*parties)+socperc+parties+
                            area+trade+population+ethnic,data=boix.1)
             summary(modelo1a)
             
             modelo2a<-lm(threshold~1+(socperc*parties)+socperc+parties+area,data=boix.1)
             summary(modelo2a)
             
             modelo3a<-lm(threshold~1+(socperc*parties)+socperc+parties+
                            (area.dummy*ethnic)+ethnic+area.dummy,
                          data=boix.1)
             summary(modelo3a)
             
             ###############################################################################
             #Reespecificaré los modelos incluyendo los términos de la interacción
             
             modelo4a<-lm(threshold~1+(socperc*parties)+socperc+parties+
                            area+trade+population+ethnic,data=boix)
             summary(modelo4a)
             
             modelo5a<-lm(threshold~1+(socperc*parties)+socperc+parties+area,
                          data=boix)
             summary(modelo5a)
             
             modelo6a<-lm(threshold~1+(socperc*parties)+socperc+parties+
                            (area.dummy*ethnic)+ethnic+area.dummy,
                          data=boix)
             summary(modelo6a)
             
             
             #MODELO 1A GENERACIÓN DE GRÁFICOS
             
             vcov(modelo1a)
             
             parties.1<-seq(0,6,1)
             
             v1<-(5175.45861+(parties.1^2)*(481.8852515)+2*(parties.1)*(-1507.8333684))
             
             
             efecto.socperc<-74.4001+(-39.6263*parties.1)
             
             margen.superior.a<-(efecto.socperc+(1.96*sqrt(v1)))
             margen.inferior.a<-(efecto.socperc-(1.96*sqrt(v1)))
             
             plot(y=efecto.socperc,x=parties.1,type="n",xlim=c(0,6),ylim=c(-300,300),
                  xlab="Número Efectivo de Partidos Antiguos No Socialistas",ylab="Efecto Marginal de Fuerza del Socialismo",
                  main="Gráfico 13: Efecto Marginal de Fortaleza del 
                  Socialismo sobre el Umbral Electoral Efectivo",sub="Fuente: Boix (1999)")
             abline(h=0,lwd=3)
             lines(x=parties.1,y=margen.superior.a,lty=3)
             lines(x=parties.1,y=margen.inferior.a,lty=3)
             lines(x=parties.1,y=efecto.socperc,lty=1)
             
             summary(boix.1)
             
             soc.perc.1<-seq(0,0.500,0.1)
             v2<-(32.9209492+(soc.perc.1^2)*(481.8852515)+2*(soc.perc.1)*(-117.1009143))
             efecto.parties<-8.9607+(-39.6263*soc.perc.1)
             margen.superior.b<-(efecto.parties+(1.96*sqrt(v2)))
             margen.inferior.b<-(efecto.parties-(1.96*sqrt(v2)))
             
             plot(y=efecto.parties,x=soc.perc.1,type="n",xlim=c(0,0.5),ylim=c(-30,30),
                  xlab="Proporción de Votos a Partidos Socialistas",ylab="Efecto Marginal del Número de Partidos Antiguos",
                  main="Gráfico 14: Efecto Marginal del Número Efectivo 
                  de Partidos Antiguos No Socialistas sobre el
                  Umbral Electoral Efectivo", sub="Fuente: Boix (1999)") 
             abline(h=0,lwd=3)
             lines(x=soc.perc.1,y=margen.superior.b,lty=3)
             lines(x=soc.perc.1,y=margen.inferior.b,lty=3)
             lines(x=soc.perc.1,y=efecto.parties,lty=1)
             
             #PARA LA MUESTRA COMPLETA
             
             vcov(modelo4a)
             
             parties.2<-seq(0,6,1)
             v3<-(2479.47455+(parties.2^2)*(285.6307639)+2*(parties.2)*(-807.2504592))
             efecto.socperc.2<-54.3937+(-32.9477*parties.2)
             margen.superior.a2<-(efecto.socperc.2+(1.96*sqrt(v3)))
             margen.inferior.a2<-(efecto.socperc.2-(1.96*sqrt(v3)))
             
             plot(y=efecto.socperc.2,x=parties.2,type="n",xlim=c(0,6),ylim=c(-300,300),
                  xlab="Número Efectivo de Partidos Antiguos No Socialistas",ylab="Efecto Marginal de Fuerza del Socialismo",
                  main="Gráfico 15: Efecto Marginal de Fortaleza del 
                  Socialismo sobre el Umbral Electoral Efectivo",sub="Fuente: Boix (1999)")
             abline(h=0,lwd=3)
             lines(x=parties.2,y=margen.superior.a2,lty=3)
             lines(x=parties.2,y=margen.inferior.a2,lty=3)
             lines(x=parties.2,y=efecto.socperc.2,lty=1)
             
             soc.perc.2<-seq(0,0.500,0.1)
             v4<-(22.68048127+(soc.perc.2^2)*(285.6307639)+2*(soc.perc.2)*(-75.7521756))
             efecto.parties.2<-7.2044+(-32.9477*soc.perc.2)
             margen.superior.b2<-(efecto.parties.2+(1.96*sqrt(v4)))
             margen.inferior.b2<-(efecto.parties.2-(1.96*sqrt(v4)))
             
             plot(y=efecto.parties.2,x=soc.perc.2,type="n",xlim=c(0,0.5),ylim=c(-30,30),
                  xlab="Proporción de Votos a Partidos Socialistas",ylab="Efecto Marginal del Número de Partidos Antiguos",
                  main="Gráfico 16: Efecto Marginal del Número Efectivo 
                  de Partidos Antiguos No Socialistas sobre el
                  Umbral Electoral Efectivo", sub="Fuente: Boix (1999)") 
             abline(h=0,lwd=3)
             lines(x=soc.perc.2,y=margen.superior.b2,lty=3)
             lines(x=soc.perc.2,y=margen.inferior.b2,lty=3)
             lines(x=soc.perc.2,y=efecto.parties.2,lty=1)
             
             
             plot(Effect("socperc",modelo4a))
             plot(Effect("parties",modelo4a))
             
             
             ################################################################################
             #MODELO 3A: CÁLCULO DE LOS ERRORES ESTÁNDARES
             
             n.1<-nrow(boix.1)
             constante.1<-rep(1,n.1)
             X.1<-cbind(constante,boix.1$socperc,boix.1$parties,boix.1$threat,
                        boix.1$area.dummy,boix.1$ethnic,boix.1$interaction)
             Y.1<-as.matrix(boix.1$threshold)
             k.1<-ncol(X.1)
             
             betas.1<-solve((t(X.1))%*%X.1)%*%(t(X.1)%*%Y.1)
             y.prediccion.1<-X.1%*%betas.1
             residuos.1<-Y.1-y.prediccion.1
             sigma.2.residuos.1<-var(residuos.1)
             S2.a<-sigma.2.residuos.1^0.5
             
             VCV.1<-1/(n.1-k.1)*as.numeric(t(residuos.1)%*%residuos.1)*solve(t(X.1)%*%X.1)
             std.1<-as.matrix(sqrt(diag(VCV.1)))
             colnames(VCV.1)<-c("Intercepto","socperc","parties","threat","area.dummy",
                                "ethnic","interaction")   
             rownames(VCV.1)<-c("Intercepto","socperc","parties","threat","area.dummy",
                                "ethnic","interaction")  
             VCV.1
             
             v1.1<-(690.073976+(0^2)*(1026.11547)+2*(0)*(-714.71859))
             v2.1<-(690.073976+(1^2)*(1026.11547)+2*(1)*(-714.71859))
             
             error.1<-sqrt(v1.1)
             error.2<-sqrt(v2.1)
             error.1
             error.2
             
             n.2<-nrow(boix)
             constante.2<-rep(1,n.2)
             X.2<-cbind(constante.2,boix$socperc,boix$parties,boix$threat,
                        boix$area.dummy,boix$ethnic,boix$interaction)
             Y.2<-as.matrix(boix$threshold)
             k.2<-ncol(X.2)
             
             betas.2<-solve((t(X.2))%*%X.2)%*%(t(X.2)%*%Y.2)
             y.prediccion.2<-X.2%*%betas.2
             residuos.2<-Y.2-y.prediccion.2
             sigma.2.residuos.2<-var(residuos.2)
             S2.b<-sigma.2.residuos.2^0.5
             
             VCV.2<-1/(n.2-k.2)*as.numeric(t(residuos.2)%*%residuos.2)*solve(t(X.2)%*%X.2)
             std.2<-as.matrix(sqrt(diag(VCV.2)))
             colnames(VCV.2)<-c("Intercepto","socperc","parties","threat","area.dummy",
                                "ethnic","interaction")   
             rownames(VCV.2)<-c("Intercepto","socperc","parties","threat","area.dummy",
                                "ethnic","interaction")  
             VCV.2
             
             v1.3<-459.154980+(0^2)*(647.170345)+2*(0)*(-461.939376)
             v1.4<-459.154980+(1^2)*(647.170345)+2*(1)*(-461.939376)
             
             error.3<-sqrt(v1.3)
             error.4<-sqrt(v1.4)
             error.4
             
             
             #Aspectos Avanzados (Si se Alcanza)
             
             setwd("C:/Users/Benjamin/Documents/Ayudantía R")
             load("Chile1.RData")
             library(car)
             
             modelo1<-lm(acep_desig~1+ideologiaN+satisf_ingrN+impdemN,data=chile2a)
             summary(modelo1)
             
             #RESET como análisis de forma funcional
             
             Variables:
               
               govdur: duración promedio de los gobiernos posterior a la II Guerra Mundial.
             Medido en meses.
             NP: n° de partidos en el gobierno (como promedio)
             PS: promedio de apoyo parlamentario de la Legislatura al Gobierno (escaños
                                                                                controlados).
             PD: disciplina partidaria
             
             #Paquetes útiles (usar solamente si lo estima necesario)
             
             library(car)
             library(lmtest)
             library(effects)
             
             #1 Se plantea que la duración de un gobierno parlamentario es producto de 
             #la disciplina partidaria y de la relación condicional entre el número
             #de partidos  que conforman la coalición y el contingente legislativo
             #del Gobierno. 
             
             #Se teoriza que al aumentar grado de apoyo al Gobierno se incrementa el
             #efecto del número de partidos en el gobierno.
             
             #A) Estime dicho modelo. Interprete el coeficiente de NP y PS (¿tienen
             #   sentido?).
             
             ls()
             
             modelo1<-lm(govdur~1+NP+PS+PS*NP+PD,data=gov)
             summary(gov$PS)
             summary(modelo1)
             
             #B) Estime el modelo pero eliminando los coeficientes de orden inferior 
             #   (los parámetros individuales que conforman la interacción: si hay una
             #    interacción entre x y z -x*z-, elimine x y z. Para esto, le resultará
             #    muy útil especificar dichas variables con un signo (-) en el comando lm).
             
             modelo1a<-lm(govdur~1+PS*NP-NP-PS+PD,data=gov)
             summary(modelo1a)
             
             #C) ¿Cuáles son las ventajas y desventajas de este modelo?
             #D) Con el siguiente comando:
             
             ps<-seq(40,80,1.8)
             efecto<-(-31.3703)+0.4686*ps
             var<-(128.712332)+(0.03469307*((ps)^2))+(2*(ps)*(-2.088993)) 
             sup<-efecto+1.782*sqrt(var)
             inf<-efecto-1.782*sqrt(var)
             
             plot(x=ps,y=efecto,type='n',xlim=c(40,80),ylim=c(-20,20),
                  xlab="Apoyo Parlamentario al Gobierno (PS)",
                  ylab="Efecto Marginal",
                  main="Gráfico 1: Efecto Marginal del Número de Partidos",
                  sub="Intervalo de Confianza del 90%")
             abline(h=0,lwd=3)
             lines(ps,efecto)
             lines(ps,sup,lty=4)
             lines(ps,inf,lty=4)
             abline(v=67.02,lwd=2,lty=3)
             
             plot(effect("NP",modelo1))
             
             #Interprete dicho gráfico (magnitud, dirección y significancia estadística).
             
             #D) Se le pide que en base a su modelo realice una serie de estimaciones:
             #    i)   Siempre asuma PD=1.
             #    ii)  Considere cinco valores relevantes de PS={40,50}
             #    iii) Considere cuatro valores relevantes de NP={1,2}
             #    iv)  Da un total de 4 estimaciones. Considere intervalos de
             #         confianza del 95% (bastan resultados aproximados).
             #     v)  Ahora trate de predecir la duración de un gobierno conformado
             #         por 2 partidos y con un contingente legislativo mayoritario (50).
             #         Asuma PD=1 (hay disciplina). ¿Qué valor se espera si se incluye
             #         un nuevo miembro a la coalición y aporta un 10% de representantes?   
             
             
             
             
             
             m<-lm(govdur~1+I(PS-40)+I(NP-1)+I(PD-1)+I(NP-1)*I(PS-40),data=gov)
             summary(m)
             
             
             
             
             33.0474+1.96*5.2759
             33.0474-1.96*5.2759
             
             
             predict(modelo1,data.frame(PS=40,NP=1,PD=1),interval="confidence",se.fit=T)
             
             predict(modelo1,data.frame(PS=40,NP=1,PD=1),interval="predict",se.fit=T)
             
             predict(modelo1,data.frame(PS=50,NP=1,PD=1),interval="confidence",se.fit=T)
             predict(modelo1,data.frame(PS=40,NP=2,PD=1),interval="confidence",se.fit=T)
             predict(modelo1,data.frame(PS=50,NP=2,PD=1),interval="confidence",se.fit=T)
             
             
             #E) Analice el cumplimiento de los supuestos de linealidad y homocedasticidad.
             
             #F) Otro investigador plantea que la variable crucial es el apoyo partidario
             #   al gobierno, teniendo un efecto no lineal sobre la variable de interés.
             #   Plantee y estime un modelo que incluya dicho efecto (no incluya otras
             #   variables independientes).
             
             modelo3<-lm(govdur~1+PS+I(PS^2),data=gov)
             summary(modelo3)
             
             #G) Interprete:
             
             #Generar el siguiente gráfico le resultará de utilidad:
             
             efecto1<-(-2.73366)+2*0.02568*ps
             plot(x=ps,y=predict(modelo3,data.frame(PS=ps)),type='n',
                  ylim=c(20,50))
             lines(ps,predict(modelo3,data.frame(PS=ps)),lwd=2)
             abline(v=abs(-2.73366/(2*0.02568)),lty=3)
             abs(-2.73366/(2*0.02568))
             #H) Tras un cuidadoso análisis metodológico, se recomienda la inclusión
             #   de especificaciones logarítmicas para la variable PS. Estime el modelo
             #   original con dicha corrección.
             
             