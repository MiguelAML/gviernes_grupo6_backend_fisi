# Descripción de los Procedimienots almacenados en la base de datos Red-Estudiantil

## Asignación de variables temporales durante la creación e imágen por defecto

Este procedimiento almacenado busca asignar de forma inmediata la creación de filas en la tabla `users`(usuario) y `person`(persona). Aprovechando esta creación y por regla de negocio,se asigna una imágen por defecto en el pérfil del usuario. 

### Invocación 

El nombre de invocación de este procedimiento almacenado es:

`SP_REGISTER_USER`