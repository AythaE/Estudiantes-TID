#Cargar el dataset discretizado en forma transacional
students=read.csv("../student/student-por-transacional.csv", header=TRUE, sep = ";")
View(students)
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
rules=apriori(studentsTrans, parameter = list(support = 0.1, confidence = 0.7, minlen = 2, maxtime=300))
#salida del conjunto de reglas
summary(rules)
rulesConf=sort(rules,by="confidence")
#Obtener subconjunto de reglas con consecuente Alc
rulesAlc=subset(rulesConf,subset=rhs %in% c("Alc=Alc-Muy bajo","Alc=Alc-Bajo"))
#Envia salida por consola al siguiente fichero ya que está limitada en RStudio
sink("output.txt")
salida1=inspect(rulesAlc,ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", linebreak=TRUE)
sink()
#restriccion de reglas, solo las que predicen clases y con confianza mayor que 0.9
sale2=subset(rulesConf,subset=rhs %in% c("class=Iris-versicolor","class=Iris-virginica","class=Iris-setosa")& confidence >= 0.9)
salida2= inspect(sale2,ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", linebreak=TRUE)
#Visualizacion de reglas
#Selecciono arulesViz
library(arulesViz)
plot(rules,method="scatterplot",measure=c("support","confidence"))
plot(rules, shading="order", control=list(main = "Two-key plot",col=rainbow(5)))
plot(sale2, method="matrix",measure="confidence", control=list(main = "Matriz",col=rainbow(8)))
plot(sale2, method="matrix3d",shading="order", control=list(main = "Tridimensional"))
plot(rules, method="grouped",measure="confidence", control=list(main = "Cluster",k=10,col=rainbow(8)))
plot(sale2[1:10], method="graph",measure="confidence", control=list(main = "Grafo"))

