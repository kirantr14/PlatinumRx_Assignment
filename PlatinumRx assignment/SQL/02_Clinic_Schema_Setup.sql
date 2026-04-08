-- Create clinics table
CREATE TABLE clinics (
    cid TEXT PRIMARY KEY,
    clinic_name TEXT,
    city TEXT,
    state TEXT,
    country TEXT
);

-- Create customer table
CREATE TABLE customer (
    uid TEXT PRIMARY KEY,
    name TEXT,
    mobile TEXT
);

-- Create clinic_sales table
CREATE TABLE clinic_sales (
    oid TEXT PRIMARY KEY,
    uid TEXT,
    cid TEXT,
    amount INTEGER,
    datetime TEXT,
    sales_channel TEXT
);

-- Create expenses table
CREATE TABLE expenses (
    eid TEXT PRIMARY KEY,
    cid TEXT,
    description TEXT,
    amount INTEGER,
    datetime TEXT
);

-- Insert sample data into clinics
INSERT INTO clinics VALUES
('c1', 'Clinic A', 'Bangalore', 'Karnataka', 'India'),
('c2', 'Clinic B', 'Mumbai', 'Maharashtra', 'India');

-- Insert sample data into customer
INSERT INTO customer VALUES
('u1', 'John Doe', '9999999999'),
('u2', 'Jane Smith', '8888888888');

-- Insert sample data into clinic_sales
INSERT INTO clinic_sales VALUES
('o1', 'u1', 'c1', 5000, '2021-01-10', 'online'),
('o2', 'u2', 'c1', 7000, '2021-01-15', 'offline'),
('o3', 'u1', 'c2', 3000, '2021-02-10', 'online');

-- Insert sample data into expenses
INSERT INTO expenses VALUES
('e1', 'c1', 'supplies', 2000, '2021-01-12'),
('e2', 'c2', 'rent', 1000, '2021-02-12');