USE red_estudiantil;

-- ASIGNACIÓN DE VARIABLES TEMPORALES DURANTE LA CREACIÓN E IMÁGEN POR DEFECTO
CREATE PROCEDURE SP_REGISTER_USER(IN uidPerson VARCHAR(100), IN fullname VARCHAR(100), IN username VARCHAR(50), IN email VARCHAR(100), IN pass VARCHAR(100), IN uidUser VARCHAR(100), IN temp VARCHAR(50))
BEGIN
	INSERT INTO person(uid, fullname, image) VALUE (uidPerson, fullname, 'avatar-default.png');
	
	INSERT INTO users(uid, username, email, passwordd, person_uid, token_temp) VALUE (uidUser, username, email, pass, uidPerson, temp);
END