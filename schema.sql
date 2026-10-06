-- Disable Foreign Keys temporarily for schema reset
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS equipment;

-- Table: equipment
CREATE TABLE equipment (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT NOT NULL
);

-- Table: bookings
CREATE TABLE bookings (
    id TEXT PRIMARY KEY,
    equipmentId TEXT NOT NULL,
    borrowerName TEXT NOT NULL,
    startAt TEXT NOT NULL,
    endAt TEXT NOT NULL,
    purpose TEXT NOT NULL,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (equipmentId) REFERENCES equipment(id) ON DELETE CASCADE
);

-- Seed Data (อย่างน้อย 2 รายการตามโจทย์)
INSERT INTO equipment (id, name, location) VALUES 
('eq-1', 'Projector A', 'Building 1'),
('eq-2', 'Sony Camera B', 'Building 2');