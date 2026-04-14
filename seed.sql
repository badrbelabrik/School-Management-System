INSERT INTO roles (label)
VALUES("admin"),("prof"),("student");
INSERT INTO users(firstname,lastname,email,password,id_role)
VALUE("badr","belabrik","badr@gmail.com","admin123",1),
("yahya","bahou","yahya@gmail.com","prof123",2),
("khalid","mahmoud","khalid@gmail.com","prof123",2),
("ahmed","mohamed","ahmed@gmail.com","prof123",2),
("karam","hamid","karam@gmail.com","student123",3),
("mourad","chafii","mourad@gmail.com","student123",3),
("hiba","karim","hiba@gmail.com","student123",3);
INSERT INTO courses(title,description,total_hours,id_prof)
VALUES("mathematique","science déductive étudiant les propriétés et relations d'objets abstraits ",150,2),
("physique","sciences physique ",170,3),
("arabe","lettres arabe",120,4);
INSERT INTO classes(name,classroom_number)
VALUES("math",1),
("physique",2),
("arabe",3);
INSERT INTO students(dateofbirth,student_number,id_classe,id_user)
VALUES("1992-07-26",12,1,5),
("1995-09-14",13,2,6),
("1993-01-29",14,3,7);
INSERT INTO enrollments(enrolled_at,status,id_student,id_course)
VALUES("2010-09-05","en cours",1,1),
("2010-09-04","approuvée",2,2),
("2010-09-08","approuvée",2,3);