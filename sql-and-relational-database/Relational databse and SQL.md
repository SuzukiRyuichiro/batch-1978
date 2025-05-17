# Relational databse and SQL

## Select

```sql
SELECT columns you want FROM table name;
```

Filtering

```sql
SELECT * FROM docotrs WHERE age > 25;
```

Ordering

```sql
select * from doctors order by age asc;
```





More complex operations

```sql
select
  *
from
  appointments
  join doctors on doctors.id = appointments.doctor_id;

-- Read all patients first & last names along with their appointment dates
select
  appointments.id,
  occurs_on,
  first_name,
  last_name
from
  appointments
  join patients on appointments.patient_id = patients.id;

-- Read Rosalind Franklin's appointments dates along with her patients first name & last name
-- join the patienst and doctors tables into the appointments
-- filter the appointments based on doctor's name
-- select first and last name of patients
select
  appointments.occurs_on,
  patients.first_name,
  patients.last_name
from
  appointments
  join doctors on appointments.doctor_id = doctors.id
  join patients on appointments.patient_id = patients.id
where
  doctors.first_name = 'Rosalind'
  and doctors.last_name = 'Franklin';
  
```

