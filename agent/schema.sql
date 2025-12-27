-- 1. Object Tables
-- STUDENT IST WEG. Seine Infos sind jetzt Attribute der Application.

CREATE TABLE "Application" (
    "application_id" TEXT PRIMARY KEY,
    "student_id" TEXT,             -- Nur noch als Info-Feld (kein Foreign Key mehr)
    "is_initial_application" BOOLEAN, 
    "is_parent_independent" BOOLEAN, -- Neu: Steuert Gateway 'Parent Data Required?' (Report: ~18% unabhängig)
    "housing_type" TEXT,           -- 'Eltern' vs 'Alleine'
    "status" TEXT                  -- 'Approved', 'Rejected'
);

CREATE TABLE "Document" (
    "document_id" TEXT PRIMARY KEY,
    "application_id" TEXT REFERENCES "Application"("application_id"), 
    "doc_type" TEXT,               -- 'Mietbescheinigung', 'Formblatt 1'
    "doc_category" TEXT,           -- NEU: 'Einkommen', 'Identität', 'Wohnen' (für bessere Charts)
    "status" TEXT,                 -- 'Missing', 'Received'
    "submission_date" TIMESTAMP
);

-- 2. Event Table (Unverändert wichtig)
CREATE TABLE "Event" (
    "event_id" TEXT PRIMARY KEY,
    "activity" TEXT,
    "timestamp" TIMESTAMP,
    "sorting_integer" INTEGER,     -- Lebenswichtig für korrekte Reihenfolge!
    "org_resource" TEXT            -- Der Sachbearbeiter
);

-- 3. Link Table (Jetzt extrem simpel)
CREATE TABLE "event_object_link" (
    "event_id" TEXT REFERENCES "Event"("event_id"),
    "object_id" TEXT,
    "object_type" TEXT,            -- Nur noch: 'Application' oder 'Document'
    PRIMARY KEY ("event_id", "object_id", "object_type")
);