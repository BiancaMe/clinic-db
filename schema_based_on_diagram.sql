CREATE DATABASE clinic;

CREATE TABLE patients (
 id INT GENERATED ALWAYS AS IDENTITY, 
 name VARCHAR(30),
date_of_birth DATE,
 PRIMARY KEY(id)
);

CREATE TABLE treatments(
 id INT GENERATED ALWAYS AS IDENTITY, 
 type VARCHAR,
 name VARCHAR,
 PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
 id INT GENERATED ALWAYS AS IDENTITY, 
 admited_at TIMESTAMP,
 patient_id INT,
 status VARCHAR,
 FOREIGN KEY (patient_id) REFERENCES patients(id),
 PRIMARY KEY(id)
);

CREATE TABLE invoices(
 id INT GENERATED ALWAYS AS IDENTITY, 
 total_amount DECIMAL,
 generated_at TIMESTAMP,
 payed_at TIMESTAMP,
 medical_history_id INT,
 FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
 PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
 id INT GENERATED ALWAYS AS IDENTITY, 
 unit_price DECIMAL,
 quantity INT,
 total_price DECIMAL,
 invoice_id INT,
 treatment_id INT,
 FOREIGN KEY (invoice_id) REFERENCES invoices(id),
 FOREIGN KEY (treatment_id) REFERENCES treatments(id),
 PRIMARY KEY(id)
);

CREATE TABLE designated_treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_history_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id),
  PRIMARY KEY(id)
);

CREATE INDEX idx_mh_treat_medhist_id ON  designated_treatments (medical_history_id);
CREATE INDEX idx_mh_treat_treat_id ON  designated_treatments (treatments_id);
CREATE INDEX idx_inv_items_inv_id ON invoice_items (invoice_id);
CREATE INDEX idx_inv_items_treat_id ON invoice_items (treatment_id);
CREATE INDEX idx_invoices_medhist_id ON invoices (medical_history_id);
CREATE INDEX idx_medhist_patient_id ON medical_histories (patient_id);