CREATE TABLE users (
    user_id TEXT PRIMARY KEY,
    name TEXT,
    phone_number TEXT,
    mail_id TEXT,
    billing_address TEXT
);

CREATE TABLE bookings (
    booking_id TEXT PRIMARY KEY,
    booking_date TEXT,
    room_no TEXT,
    user_id TEXT
);

CREATE TABLE items (
    item_id TEXT PRIMARY KEY,
    item_name TEXT,
    item_rate INTEGER
);

CREATE TABLE booking_commercials (
    id TEXT PRIMARY KEY,
    booking_id TEXT,
    bill_id TEXT,
    bill_date TEXT,
    item_id TEXT,
    item_quantity REAL
);

INSERT INTO users VALUES
('u1', 'John Doe', '9999999999', 'john@example.com', 'Address 1'),
('u2', 'Jane Smith', '8888888888', 'jane@example.com', 'Address 2');

INSERT INTO bookings VALUES
('b1', '2021-11-10 10:00:00', '101', 'u1'),
('b2', '2021-11-15 12:00:00', '102', 'u1'),
('b3', '2021-10-05 09:00:00', '201', 'u2');

INSERT INTO items VALUES
('i1', 'Tawa Paratha', 18),
('i2', 'Mix Veg', 89);

INSERT INTO booking_commercials VALUES
('c1', 'b1', 'bill1', '2021-11-10', 'i1', 2),
('c2', 'b1', 'bill1', '2021-11-10', 'i2', 1),
('c3', 'b2', 'bill2', '2021-11-15', 'i1', 5),
('c4', 'b3', 'bill3', '2021-10-05', 'i2', 20);