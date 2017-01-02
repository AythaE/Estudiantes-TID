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
 
### 02/01/2017
Luego de analizar vimos que la forma de discretizar estos valores es haciendo un replace directo de WAlc y DAlc, por ejemplo "1" = "Muy Bajo"

3. **age** - student's age (numeric: from 15 to 22) -> http://www2.uned.es/iued/comenius21/IMPRIMIR/informe%20portugal.PDF
- 15 a 18 Dentro de edad escolar
- 19 a 22 Fuera de edad escolar
- *puesto que tenemos las edades pero no los grados que cursan, esto sería factible*
7. **Medu** - mother's education (numeric: 0 - none,  1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
- 0 ninguna
- 1 primaria
- 2 5to a 9no grado (podria ser "primaria o secundaria incompleta"?)
- 3 secundaria
- 4 superior
8. **Fedu** - father's education (numeric: 0 - none,  1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
- 0 ninguna
- 1 primaria
- 2 5to a 9no grado (podria ser "primaria o secundaria incompleta"?)
- 3 secundaria
- 4 superior
13. **traveltime** - home to school travel time (numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 ->1 hour)
- 1 menor a 15 m y hasta 30 min -> bajo
- 2 de 30 min a 1 hora          -> medio
- 3 mayor a 1 hora              -> alto
14. **studytime** - weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)
- menor a 2 h y hasta 5 h -> bajo
- de 5 a 10 h             -> medio
- mayor a 10 h            -> alto
15. **failures** - number of past class failures (numeric: n if 1 <= n < 3, else 4) (existen valores de 0 a 4=
- 0 ninguno
- 1 muy bajo
- 2 bajo
- 3 regular
- 4 alto
24. **famrel** - quality of family relationships (numeric: from 1 - very bad to 5 - excellent)
- 1 muy malo
- 2 malo
- 3 bueno
- 4 muy bueno
- 5 excelente
25. **freetime** - free time after school (numeric: from 1 - very low to 5 - very high)
- 1 muy bajo
- 2 bajo
- 3 medio
- 4 alto
- 5 muy alto
26. **goout** - going out with friends (numeric: from 1 - very low to 5 - very high)
- 1 muy bajo
- 2 bajo
- 3 medio
- 4 alto
- 5 muy alto
27. **Dalc** - workday alcohol consumption (numeric: from 1 - very low to 5 - very high)
- 1 muy bajo
- 2 bajo
- 3 medio
- 4 alto
- 5 muy alto
28. **Walc** weekend alcohol consumption (numeric: from 1 - very low to 5 - very high)
- 1 muy bajo
- 2 bajo
- 3 medio
- 4 alto
- 5 muy alto
29. **health** - current health status (numeric: from 1 - very bad to 5 - very good) (estandarizar a *famrel*)
- 1 muy malo
- 2 malo
- 3 bueno
- 4 muy bueno
- 5 excelente
30. **absences** - number of school absences (numeric: from 0 to 93) => en total 94 valores
- 0 a 19 muy bajo 
- 20 a 39 bajo
- 40 a 59 medio
- 60 a 79 alto
- 80 a 93 muy alto
o
- 0 a 30 bajo
- 31 a 61 medio
- 62 a 93 alto
31. **G1** - first period grade (numeric: from 0 to 20) http://internacional.ugr.es/pages/conversion-calificaciones/tablaconversioncalificaciones/!
- 0 a 9   -> suspenso
- 10 a 13 -> aprobado
- 14 a 16 -> notable
- 17 a 18 -> sobresaliente
- 19 a 20 -> opcion Matricula de Honor (Excelente)
31. **G2** - second period grade (numeric: from 0 to 20)
- 0 a 9   -> suspenso
- 10 a 13 -> aprobado
- 14 a 16 -> notable
- 17 a 18 -> sobresaliente
- 19 a 20 -> opcion Matricula de Honor (Excelente)
32. **G3** - final grade (numeric: from 0 to 20, output target)
- 0 a 9   -> suspenso
- 10 a 13 -> aprobado
- 14 a 16 -> notable
- 17 a 18 -> sobresaliente
- 19 a 20 -> opcion Matricula de Honor (Excelente)

