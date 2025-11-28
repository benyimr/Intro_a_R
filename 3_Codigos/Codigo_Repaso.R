\documentclass[letterpaper,9pt]{article}
\usepackage[]{graphicx}
\usepackage[]{color}
\usepackage{framed}
\usepackage{alltt}
\usepackage[spanish]{babel}
\usepackage[margin=0.5in]{geometry}
\usepackage{listings}
\usepackage{inconsolata}
\usepackage{float}
\usepackage{url}
\usepackage{multirow}
\usepackage{lscape}
\usepackage{mathtools}

\begin{document}
\title{Percepci\'on de Desigualdad Econ\'omica}
  \author{}
  \date{}
  \maketitle
  

<<echo=TRUE, eval=FALSE,tidy=TRUE>>=
library(car)
library(sjmisc)
library(sjPlot)
library(sjstats)
@

rm(list=ls())   #El comando rm() permite remover objetos del espacio de trabajo 
                #de R. Al usar list=ls() le indico que elimine todos los objetos
                #presentes en el. 

setwd("/Users/Benjamin/Dropbox/3 Docencia/4 Taller de R EVMM2017/Codigos/Modulo_05")


issp09 <- read_stata(path="/Users/Benjamin/Dropbox/3 Docencia/4 Taller de R EVMM2017/Codigos/Modulo_05/ZA5400_v3-0-0.dta",atomic.to.fac = T)

dim(issp09)     #55238 filas y 350 columnas
class(issp09)   #El objeto contiene dos elementos: un data.frame o marco de datos
                #y un archivo que almacena las etiquetas asociadas a las variables
                #del marco de datos.

colnames(issp09) <- tolower(names(issp09))
names(issp09)


sjt.frq(issp09$c_alphan)
summary(as.factor(issp09$c_alphan))

issp09$c_alphan1 <- car::recode(issp09$c_alphan," 'BE-FLA'='BE'; 'DE-E'='DE';
                                                  'DE-W'='DE'; 'GB-GBN'='GB'")

issp09$pais <- car::recode(issp09$v5,"32='Argentina';36='Australia';40='Austria';
                            56='Belgica'; 100='Bulgaria';152='Chile';156='China';
                            158='Taiwan';191='Croacia';196='Chipre';
                            203='R. Checa';208='Dinamarca';233='Estonia';
                            246='Finlandia';250='Francia';276='Alemania';
                            348='Hungria';352='Islandia';376='Israel';380='Italia';
                            392='Japon';410='Corea del Sur';428='Letonia';
                            554='Nueva Zelanda';578='Noruega';608='Filipinas';
                            616='Polonia';620='Portugal';643='Rusia';
                            703='Eslovaquia';705='Eslovenia';710='Sudafrica';
                            724='Espana';752='Suecia';756='Suiza';792='Turquia';
                            804='Ucrania';826='Reino Unido';840='Estados Unidos';
                            862='Venezuela'",as.factor.result=T)


summary(issp09$v23)
class(issp09$v23)

issp09$v23 <- as.numeric(as.character(issp09$v23))
summary(issp09$v23)
class(issp09$v23)

issp09$v25 <- as.numeric(as.character(issp09$v25))
issp09$v26 <- as.numeric(as.character(issp09$v26))
issp09$v28 <- as.numeric(as.character(issp09$v28))
issp09$v30 <- as.numeric(as.character(issp09$v30))
issp09$v31 <- as.numeric(as.character(issp09$v31))
issp09$v44 <- as.numeric(as.character(issp09$v44)) #estatus
issp09$v66  es clase 


summary(issp09$v32)
sjt.frq(issp09$v32)









































































\end{document}