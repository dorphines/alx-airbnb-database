-- Sample Data for User Table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('a1b2c3d4-e5f6-7890-1234-567890abcdef', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '123-456-7890', 'guest'),
('b2c3d4e5-f6a7-8901-2345-67890abcdef0', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '234-567-8901', 'host'),
('c3d4e5f6-a7b8-9012-3456-7890abcdef01', 'Admin', 'User', 'admin@example.com', 'hashed_password_3', '345-678-9012', 'admin');

-- Sample Data for Property Table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night) VALUES
('d4e5f6a7-b8c9-0123-4567-890abcdef012', 'b2c3d4e5-f6a7-8901-2345-67890abcdef0', 'Cozy Apartment in the City', 'A beautiful apartment in the heart of the city.', 'New York, NY', 150.00),
('e5f6a7b8-c9d0-1234-5678-90abcdef0123', 'b2c3d4e5-f6a7-8901-2345-67890abcdef0', 'Beachfront Villa', 'A stunning villa with a private beach.', 'Malibu, CA', 500.00);

-- Sample Data for Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('f6a7b8c9-d0e1-2345-6789-0abcdef01234', 'd4e5f6a7-b8c9-0123-4567-890abcdef012', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2025-11-01', '2025-11-05', 600.00, 'confirmed'),
('a7b8c9d0-e1f2-3456-7890-bcdef0123456', 'e5f6a7b8-c9d0-1234-5678-90abcdef0123', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2025-12-10', '2025-12-15', 2500.00, 'pending');

-- Sample Data for Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
('b8c9d0e1-f2a3-4567-8901-cdef01234567', 'f6a7b8c9-d0e1-2345-6789-0abcdef01234', 600.00, 'credit_card');

-- Sample Data for Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('c9d0e1f2-a3b4-5678-9012-def012345678', 'd4e5f6a7-b8c9-0123-4567-890abcdef012', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 5, 'Amazing place! Highly recommended.');

-- Sample Data for Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('d0e1f2a3-b4c5-6789-0123-ef0123456789', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 'b2c3d4e5-f6a7-8901-2345-67890abcdef0', 'Hi Jane, I have a question about the apartment.');
