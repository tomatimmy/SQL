use gamers;

create table new_comment select * from comment;

CREATE TRIGGER modificacion_registro
BEFORE UPDATE ON comment
FOR EACH ROW
INSERT INTO new_comment(id_game, id_system_user, first_date, last_date)
VALUES (new.id_game, new.id_system_user, new.first_date, new.last_date);

CREATE TRIGGER eliminacion_registro
AFTER DELETE ON comment
FOR EACH ROW
INSERT INTO new_comment_2(id_game, id_system_user, first_date, last_date, date_actual, user)
VALUES (old.id_game, old.id_system_user, old.first_date, old.last_date, now(), system_user());


