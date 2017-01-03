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

##### Creación de atributo Alc

Crearé un atributo Alc genérico que recoja los atributos Dalc y Walc con el fin de caracterizar el consumo de alcohol general de un individuo. En dicho atributo pesa más el consumo diario de alcohol (Dalc) ya que suele ser más significativo de un alcoholismo mayor. Los valores de dicho atributo en función de Dalc y Walc se recogen en la siguiente tabla (no definitiva, habrá que probar y se pueden modificar valores)

Dalc \ Walc  | Muy bajo | Bajo     | Medio    | Alto     | Muy Alto
-------------|----------|----------|----------|----------|---------
**Muy bajo** | Muy bajo | Muy bajo | Bajo     | Medio    | Alto
**Bajo**     | Bajo     | Bajo     | Medio    | Medio    | Alto
**Medio**    | Bajo     | Medio    | Medio    | Alto     | Muy Alto
**Alto**     | Medio    | Alto     | Alto     | Alto     | Muy Alto
**Muy alto** | Alto     | Alto     | Muy Alto | Muy Alto | Muy Alto

Para crear dicho atributo he usado un Column aggregator para concatenar Dalc y Walc en un atributo Alc y luego un String replace con un diccionario `String Dictionary/students-Alc.csv` en el que he codificado dicha tabla. Los resultados se pueden ver en `student/student-por-transAlc.csv`.

##### Discretización de otros atributos
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

https://en.wikipedia.org/wiki/Quantile
https://www.knime.org/files/nodedetails/_manipulation_column_binning_Auto_Binner.html
