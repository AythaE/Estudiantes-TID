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


