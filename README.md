# hospital_2eval
ejercicio Hospial 2 eval


Crear una BD para la gestión de un Hospital que incluya la elaboración de un Diagrama MER (o MERE), su diagrama Relacional, diagrama de tablas y código SQL necesario para generar la estructura de tablas correspondiente.

La información que tenemos al respecto incluye:

Empleados: dos tipos de empleados: personal administrativo y personal sanitario (médicos y enfermeros). De todos ellos se almacena su NSS, Nombre y Domicilio (consideraremos el domicilio como un atributo único por simplicidad). De los médicos interesa conocer su especialidad y su número de colegiado, así como sus másteres y otros diplomas que pueda tener. De cada enfermero interesa saber los años de experiencia desde que comenzó a ejercer y si es fijo o interino.

NOTA: por simplicidad prescindiremos de celadores y demás personal para este ejercicio.

Por seguridad de los datos, para mejora de las consultas y para cumplir aspectos legales de la LGPD de forma más sencilla se ha optado por identificar a cada paciente por su número de tarjeta sanitaria, almacenándose información de la foto, tipo de sangre (0+, 0-, A+, A-, B+, B-, AB+, AB-) y alergias conocidas. Aparte se almacenará la información administrativa como Documento identificativo (no tiene por qué ser DNI), NSS, nombre, Domicilio y teléfono. Cada paciente está asociado a una persona (y sólo una). Cada persona puede tener más de un teléfono, sin límite máximo.

Igualmente y por las mismas razones se lleva un historial clínico de cada paciente separado del resto de la información del paciente. Obviamente cada historial clínico corresponde a un único paciente y sólo a uno. En el historial se almacena un histórico de enfermedades, fracturas, etc

Es preciso llevar un control de las consultas externas que cada médico pasa a cada paciente, almacenando fecha y hora y diagnóstico.

También de los medicamentos recetados a cada paciente, así la dosis que se ha recetado en cada caso (1 pastilla cada 8 horas, dos pastillas al día, etc).

Si hay un ingreso hospitalario se anotará también la fecha de ingreso y se le asignará una cama. Las camas están identificadas por un número (1,2,3...) en cada habitación. Hay camas articuladas manualmente, eléctricamente y no articuladas. La habitación se identifica por su número. La primera habitación de la primera planta será la 101, la segunda la 102, etc. La primera de la tercera planta será la 301 y así todas las del hospital. De las habitaciones se almacena si es exterior o interior, si dispone de AA, si dispone de TV y si dispone de toma de oxígeno. Las camas quedan identificadas por su propio número más el número de habitación.

Los médicos también pasan consultas internas a los pacientes ingresados. Estas consultas se almacenan aparte de las consultas externas e incluyen un tratamiento.

En caso de pacientes ingresados se almacena cada tratamiento y qué enfermero administra cada aplicación del tratamiento. No los medicamentos sino tratamientos que precisan ser aplicados por un enfermero como pueden ser: uso de mascarilla de oxígeno en determinados momentos, lavativas, inyecciones intravenosas, etc

Se almacenará la fecha de alta de cada paciente cuando se le dé de alta.

## MERE

[!alert_text]
