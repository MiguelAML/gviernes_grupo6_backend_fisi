# Descripción de los Eventos en la base de datos Red-Estudiantil

## Eliminar historias después de las 24 horas
`delete-story-after-24-hours` Es el nombre del evento encargado de recopilar la fecha exacta en que se publicó esta historia,sumarle 1 día a esta fecha y asignar una tarea de eliminación de fila en la tabla `media_story` cuando llegue la hora.