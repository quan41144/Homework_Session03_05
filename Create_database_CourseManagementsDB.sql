-- Create database CourseManagementsDB
create database Course_ManagementsDB;
-- Create schema course_management
create schema course_management;
-- Create table students
create table course_management.students(
	student_id bigserial primary key,
	student_name varchar(200) not null,
	student_email varchar(200) not null unique,
	registration_date date not null
);
-- Create table instructors
create table course_management.instructors(
	instructor_id bigserial primary key,
	instructor_name varchar(100) not null,
	instructor_major varchar(100) not null,
	instructor_phone varchar(15) not null unique
);
-- Create table courses
create table course_management.courses(
	course_id bigserial primary key,
	course_name varchar(200) not null,
	course_description text,
	course_price numeric(15,2) default 0
);
-- Create table class
create table course_management.classes(
	class_id bigserial primary key,
	class_duration date not null,
	instructor_id bigint not null references course_management.instructors(instructor_id),
	course_id bigint not null references course_management.courses(course_id)
);
-- Create table enrollments
create table course_management.enrollments(
	enrollment_date date default current_date,
	student_id bigint not null references course_management.students(student_id),
	class_id bigint not null references course_management.classes(class_id),
	primary key(student_id, class_id)
);