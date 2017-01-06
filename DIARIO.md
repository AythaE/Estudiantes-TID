# Diario de trabajo
En este fichero se recogerá el trabajo realizado en este dataset y servirá como documentación del proceso de extracción del conocimiento y de la memoria del proyecto.

### 25/11/2016
Realizamos un analisis exploratorio de datos utilizando un WorkFlow en [Knime](https://www.knime.org/) según la segunda práctica de TID, preprocesamiento.

Utilizando el nodo "Statistic" hemos comprobado que no hay valores perdidos

Con histograma interactivo hemos comprobado que el consumo medio de alcohol se dispara a partir de los 21 años y es curioso un cambio de tendencia, mientras que los menores de 21 beben más en fines de semana los mayores beben practicamente igual o incluso más entre diario.

Tambien se observa un mayor consumo en hombres pero tampoco muy significativo.

Se puede observar que los que estudian menos de 2 horas a la semana tienen un consumo de alcohol superior a los demás.

Respecto a las notas y el consumo de alcohol los que tienen notas finales inferiores o iguales a 6 (sobre 20)consumen mucho más alcohol.

### 16/12/2016
Viendo box plot o scatter no se ve demasiado, se saca más de los histogramas.

Se ve una correlacion de 0,6 entre el consumo de alcohol los fines de semana y entre diario.

No se observa correlacion de tiempo libre o la edad con el consumo de alcohol, a pesar de lo observado en el histograma con la edad, Esto se debe a que la media de edad es de unos 17 años y hay poca gente de 21 años o más y beben bastante

### 18/12/2016
Preparar los datos para la extracción de asociación (discretización de los atributos numéricos), para luego volcarlos ya discretizados en un nuevo CSV:
+ Atributos Walc y DAlc
   - Ambos de 1 al 5, entonces de Bin 1 a Bin 5, que representaremos como de Muy Bajo a Muy Alto; WAlc = 1 => Muy Bajo = Bin 1 por ejemplo, y DAlc = 5 => Muy Alto = Bin 5

### 02/01/2017 Aythami
Para preparar el dataset para reglas de asociación es necesario convertir la base de datos en trasacional, para ello hay que discretizar los atributos y hacerlos nominales. Para convetir los atributos WAlc y DAlc en lugar de lo anterior usando un autobinner
he usado el nodo number to string para convertir los atributos Walc y Dalc en string y de ahi con string replace y los diccionarios situados en el directorio `String Dictionary` he convertidos ambos atributos a nominales discretos. Tras esto he escrito estos resultados en el fichero `student/student-por-trans.csv`. Se puede encontrar el WorkFlow de knime en `knime/06-AsociacionAythami.knwf`

### 02/01/2017 Marvin
Luego de analizar vimos que la forma de discretizar estos valores es haciendo un replace directo de WAlc y DAlc, por ejemplo "1" = "Muy Bajo"

+ **age**   - student's age (numeric: from 15 to 22) -> http://www2.uned.es/iued/comenius21/IMPRIMIR/informe%20portugal.PDF
  - 15 a 18 Dentro de edad escolar
  - 19 a 22 Fuera de edad escolar
  - *puesto que tenemos las edades pero no los grados que cursan, esto sería factible*
+ **Medu**   - mother's education (numeric: 0   - none,  1   - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
  - 0 ninguna
  - 1 primaria
  - 2 5to a 9no grado (podria ser "primaria o secundaria incompleta"?)
  - 3 secundaria
  - 4 superior
+ **Fedu**   - father's education (numeric: 0   - none,  1   - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
  - 0 ninguna
  - 1 primaria
  - 2 5to a 9no grado (podria ser "primaria o secundaria incompleta"?)
  - 3 secundaria
  - 4 superior
+ **traveltime**   - home to school travel time (numeric: 1   - <15 min., 2   - 15 to 30 min., 3   - 30 min. to 1 hour, or 4 ->1 hour)
  - 1 menor a 15 m y hasta 30 min -> bajo
  - 2 de 30 min a 1 hora          -> medio
  - 3 mayor a 1 hora              -> alto
+ **studytime**   - weekly study time (numeric: 1   - <2 hours, 2   - 2 to 5 hours, 3   - 5 to 10 hours, or 4   - >10 hours)
  - menor a 2 h y hasta 5 h -> bajo
  - de 5 a 10 h             -> medio
  - mayor a 10 h            -> alto
+ **failures**   - number of past class failures (numeric: n if 1 <= n < 3, else 4) (existen valores de 0 a 4=
  - 0 ninguno
  - 1 muy bajo
  - 2 bajo
  - 3 regular
  - 4 alto
+ **famrel**   - quality of family relationships (numeric: from 1   - very bad to 5   - excellent)
  - 1 muy malo
  - 2 malo
  - 3 bueno
  - 4 muy bueno
  - 5 excelente
+ **freetime**   - free time after school (numeric: from 1   - very low to 5   - very high)
  - 1 muy bajo
  - 2 bajo
  - 3 medio
  - 4 alto
  - 5 muy alto
+ **goout**   - going out with friends (numeric: from 1   - very low to 5   - very high)
  - 1 muy bajo
  - 2 bajo
  - 3 medio
  - 4 alto
  - 5 muy alto
+ **Dalc**   - workday alcohol consumption (numeric: from 1   - very low to 5   - very high)
  - 1 muy bajo
  - 2 bajo
  - 3 medio
  - 4 alto
  - 5 muy alto
+ **Walc** weekend alcohol consumption (numeric: from 1   - very low to 5   - very high)
  - 1 muy bajo
  - 2 bajo
  - 3 medio
  - 4 alto
  - 5 muy alto
+ **health**   - current health status (numeric: from 1   - very bad to 5   - very good) (estandarizar a *famrel*)
  - 1 muy malo
  - 2 malo
  - 3 bueno
  - 4 muy bueno
  - 5 excelente
+ **absences**   - number of school absences (numeric: from 0 to 93) => en total 94 valores
  - 0 a 19 muy bajo
  - 20 a 39 bajo
  - 40 a 59 medio
  - 60 a 79 alto
  - 80 a 93 muy alto
  - *o tambien*
  - 0 a 30 bajo
  - 31 a 61 medio
  - 62 a 93 alto
+ **G1**   - first period grade (numeric: from 0 to 20) http://internacional.ugr.es/pages/conversion-calificaciones/tablaconversioncalificaciones/!
  - 0 a 9   -> suspenso
  - 10 a 13 -> aprobado
  - 14 a 16 -> notable
  - 17 a 18 -> sobresaliente
  - 19 a 20 -> opcion Matricula de Honor (Excelente)
+ **G2**   - second period grade (numeric: from 0 to 20)
  - 0 a 9   -> suspenso
  - 10 a 13 -> aprobado
  - 14 a 16 -> notable
  - 17 a 18 -> sobresaliente
  - 19 a 20 -> opcion Matricula de Honor (Excelente)
+ **G3**   - final grade (numeric: from 0 to 20, output target)
  - 0 a 9   -> suspenso
  - 10 a 13 -> aprobado
  - 14 a 16 -> notable
  - 17 a 18 -> sobresaliente
  - 19 a 20 -> opcion Matricula de Honor (Excelente)

### 03/01/2017 Aythami
Tengo algunas modificaciones sobre el modelo de discretización propuesto por @mmaguero en la entrada anterior
  + **age**   - student's age (numeric: from 15 to 22) -> Solo los 2 intervalos propuestos probablemente sean demasiado poco, se podría hacer una discretización basada en cuartiles (lo cual sería más acorde con el número de alumnos) con un Auto-Binner como la propuesta en la práctica 6 donde en función de las edades nos diera 4 intervalos ("Bin 1 - Bin 4") que con un String replace se podrían sustituir por ejemplo a (entre paréntesis se indican los cuartiles y los intervalos concretos de edad a los que corresponderían):

    - Bin 1: Muy joven (< q1 = [15, 16])
    - Bin 2: Joven (> q1 && < q2 = (16, 17])
    - Bin 3: Mayor (> q2 && < q3 = (17, 18])
    - Bin 4: Muy Mayor (> q3 = (18, 22])


  + **studytime**   - weekly study time (numeric: 1   - <2 hours, 2   - 2 to 5 hours, 3   - 5 to 10 hours, or 4   - >10 hours)
  En lugar de 3 valores solo para que perder información (al menos inicialmente) se podría convertir directamente a la siguiente escala (como se hace en la práctica 6)

    - 1 bajo
    - 2 medio
    - 3 alto
    - 4 muy alto


  + **traveltime**   - home to school travel time (numeric: 1   - <15 min., 2   - 15 to 30 min., 3   - 30 min. to 1 hour, or 4 ->1 hour)
  En lugar de 3 valores solo para que perder información (al menos inicialmente) se podría convertir directamente a la siguiente escala (como se hace en la práctica 6)

    - 1 bajo
    - 2 medio
    - 3 alto
    - 4 muy alto


  + **failures**   - number of past class failures (numeric: n if 1 <= n < 3, else 4) En realidad solo existen valores entre 0 y 3 en el dataset aunque la definición del atributo diga que puede haber hasta 4

    - 0 ninguno
    - 1 muy bajo
    - 2 medio
    - 3 alto


  + **absences**   - number of school absences (numeric: from 0 to 93) => en total 94 valores.
  Como no se sabe como están los valores también emplearía una discretización por intervalos (entre paréntesis se indican los cuartiles y los intervalos concretos de faltas a los que corresponderían)

    - Bin 1: Cero (< q1 = [0])
    - Bin 2: Pocas (> q1 && < q2 = (0, 2])
    - Bin 3: Bastantes (> q2 && < q3 = (2, 6])
    - Bin 4: Muchas (> q3 = (6, 32])


  + **health**   - current health status (numeric: from 1   - very bad to 5   - very good) (estandarizar a *famrel*)
    - 1 muy mala
    - 2 mala
    - 3 normal
    - 4 buena
    - 5 muy buena

#### Creación de atributo Alc

Crearé un atributo Alc genérico que recoja los atributos Dalc y Walc con el fin de caracterizar el consumo de alcohol general de un individuo. En dicho atributo pesa más el consumo diario de alcohol (Dalc) ya que suele ser más significativo de un alcoholismo mayor. Los valores de dicho atributo en función de Dalc y Walc se recogen en la siguiente tabla (no definitiva, habrá que probar y se pueden modificar valores)

Dalc \ Walc  | Muy bajo | Bajo     | Medio    | Alto     | Muy Alto
-------------|----------|----------|----------|----------|---------
**Muy bajo** | Muy bajo | Muy bajo | Bajo     | Medio    | Alto
**Bajo**     | Bajo     | Bajo     | Medio    | Medio    | Alto
**Medio**    | Bajo     | Medio    | Medio    | Alto     | Muy Alto
**Alto**     | Medio    | Alto     | Alto     | Alto     | Muy Alto
**Muy alto** | Alto     | Alto     | Muy Alto | Muy Alto | Muy Alto

Para crear dicho atributo he usado un Column aggregator para concatenar Dalc y Walc en un atributo Alc y luego un String replace con un diccionario `String Dictionary/students-Alc.csv` en el que he codificado dicha tabla. Los resultados se pueden ver en `student/student-por-transAlc.csv`.

#### Discretización de otros atributos
Adicionalmente me he encargado de discretizar y convertir en transacionales los siguientes atributos según la discretización comentada previamente entre @mmaguero y @aythae.

- **goout**
- **health**
- **absences**
- **G1, G2, G3**

Pueden encontrarse sus diccionarios en el directorio correspondiente y en el archivo `student/student-por-trans.csv` la salida de este proceso.

### 03/01/2017 Marvin
Discretizando age, con numeric binner, se pueden controlar mejor los rangos, pero queremos basarnos en el criterio que utiliza auto binner, para utilizarlo en la mayoria de los atributos aplicables, o hacer un replace

Se crean los diccionarios para age, studytime, traveltime, failures, fedu, medu, freetime, famrel en el directorio ´String Dictionary´; el primero usa un *auto-binner* y los demás un *string replace*

Ahora debemos unificar todas las discretizaciones para formar el dataset final, desechando los que no creamos necesarios, de todas maneras debemos evaluar si es necesario hacer un analisis estadistico nuevamente, pero esta vez sobre el dataset construido a partir de este proceso

Fuentes:
+ https://en.wikipedia.org/wiki/Quantile
+ https://www.knime.org/files/nodedetails/_manipulation_column_binning_Auto_Binner.html

#### Unificación de atributos discretizados en un sólo workflow

Se sube en *knime/06-Asociacion* en *06-NumericoADiscreto* el resultado de las discretización total del dataset, formando uno nuevo en student/student-por-trans-discret.csv a partir del cual ahora se podrán trabajar para hallar las reglas de asociación en un workflow nuevo: podriamos trabajar con las herramientas nativas de knime o agregar los plugins de Weka para tambien trabajar con ellos.

Si uno quiere replicar el proceso basta en clonar o descargar el repositorio, importar en knime *knime/06-Asociacion*, abrir *06-NumericoADiscreto* y cambiar las rutas al directorio *String Dictionary/* para cada uno de los archivos requeridos

#### Buscar reglas de asociacion

Cree un workflow en knime en *knime/06-Asociacion*, *06-ExtraccionReglasAsociacion* en base al cvs creado ya discretizado, agregué 4 atributos (school, dalc, walc, g3) al *column collection* y para el *asociation rule learner* para soporte 0.15 y para confianza 0.75, obteniendo 9 reglas y las siguientes deducciones, ver en *imgs/InteractiveTableWA-DA-School-G3*:

+ Con soporte de 0.146, una confianza de 0.99 y lift 1.424. El valor de soporte expresa que en el 14.6% de las transacciones estuvieron involucrados alumnos con DA-Muy Bajo y WA-Muy Bajo, G3-Aprobado, School-GP. Según el valor de confianza, aproximadamente el 99% de las transacciones que contienen DA-Muy Bajo, también contienen WA-Muy Bajo, G3-Aprobado, School-GP.

+ Con soporte de 0.14, una confianza de 0.812 y lift 1.169. El valor de soporte expresa que en el 14% de las transacciones estuvieron involucrados alumnos con DA-Muy Bajo y G3-Notable, School-GP. Según el valor de confianza, aproximadamente el 81.2% de las transacciones que contienen DA-Muy Bajo, también contienen G3-Notable, School-GP.  

+ Con soporte de 0.205, una confianza de 0.985 y lift 1.418. El valor de soporte expresa que en el 20.5% de las transacciones estuvieron involucrados alumnos con DA-Muy Bajo y WA-Muy Bajo, G3-Aprobado. Según el valor de confianza, aproximadamente el 98.5% de las transacciones que contienen DA-Muy Bajo, también contienen WA-Muy Bajo, G3-Aprobado.

Fuentes:
+ http://scielo.sld.cu/scielo.php?script=sci_arttext&pid=S2227-18992015000400003

+ http://eric.univ-lyon2.fr/~ricco/tanagra/fichiers/en_Tanagra_Assoc_Rules_Comparison.pdf

+ http://elvex.ugr.es/decsai/intelligent/workbook/D2%20Association.pdf

### 04/01/2017 Aythami

#### Limpieza repositorio
Ahora que hemos unido los resultados de discretizar se pueden borrar los resultados intermedios para una mayor limpieza y claridad, por ello modificaré los siguientes ficheros:

- Borraré `knime/06-AsociacionAythami.knwf` ya que ha sido integrado dentro de `knime/06-Asociacion.knwf`, en concreto en workflow `06-NumericoADiscreto`.

- Borraré  `student/student-por-N2D-8primeros.csv`,  `student/student-por-trans.csv` y `student/student-por-transAlc.csv` por estar unidos todos en el fichero `student/student-por-trans-discret.csv`.

- Renombraré los ficheros ubicados en `String Dictionary/` con extension `.txt` para que tengan extensión `.csv`.


#### Comentarios sobre extracción de reglas de asociación

Al empezar a extraer reglas en el workflow `06-ExtraccionReglasAsociacion`, donde se encuentra este trabajo, importando el dataset unificado (`student/student-por-trans-discret.csv`) me he percatado que aunque todos los atributos sean discretos y nominales hay algunos que se ha convertido directamente a nominales sin anteponerles un prefijo, por lo que a la hora de extraer reglas no se sabría a que atributo pertenece cada valor exactamente. En concreto los atributos que pueden dar problemas por compartir valores son:

- Mjob (String)
- Fjob (String)
- reason (String)
- guardian (String)
- schoolsup (String)
- famsup (String)
- paid (String)
- activities (String)
- nursery (String)
- higher (String)
- internet (String)
- romantic (String)

Además de estos hay otros atributos con valores sin prefijo aunque no comparten valores sería recomendable anteponer un prefijo por claridad y consistencia con el resto de atributos.

**He discretizado y usado diccionarios como hasta ahora con la lista previa de atributos** con el objetivo de poder introducir todos los atributos en el Association Rule learner. El resultado de esto se puede encontrar en `student/student-por-transacional.csv`

Viendo los apuntes pone como ejemplo para la extracción de reglas de asociación un *minsup* para las reglas de entre 5% y 10% y una *minconf* de 60-70%.

Tener cuidado con las reglas con consecuentes que tengan un alto soporte (están en casi todos los item) ya que cualquier antecedente parece buen predictor por falta de variabilidad. Esto se conoce como dependencia negativa o independencia. Para comprobar esto se puede usar la siguiente fórmula

```
if (Conf (A => C) > supp (C))
  Regla no se descarta
else
  Regla descartada por dependencia negativa o independencia
```

Para medir esto se usa el interés o **lift** que es una relación entre la confianza de la regla y el soporte del antecedente.
- Si lift > 1: El antecedente tiene un efecto positivo en la aparición del consecuente.
- Si lift < 1: El antecedente tiene un efecto negativo en la aparición del consecuente.
- Si lift ~= 1: El antecedente no tiene  efecto en la aparición del consecuente.

Según los apuntes del tema el **Factor de certeza (CF o F)** es más interesante que el lift ya que cumple mejor las propiedades para medidas de cumplimiento que este y resuelve alguno de los inconvenientes del lift. Es una medida acotada entre [-1, 1] y una regla es más significativa cuanto mayor sea el valor. Sería interesante mirar como calcular esto para las reglas. He estado consultando como calcularlo tanto en R como en Knime sin ningun resultado así que a otra cosa.

#### Extracción reglas de asociación con todos los atributos
He realizado una extracción de reglas de asociación con el workflow `06-ExtraccionReglasAsociacion` añadiendo todos los atributos de DataSet a la colección. Como parametros del "Association Rule Learner" los siguientes:
- Support minimo: 0,12
- Maximal itemset Lenght: 40
- Confianza mínima: 0,9

Los resultados son 328217 reglas que he guardado en el archivo `Association_rules/Association_rules_all_atrib.xls`.

Como comentario tarda bastante en cargar y he tenido que incrementar la memoria de Knime a 4GB para que llegara a finalizar de calcular las reglas de asociación.

### 04/01/2017 Marvin

Haciendo otro poco de exploratorio se puede ver en el histogram los adolescentes al cuidado de la madre consumen más alcohol, que los cuidados por el padre y otros, sin embargo en scatter plot vemos que en realidad son muchos lo que están al cuidado de la madre, más bien los que están al cuidado del padre tiene consumo de alcohol alto, inclusive que los cuidados por otros

Supongo que ver en las reglas de asociacion seria lo mejor

#### Extracción reglas de asociación sin DAlc y WAlc
Tambien he realizado una extracción de reglas de asociación con el workflow `06-ExtraccionReglasAsociacion` excluyendo DAlc y WAlc del DataSet de la colección. Como parametros del *Association Rule Learner* los siguientes:
- Support minimo: 0,12
- Maximal itemset Lenght: 96
- Confianza mínima: 0,7

Los resultados son 620498 reglas que he guardado en el archivo `Association_rules/Association_rules_-dalc-walc_0.7conf`.

Como comentario tarda bastante en cargar y he tenido que incrementar la memoria de Knime a 5.8GB para que llegara a finalizar de calcular las reglas de asociación.

#### Extracción reglas de asociación con Weka

Nodo “A priori”, que implementa una forma iterativa del algoritmo “Apriori” que reduce el soporte desde una cota superior hasta otra inferior.

Donde puede verse el mecanismo de generación de ítem-sets frecuentes, la propiedad a
priori y el hecho de que el análisis de reglas con una salida de este tipo es complejo.
La mayor ventaja de esta forma de Weka es que permite extraer reglas de asociación
considerando un atributo consecuente que sería el que se pretende predecir como una
clase. Para ello:

- Se selecciona la opción car a true
- Se selecciona a 34(exluyendo WAlc y DAlc: 32) el parámetro classindex para predecir el atributo
*Alc*, (de todas formas si se deja a -1 también funcionaría para
predecir)

##### Extracción reglas de asociación con todos los atributos con Weka

+ Parametros command line, consecuente Alc
  - -I -N 100 -T 0 -C 0.9 -D 0.05 -U 1.0 -M 0.12 -S -1.0 -A -c 34
  - -I -N 100 -T 0 -C 0.9 -D 0.05 -U 1.0 -M 0.12 -S -1.0 -A -V -c 34

Ver en `Association_rules/Apriori_conf0.9_supp0.12_100rules-Verb-F` y `Association_rules/Apriori_conf0.9_supp0.12_100rules-Verb-T`

##### Extracción reglas de asociación sin DAlc y WAlc con Weka

+ Parametros command line, consecuente Alc
  - -I -N 100 -T 0 -C 0.7 -D 0.05 -U 1.0 -M 0.12 -S -1.0 -A -c 32
  - -I -N 100 -T 0 -C 0.7 -D 0.05 -U 1.0 -M 0.12 -S -1.0 -A -V -c 32

Ver en `Association_rules/Apriori_conf0.7_supp0.12_100rules-Verb-F-Alc` y `Association_rules/Apriori_conf0.7_supp0.12_100rules-Verb-T-Alc`

### 04/01/2017 Aythami

He limpiado los workflow de asociación sustituyendo el de `06-PreparacionReglasAsociacion` (workflow parcial de @mmaguero) por `06-NumericoADiscreto` que contiene la preparación total del dataset.

He incorporado el nodo "Apriori" de Weka al workflow `06-ExtraccionReglasAsociacion`, con los mismos parámetros de soporte minimo (0.12) y confianza (0.9) obteniendo las 100 mejores reglas y mostrando los itemset frecuentes. El resultado de esto se puede encontrar en el fichero `Association_rules/Apriori_conf0.9_supp0.12_100rules.txt`.

#### Busqueda de ideas en paper
No parecen seguir un método muy cientifico, obtienen un atributo Alc genérico mediante una media ponderada de Dalc y Walc, con esto la binarizan mediante el siguiente pseudocodigo:
```
if Alc < 3
  then Alc = 0
else
  Alc = 1
```
Además de esto realizan una fusión de los estudiantes de portugués y matemáticas (aunque hay estudiantes repetidos pero no queda claro como los eliminan). Tras esto aplican correlación lineal y filtran aquellos atributos que tengan poco que ver con Alc, en concreto eliminan Fedu y las notas de las 3 evaluaciones. Usan validación cruzada junto con Random forest para elaborar su predicción. Tras esto seleccionan los mejores arboles y calculan el **porcentaje de impacto de las variables sobre el atributo Alc** usando una ecuación. Sus resultados son los siguientes:

Attribute                       | Percentage
--------------------------------|-----------
Male                            | 25.35%
Social                          | 21.13%
More Free time                  | 9.39%
Less study time                 | 8.45%
Mother less educational quality | 7.98%
Good Health                     | 7.04%
No Higher education             | 4.23%
No family support               | 3.76%
Small family                    | 3.76%
High travel time                | 1.88%
Less activities                 | 1.88%
No support school               | 1.88%
Father work                     | 1.88%
Internet connectivity           | 1.41%

Tras esto miden la calidad de su modelo de clasificación obteniendo una tasa de error de 8.018% lo cual es aceptable.

#### Trabajando con R
He empezado a trabajar con R como se puede ver en la carpeta `R/`. El objetivo es realizar una extracción de reglas apriori aprovechando el mayor poder y flexibilidad de R y representar dichas reglas gráficamente. En concreto he creado el script `R/asociacionApriori_Y_Plots.R`.

He creado una gráfica que muestra los items más frecuentes con un soporte >= 0,3, dicha gráfica se encuentra en `imgs/Frec Items con soporte mayot 0.3.png`.

Es necesario filtrar las columnas de Dalc y Walc para utilizar solo Alc ya que estos atributos aparecen constantemente juntos al estar muy correlacionados.


### 05/01/2017 Marvin

Todas las reglas de asociacion hechas con weka o knime, arrojan en mayor cantidad Alc-Muy Bajo como consecuente Alc. Viendo esto en un histograma sobre el dataset transaccional, ya discretizado, nos fijamos que Alc-Muy bajo tiene más del 50% de peso sobre el conjunto (ver *imgs/histogramTransAlc*):
Alc
- Muy Bajo 354
- Bajo 102
- Medio 116
- Alto 44
- Muy Alto 33

Entonces, estamos frente a un dataset de no bebedores, si sumamos Los 3 primeros contra los 2 siguientes, tenemos 572 contra 77, si sumamos los 2 primeros contra los 3 siguientes 456 contra 193

#### Migrar a una bd

Como los csv se hacen enormes, pasé a migrar, más bien conectar, *OpenOffice Database* hace una conexion directa a la fuente csv para poder filtrar usando sql...
`
select * from "Association_rules_-dalc-walc_0.7conf"
where consequent like '%Alc%'
order by Confidence DESC, Lift DESC, Support ASC`

Lo primero que se debe hacer es instalar OpenOffice version 4.1.3, conectar a una base de datos existente, seleccionar texto, ingresar la ubicacion del archivo, elegir el tipo (csv, txt) e ingresar el delimitador de campos. Con cada csv existente en la ubicacion seleccionada se creara como una tabla en OpenOffice Database.

Estas son las reglas de knime, eventualmente las de R, pero para Weka toca hacer analisis mirando el txt...

##### Nodo Value Filter de knime

Se ha probado el Value Filter de knime, filtrando los valores posibles de Alc, sin embargo ninguno arrojo reglas que antes no pudimos generar, o que sean determinantes, por eso se desechan, sin embargo el Value Filter resulta util para filtrar fuente de datos, actua como *where* de SQL

Lo propio se hizo para Weka, pero tampoco se encontraron reglas muy importantes o determinantes que nantes no habiamos logramos

##### Alc Binario en Knime y Weka

Knime tiene problemas al generar las reglas de asociacion, incluso subiendole la memoria dedicada hasta 6.5 GB, queda procesandolo en 94-97% sin llegar a culminarlo en hora y media: supp 0.05 y conf 0.7. Entonces a pase a probar, con un Value Filter, para Alc-si y otro para Alc-no:

Configurando supp con 0.175 y conf 0.75 tanto para Alc-Si y Alc-No, se crean reglas generales pero ninguna para Alc especifica como consecuente.

Volvi a probar el general de atributos con supp 0.155 y conf 0.7, arrojando reglas para Alc-no unicamente, la de mayor preponderancia, se ha añadido a un rar el csv generado y la bd de OpenOffice, de esta manera es más facil consultar las reglas, aplicando los filtros necesarios: *Association_rules\Association_rules_alc_0.7conf_0.155supp*

Con Weka se puede obtener sin problemas sobre el total de atributos, obviando dalc y walc, las 100 primeras mejores reglas, todas indicando que son Alc-No *Association_rules/Apriori_conf0.7_supp0.05_100rules-Verb-T-AlcSN.txt*. Entonces con Value Filter, se volvio a generar sobre el mismo dataset, pero una asociacion para Alc-Si *Association_rules/Apriori_conf0.7_supp0.05_100rules-Verb-T-AlcSN-FilterSi.txt*  y otra para Alc-No *Association_rules/Apriori_conf0.7_supp0.05_100rules-Verb-T-AlcSN-FilterNo.txt*

- conf 0.7
- supp 0.05

Aqui asumimos el algoritmo *apriori* implementado por Weka como mejor a el que implementa Knime para la creacion de las reglas de asociacion. Quizas con una computadora de mayores capacidades se pueda sacar más informacion de knime, aunque Weka con su nodo apriori, cumple para una analisis mas rapido y menos que el de knime.

#### Conclusiones análisis en Weka y Knime

##### Knime

Ver *imgs/ODB-Knime-Rules-Alc-No*

`SELECT * FROM "Association_rules_alc_0.7conf_0.155supp" WHERE "Consequent" LIKE '%Alc%' AND "Lift" > 1.0 ORDER BY "Support" ASC,  "Confidence" DESC, "Lift" DESC`

+ Support 0,16
+ Confidence 0,86 a 0,84
+ Lift de 1,22 a 1,20

* Regla 1 = Jovenes de Sexo femenino, sin Soporte educacional extra, Familia mayor a 3, con ningun suspenso, sin clases extras pagadas y que curiosamente han asistido a enfermeria alguna vez tienen tendencia a **Alcohol no**

- ScSup-no 6
- F 8
- GT3 6
- FAIL NINGUNO 6
- paid no 5
- Nurse yes 5

Alcohol si, no se encontro nada para knime.

##### Weka

###### Sobre todos sin filtrar con Value Filter, solo **Alc-no**

Apriori
=======

Minimum support: 0.4 (260 instances)
Minimum metric <confidence>: 0.7
Number of cycles performed: 12

 1. sex=F schoolsup=ScSup-no paid=Paid-no 318 ==> Alc=Alc-No 260    conf:(0.82)
  2. sex=F schoolsup=ScSup-no 332 ==> Alc=Alc-No 269    conf:(0.81)
  3. sex=F failures=Fail-Ninguno 329 ==> Alc=Alc-No 266    conf:(0.81)
  4. sex=F paid=Paid-no 366 ==> Alc=Alc-No 295    conf:(0.81)
  5. sex=F paid=Paid-no higher=High-yes 333 ==> Alc=Alc-No 267    conf:(0.8)
  6. sex=F 383 ==> Alc=Alc-No 307    conf:(0.8)
  7. sex=F Pstatus=T 329 ==> Alc=Alc-No 263    conf:(0.8)
  8. sex=F higher=High-yes 348 ==> Alc=Alc-No 277    conf:(0.8)
  9. famsize=GT3 failures=Fail-Ninguno higher=High-yes 356 ==> Alc=Alc-No 269    conf:(0.76)
 10. famsize=GT3 failures=Fail-Ninguno paid=Paid-no 356 ==> Alc=Alc-No 268    conf:(0.75)
 11. failures=Fail-Ninguno schoolsup=ScSup-no paid=Paid-no nursery=Nurs-yes higher=High-yes 350 ==> Alc=Alc-No 263    conf:(0.75)

 Confianza de 0.82 a 0.75
 
Sexo Femenino, sin soporte educacional extra, sin suspensos, no pagan clases extras, quieren ir a la universidad tienden al alcohol bajo. Ademas van en el colegio GPm familia mayor a 3

###### Alc-Si con Value Filter

Apriori
=======

Minimum support: 0.5 (96 instances)
Minimum metric <confidence>: 0.7
Number of cycles performed: 10

1. paid=Paid-no 178 ==> Alc=Alc-Si 178    conf:(1)
  2. schoolsup=ScSup-no 176 ==> Alc=Alc-Si 176    conf:(1)
  3. Pstatus=T 173 ==> Alc=Alc-Si 173    conf:(1)
  4. higher=High-yes 165 ==> Alc=Alc-Si 165    conf:(1)
  5. schoolsup=ScSup-no paid=Paid-no 161 ==> Alc=Alc-Si 161    conf:(1)
  6. Pstatus=T paid=Paid-no 158 ==> Alc=Alc-Si 158    conf:(1)
  7. Pstatus=T schoolsup=ScSup-no 156 ==> Alc=Alc-Si 156    conf:(1)
  8. internet=Inet-yes 153 ==> Alc=Alc-Si 153    conf:(1)
  9. failures=Fail-Ninguno 152 ==> Alc=Alc-Si 152    conf:(1)
 10. paid=Paid-no higher=High-yes 150 ==> Alc=Alc-Si 150    conf:(1)
 
 Confianza del 100%
 
 Sin soporte educacional extra, no pagan clases extras, los padre viven juntos, desean ir a la universidad, sexo masculino, escuela urbana, en la escuela GP
 
 ####### Alc-No Value Filter
 
 Apriori
=======

Minimum support: 0.6 (274 instances)
Minimum metric <confidence>: 0.7
Number of cycles performed: 8

1. paid=Paid-no 432 ==> Alc=Alc-No 432    conf:(1)
  2. higher=High-yes 415 ==> Alc=Alc-No 415    conf:(1)
  3. schoolsup=ScSup-no 405 ==> Alc=Alc-No 405    conf:(1)
  4. failures=Fail-Ninguno 397 ==> Alc=Alc-No 397    conf:(1)
  5. Pstatus=T 396 ==> Alc=Alc-No 396    conf:(1)
  6. paid=Paid-no higher=High-yes 394 ==> Alc=Alc-No 394    conf:(1)
  7. schoolsup=ScSup-no paid=Paid-no 387 ==> Alc=Alc-No 387    conf:(1)
  8. failures=Fail-Ninguno paid=Paid-no 377 ==> Alc=Alc-No 377    conf:(1)
  9. Pstatus=T paid=Paid-no 376 ==> Alc=Alc-No 376    conf:(1)
 10. failures=Fail-Ninguno higher=High-yes 374 ==> Alc=Alc-No 374    conf:(1)
 
 Confianza del 100%
 
 No pagan clases extras, quieren ir a la universidad, sin soporte educacional extra, sin suspensos, urbano, sexo femenino, familia mayor a 3, escuela Gp, padres juntos tienden a bajo consumo de alcohol


### 05/01/2017 Aythami

#### Continuando trabajo con R
He filtrado las columnas que menciono en el apartado previo y he aplicado el algoritmo Apriori unas cuantas veces retocando parámetros llegando a un mínimo de:
- Soporte mínimo: 0,05
- Confianza mínima: 0,7
- Longitud de reglas: [2, 10]

Aún así solo he obtenido reglas que tienen como consecuente "Alc-Muy bajo", esto se debe a que los valores del atributo Alc están muy desequilibrados existiendo muuuchos más Alc-Muy bajo que de ninguna otra clase. En total he obtenido 64815 reglas con la configuración previa, las cuales se encuentran en `Association_rules/Apriori_R_conf0.7_supp0.05_allRules.txt.zip`. Además de esto he generado diversas gráficas para visualizar las reglas, estas gráficas en concreto son:
- `imgs/Graph_plot_R_ReglasAlc_conf0.7_supp0.05.png`
- `imgs/Scatter_plot_R_ReglasAlc_conf0.7_supp0.05_lift.png`
- `imgs/Scatter_plot_R_ReglasAlc_conf0.7_supp0.05_tamReglas.png`

#### Limpieza repositorio
Voy a borrar el fichero `student/student-por-trans-discret.csv` ya que en este no están los atributos binarios transformados para ser transaccionales. El fichero definitivo es `student/student-por-transacional.csv`.

#### Binarizando Alc
Como ha indicado @mmaguero [el atributo Alc está muy desequilibrado](#05012017-marvin) por ello voy a binarizándolo de la siguiente manera:

Alc previo   | Alc binarizado
-------------|---------------
Alc-Muy bajo | Alc-No
Alc-Bajo     | Alc-No
Alc-Medio    | Alc-Si
Alc-Alto     | Alc-Si
Alc-Muy alto | Alc-Si

Como se puede ver en la imagen `imgs/histogramTransAlcBin.png` teniendo 2 clases aunque sigan siendo desequilibradas esperamos que la agrupación de valores permita extraer mejores reglas de asociación.

Esta binarización se ha llevado a cabo en el workflow `06-Asociacion/06-BinarizacionAlc` y el resultado se encuentra en fichero `student/student-por-transacional-Alc-bin.csv`.

#### Extracción de reglas de asociación con Alc binario en R
Para ello he creado el script `R/asociacionApriori_Y_Plots_AlcBin.R` el cual sigue prácticamente el mismo flujo que seguía el script con Alc no binario. Tras extraer **847840** reglas de asociación con el algoritmo `Apriori` con los siguientes parámetros:

- Soporte mínimo: 0,05
- Confianza mínima: 0,7
- Longitud de reglas: [2, 10]

Filtro aquellas que tengan como consecuente Alc y las ordeno por confianza. Tras ello las guardo en el archivo `Association_rules/Apriori_R_conf0.7_supp0.05_AlcBin.txt.zip` en formato txt, tras esto he separado las reglas creando 2 conjuntos, los que tienen como consecuente **Alc-No** (Alc-Muy bajo y Alc-Bajo) y los que tienen **Alc-Si** (Alc-Medio, Alc-Alto y Alc-Muy alto). Estas reglas se encuentran guardadas en los ficheros `Association_rules/Apriori_R_conf0.7_supp0.05_AlcBin-No.txt.zip` y `Association_rules/Apriori_R_conf0.7_supp0.05_AlcBin-Si.txt` respectivamente. Para finalizar y mejorar la comprensión de estas reglas he creado una serie de gráficas para representarlas:

- `imgs/Scatter_plot_R_ReglasAlc-Binario_conf0.7_supp0.05_lift.png` en la que se representa en forma de scatter plot las reglas respecto a su soporte y confianza además de su lift que se representa con el color. Destaca que se ven 12 puntos mucho más oscuros que el resto (con + lift), esto se debe a que estas reglas son las que tienen como consecuente "Alc-Si".
- `imgs/Scatter_plot_R_ReglasAlc-Binario_conf0.7_supp0.05_tamReglas.png` donde representa lo mismo pero esta vez el color marca el tamaño de las reglas (antecedentes + consecuentes) con reza la leyenda.
- `imgs/Graph_plot_R_ReglasAlc-no_conf0.7_supp0.05.png` que representa mediante una gráfica de grafo los antecedentes que forman las 10 reglas de asociación mejores (con mayor confianza) que tienen como consecuente **Alc-No**, es decir los principales factores que lo determinan. Se puede ver que todas tienen una confianza de 1 y un lift de 1.423. Cabe destacar que teniendo en cuenta el desequilibrio de las clases (456 Alc-No contra 193 Alc-Si) es fácil caer en problemas de dependencias negativas y muchos valores predicen bien Alc-No, esto puede explicar inconsistencias como que aparezcan como principales factores Actividades extra escolares si y no o que mientras que sin binarizar se caracteriza el Alc-Muy bajo por vivir en la ciudad aquí aparezca vivir en zona rural.
- `imgs/Graph_plot_R_Alc-si_conf0.7_supp0.05.png` que representa mediante una gráfica de grafo los antecedentes que forman las 10 reglas de asociación mejores (con mayor confianza) que tienen como consecuente **Alc-Si**, es decir los principales factores que lo determinan. Cabe destacar que todas estas reglas tienen un lift mucho más alto que las previas [2,556-2,845] lo que indica hasta que punto ocurren conjuntamente los antecedentes y Alc-Si más o menos de lo esperado si fuesen independientes (lift = 1). En este caso si que se encuentrán diferentes confianzas [0,76-0,846].

#### Conclusiones análisis en R
Como se ha ido indicando a lo largo de este diario, la extracción de reglas de asociación que predigan Alc-Si o Alc-No es bastante más significativa que haciendolo sobre la escala de Muy bajo - Muy alto ya que el importante desequilibrio de las clases descarta casi todos los valores a excepción de Muy bajo por no tener suficiente soporte para entrar en las reglas de asociación. De igual manera, como se puede apreciar en los diagramas de grafo de una forma intuitiva, los factores que caracterizan el **consumo de alcohol muy bajo y el no consumo de alcohol** (bajo o muy bajo) son prácticamente los mismos:
- Mujer
- Quiere estudiar en la universidad
- No hacer demasiada vida social
- Ser aplicadas en los estudios (se ve en cosas como obtener notables, emplear un tiempo de estudio alto, no ir a clases particulares o de la escuela y no haber suspendido ninguna asignatura)

Lo cual es consistente con lo obtenido respecto al **consumo de alcohol medio o superior**:
- Hombre
- Alta vida social
- Sin embargo no se ha encontrado una relación entre los estudios y el consumo de alcohol moderado o elevado.

Esto también es similar a los resultados obtenidos en la investigación llevada a cabo en el Paper en la que concluyen que esos 2 factores son los más determinantes para predecir el consumo de alcohol mediante árboles de decisión.
