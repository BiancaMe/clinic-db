CREATE TABLE patients (
id INT GENERATED ALWAYS AS IDENTITY, 
full_name VARCHAR(20),
age INT, 
PRIMARY KEY(id)
);
CREATE TABLE treatments(
id INT GENERATED ALWAYS AS IDENTITY, 
type VARCHAR,
name VARCHAR,
PRIMARY KEY(id)
);
CREATE TABLE invoices(
id INT GENERATED ALWAYS AS IDENTITY, 
total_amount DECIMAL,
generated_at DATETIME,
payed_at DATETIME,
PRIMARY KEY(id)
);
CREATE TABLE invoice_item(
id INT GENERATED ALWAYS AS IDENTITY, 
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoce_id INT,
PRIMARY KEY(id)
);
CREATE TABLE medical_histories(
id INT GENERATED ALWAYS AS IDENTITY, 
admited_at DATETIME,
patient_id INT,
status VARCHAR,
PRIMARY KEY(id)
);

CREATE TABLE designated_treatments (
 id INT GENERATED ALWAYS AS IDENTITY,
  medical_histories_id INT REFERENCES medical_histories(id),
  treatments INT REFERENCES treatments(id),
  PRIMARY KEY(id)
);


