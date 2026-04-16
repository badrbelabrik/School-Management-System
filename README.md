
# School-Management-System

EduSync est une plateforme de gestion scolaire conçue pour digitaliser et centraliser les processus administratifs de l'institut Elite Academy


## 1️⃣ Structure de la base de données
La base de données est composée des tables suivantes :

- **roles** : contient les différents types d’utilisateurs (Admin, Prof, Student)
- **users** : stocke les informations de connexion des utilisateurs
- **classes** : représente les classes ou promotions
- **courses** : contient les cours disponibles
- **students** : contient les informations spécifiques aux étudiants
- **enrollments** : table de jointure pour gérer les inscriptions aux cours
## 2️⃣ Relations entre les tables
### 🔹 Roles → Users (1:N)
Un rôle peut être attribué à plusieurs utilisateurs, mais chaque utilisateur possède un seul rôle.
users.role_id → roles.id
### 🔹 Users → Students (1:1)
Chaque étudiant est lié à un seul utilisateur, et chaque utilisateur correspond à un seul étudiant.
students.user_id → users.id
UNIQUE (user_id)
### 🔹 Classes → Students (1:N)
Une classe peut contenir plusieurs étudiants, mais chaque étudiant appartient à une seule classe.
students.class_id → classes.id
### 🔹 Users → Courses (1:N)
Un utilisateur (professeur) peut enseigner plusieurs cours, mais chaque cours est assigné à un seul professeur.
courses.teacher_id → users.id
### 🔹 Students ↔ Courses (N:N)
Un étudiant peut suivre plusieurs cours, et un cours peut avoir plusieurs étudiants.
Cette relation est gérée par la table **enrollments**.
### 🔹 Enrollments (Table de jointure)
enrollments.student_id → students.id
enrollments.course_id → courses.id
UNIQUE (student_id, course_id)
## 3️⃣ Travail réalisé
- Analyse des besoins à partir des user stories
- Conception du schéma relationnel
- Création de la base de données (`structure.sql`)
- Implémentation des contraintes (PK, FK, UNIQUE)
- Création d’un fichier de test (`seed.sql`)
- Insertion de données pour valider le fonctionnement
## 4️⃣ Technologies utilisées
- **MySQL** : gestion de la base de données
- **SQL** : langage de requête
- **Lucidchart** : création du diagramme ERD
- **Jira** : planification de travaille
- **Git & GitHub** : versioning et gestion du projet
## 5️⃣ ERD Diagram
Le diagramme ERD représente visuellement la structure de la base de données ainsi que les relations entre les tables.
[Mon diagramme ERD]([https://lucidchart.com/your-link](https://lucid.app/lucidchart/68020842-1788-462e-b541-12b5038e54ff/edit?viewport_loc=198%2C-66%2C1586%2C689%2C0_0&invitationId=inv_05b2297b-9051-4144-9561-fe82561686fa))
![image alt](https://github.com/badrbelabrik/School-Management-System/blob/3caf4a49834a96db0b9d9135ab3a3f521fd123aa/erd-diagram.png)
