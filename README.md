flutter clean
flutter pub get
flutter run -d chrome

APLICACION BICICORUÑA STATS

Esta app muestra información de las estaciones de bicicletas de A Coruña en tiempo real.  

Se puede:

 1.- Ver tu estación favorita con estadísticas rápidas.
 2.- Ver otras estaciones y sus datos.
 3. Saber si conviene bajar a la estación ahora.
 4.- Generar un PDF con toda la info de la estación.


FUNCIONAMIENTO Y ESTRUCTURA DE LA APLICACION
Pantalla principal: se ve un gráfico de la estación favorita con sus estadísticas de biciletas.
 Pantalla de detalle: se ve un PieChart con bicis mecánicas, e-bikes y anclajes libres, y un bloque que dice “¿Me compensa bajar ahora?”.
 Debajo del bloque hay un botón grande para exportar un PDF con todos los datos.

GRAFICOS:

GRAFICO DE LA ESTACÍON FAVORTITA
Gráfico donde se muestra la estación marcada de favortia y sus estadísitcas
  GRÁFICO ESTADO DE ESTACION
    PieChart mostranndo:
      Bicis mecánicas
      E-bikes
      Anclajes libres  
    Sirve para ver de un vistazo cómo está la estación y decidir si conviene ir.

Justificación de las gráficas elegidas

Gráfico A – Estadísitcas de la estación favvorita

Tipo: Barras (BarChart)
Qué muestra: Las cinco estaciones con más e-bikes disponibles en la ciudad.
Por qué se eligió: Permite ver de un vistazo cuáles estaciones tienen más bicis eléctricas. Ayuda al usuario a decidir rápidamente dónde ir si quiere coger una e-bike. Cumple la regla de aportar información útil, no solo decoración.

Gráfico B – Estado de estacin concreta (PieChart)

Tipo: Donut
Qué muestra: Distribución de bicis mecánicas disponibles, e-bikes disponibles y anclajes libres.
Por qué se eligió: Da una lectura inmediata del estado de la estación. Permite al usuario decidir fácilmente si conviene bajar ahora. Visualmente es más intuitiv que las barras para un solo conjunto de datos.


Genera un PDF con:
    Nombre de la estación
    Estado actual
    Fecha/hora de generación
    Fecha/hora de última actualización

DEPENDENCIAS: 


La aplicación utiliza varias librerías para funcionar correctamente: 
http se usa para hacer las peticiones a la API de las estaciones de bicicletas. 
provider se usa para manejar el estado de la aplicación y que los datos se actualicen automáticamente en la interfaz. fl_chart se utiliza para crear los gráficos de barras y PieChart que muestran la información de las estaciones. 
pdf permite generar archivos PDF con los datos de una estación y printing permite visualizar y exportar esos PDFs desde la aplicación.


CAPTURAS:

Las capturas de pantalla están guardadas dentro de la carpeta CAPTURAS DE PANTALLA, ubicada dentro de la estructura de carpetas del proyecto.
