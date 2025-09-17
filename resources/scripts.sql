-- Create patient_access_analytics table
CREATE TABLE patient_access_analytics (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resource_type VARCHAR(255),
    patient_id VARCHAR(255) NOT NULL,
    app_id VARCHAR(255),
    issuer VARCHAR(255),
    contract_id VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    status_code SMALLINT CHECK (status_code >= 100 AND status_code < 600), -- HTTP status codes
    INDEX idx_patient_id (patient_id),
    INDEX idx_timestamp (timestamp),
    INDEX idx_resource_type (resource_type),
    INDEX idx_app_id (app_id),
    INDEX idx_status_code (status_code),
    INDEX idx_composite (patient_id, timestamp, resource_type)
);

-- Populate a sample row
INSERT INTO patient_access_analytics (
    resource_type,
    patient_id,
    app_id,
    issuer,
    contract_id,
    state,
    country,
    status_code
) VALUES (
    'Patient',
    'Patient/101',
    'mobile-health-app-v1.2',
    'https://auth.clevercare.com',
    'contract-cc-2025-001',
    'California',
    'USA',
    200
);