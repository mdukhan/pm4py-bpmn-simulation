-- ============================================================
-- CELONIS PQL TRANSFORMATIONS FÜR BAFÖEG OCEL
-- ============================================================
-- Tabellen im Data Pool:
--   - events
--   - applications  
--   - documents
--   - event_object_link
-- ============================================================


-- ============================================================
-- OBJEKTTYPEN
-- ============================================================

-- Application-Objekt
SELECT
    "application_id" AS "ID",
    "student_id" AS "StudentId",
    "is_initial_application" AS "IsInitialApplication",
    "is_parent_independent" AS "IsParentIndependent",
    "housing_type" AS "HousingType",
    "status" AS "Status"
FROM "applications";


-- Document-Objekt
SELECT
    "document_id" AS "ID",
    "application_id" AS "ApplicationId",
    "doc_type" AS "DocType",
    "doc_category" AS "DocCategory",
    "status" AS "Status",
    "submission_date" AS "SubmissionDate"
FROM "documents";


-- ============================================================
-- AKTIVITÄTEN (EVENTS)
-- ============================================================

-- Application started
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Application started';


-- Request Parent Data
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Request Parent Data';


-- Receive Parent Data
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Receive Parent Data';


-- Send Application Mail
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Send Application Mail';


-- Receive Application
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Receive Application';


-- Review Document
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Review Document';


-- Request Missing Documents (Document Loop)
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Request Missing Documents';


-- Receive Missing Documents (Document Loop)
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Receive Missing Documents';


-- Assess Application
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Assess Application';


-- Calculate Claim
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Calculate Claim';


-- Send Notification
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Send Notification';


-- Send Rejection
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Send Rejection';


-- Application handled
SELECT
    "event_id" AS "ID",
    "timestamp" AS "Time",
    "sorting_integer" AS "SortingInteger",
    "org_resource" AS "Resource"
FROM "events"
WHERE "activity" = 'Application handled';


-- ============================================================
-- LINKS: EVENTS → APPLICATIONS
-- ============================================================

-- Application started → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Application started';


-- Request Document → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Request Document';


-- Receive Document → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Receive Document';


-- Send Application Mail → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Send Application Mail';


-- Receive Application → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Receive Application';


-- Review Document → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Review Document';


-- Receive Documents → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Receive Documents';


-- Assess Application → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Assess Application';


-- Calculate Claim → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Calculate Claim';


-- Send Notification → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Send Notification';


-- Send Rejection → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Send Rejection';


-- Application handled → Application
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Applications"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Application'
  AND "events"."activity" = 'Application handled';


-- ============================================================
-- LINKS: EVENTS → DOCUMENTS
-- ============================================================

-- Receive Document → Document
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Documents"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Document'
  AND "events"."activity" = 'Receive Document';


-- Receive Application → Document
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Documents"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Document'
  AND "events"."activity" = 'Receive Application';


-- Review Document → Document
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Documents"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Document'
  AND "events"."activity" = 'Review Document';


-- Request Document → Document
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Documents"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Document'
  AND "events"."activity" = 'Request Document';


-- Receive Documents → Document
SELECT
    "event_object_link"."event_id" AS "ID",
    "event_object_link"."object_id" AS "Documents"
FROM "event_object_link"
JOIN "events" ON "event_object_link"."event_id" = "events"."event_id"
WHERE "event_object_link"."object_type" = 'Document'
  AND "events"."activity" = 'Receive Documents';
