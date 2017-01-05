#Cargar el dataset discretizado en forma transacional
students=read.csv("../student/student-por-transacional-Alc-bin.csv", header=TRUE, sep = ";")
students

#Eliminar los atributos Dalc y Walc para las reglas de asociación ya que el atributo
#Alc está generado a partir de ellos y por tanto tienen una correlación elevada, lo que
#hace que aparezcan casi siempre juntos en las reglas de asociación sin aportar nada
students = students[,-(27:28)]
students

#seleccionar el paquete arules
library(arules)

#Lo convertimos en una BD de transacciones, vemos informacion acerca de el
studentsTrans=as(students,"transactions")
summary(studentsTrans) 
frec=itemFrequency(studentsTrans)
#Items más frecuentes
sort.default(frec, decreasing = TRUE)
itemFrequencyPlot(studentsTrans,support=0.3, main = "Frecuencia de los items\ncon soporte >= 0,3")

#Calculo apriori, los parametros que se han especificado son los que se dan por defecto 
rules=apriori(studentsTrans, parameter = list(support = 0.05, confidence = 0.7, minlen = 2, maxtime=300))
#salida del conjunto de reglas
summary(rules)
#Obtener subconjunto de reglas con consecuente Alc
rulesAlc=subset(rules,subset=rhs %in% c("Alc=Alc-No","Alc=Alc-Si"))
#Ordenarlas por confianza
rulesConf=sort(rulesAlc,by="confidence")

#Mostrar información sobre las reglas filtradas
summary(rulesConf)

#Envia salida por consola al siguiente fichero ya que está limitada en RStudio
sink("output.txt")
salida1=inspect(rulesConf,ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", linebreak=TRUE)
sink()


#Visualizacion de reglas
#Selecciono arulesViz
library(arulesViz)
plot(rulesConf,method="scatterplot",measure=c("support","confidence"), control=list(main = "Scatter Plot Reglas con consecuente Alc binario",verbose = TRUE))
plot(rulesConf, shading="order", control=list(main = "Scatter Plot Reglas con consecuente Alc binario",col=rainbow(9)))

#Las siguientes gráficas no son muy significativas al estar tan desequilibradas las clases
#plot(rulesConf, method="matrix",measure="confidence", control=list(main = "Matriz",col=rainbow(9)))
#plot(rulesConf, method="matrix3d",shading="order", control=list(main = "Tridimensional"))
#plot(rulesConf, method="grouped",measure="confidence", control=list(main = "Cluster",k=10))

#Dividir las reglas entre las que dan Alc-Si o Alc-No, mostrar información al respecto
#Crear gráficas de grafos, imprimir las 10 mejores reglas de cada grupo y 
#guardarlas todas en ficheros de texto plano
rulesAlcNo=subset(rulesConf,subset=rhs %in% c("Alc=Alc-No"))
rulesAlcSi=subset(rulesConf,subset=rhs %in% c("Alc=Alc-Si"))

summary(rulesAlcSi)
summary(rulesAlcNo)

plot(rulesConfNo[1:10], method="graph", measure="confidence", control=list(main = "Grafo 10 mejores reglas con consecuente Alc-no\n(usando como criterio la confianza)", verbose = TRUE, layout=igraph::with_graphopt(spring.const=5, mass=50)))
salida2=inspect(rulesConfNo[1:10],ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", linebreak=TRUE)

sink("outputNo.txt")
salida1=inspect(rulesConfNo,ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", linebreak=TRUE)
sink()

plot(rulesConfSi[1:10], method="graph", measure="confidence", control=list(main = "Grafo 10 mejores reglas con consecuente Alc-si\n(usando como criterio el confianza)", verbose = TRUE, layout=igraph::with_graphopt(spring.const=5, mass=50)))
salida3=inspect(rulesConfSi[1:10],ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", linebreak=TRUE)

sink("outputSi.txt")
salida1=inspect(rulesConfSi,ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", linebreak=TRUE)
sink()
