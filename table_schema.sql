-- DROP TABLES AND RELATIONSHIPS IF ALREADY EXISTS

DROP TABLE if exists departments CASCADE;
DROP TABLE if exists dept_emp CASCADE;
DROP TABLE if exists dept_manager CASCADE;
DROP TABLE if exists employees CASCADE;
DROP TABLE if exists salaries CASCADE;
DROP TABLE if exists titles CASCADE;


-- Creating the tables



--Creating departments table


CREATE TABLE "departments" (
  "dept_no" VARCHAR(6) NOT NULL,
  "dept_name" VARCHAR(50) NOT NULL,
  CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

-- Creating dept_emp table



CREATE TABLE "dept_emp" (
      "emp_no" INT NOT NULL,
      "dept_no" VARCHAR(6) NOT NULL
   
);



-- Creating table dept_manager



CREATE TABLE "dept_manager" (
       "dept_no" VARCHAR(6) NOT NULL ,
       "emp_no" INT NOT NULL
);




--Creating employees table

CREATE TABLE "employees" (
	"emp_no" INT NOT NULL,
    "emp_title" VARCHAR(35) NOT NULL,
	"birth_date" DATE NOT NULL,
    "first_name" VARCHAR(40) NOT NULL,
	"last_name" VARCHAR(40) NOT NULL,
    "sex" VARCHAR(2) NOT NULL,
    "hire_date" DATE NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);


--Creating salaries table


CREATE TABLE "salaries" (
      "emp_no" INT NOT NULL,
	  "salary" INT NOT NULL
);



--Creating titles table


CREATE TABLE "titles" (
	  "title_id" VARCHAR(6) NOT NULL,
	  "title" VARCHAR(35) NOT NULL,
      CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);
	

-- Drop Foreign Keys in their respective tables to ensure the number of columns for each table is correct before importing source data.

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


