```md
# Wie importiere ich meinen OCEL in Celonis?

## Vorbereitung

Für den Import werden folgende CSV-Dateien benötigt:

- **1x Events-Datei**: Enthält alle Events mit Sorting-Integer
- **1x Datei pro Objekttyp**: Für jeden Objekttyp (z.B. LKWs, Pakete) eine separate CSV-Datei
- **1x Links-Datei**: Enthält die Verknüpfungen zwischen Objekten und Events

**Beispiel**: Bei 2 Objekttypen (LKWs und Pakete) werden insgesamt 4 CSV-Dateien benötigt: 1x Events, 1x LKWs, 1x Pakete, 1x Links.

## Import

Die CSV-Dateien werden in Celonis importiert. Anschließend müssen unter "Objects and Events" die Objekte und Events sowie deren Beziehungen definiert werden. Danach muss ein "Data Job" ausgeführt werden.

Zunächst zu den Transformationen, die die Daten aus den CSV-Dateien mittels PQL für die Celonis "Objects and Events" aufbereiten.

**Beispiel für Logistik mit LKWs und Paketen:**

```sql
-- Pakete-Transformation
-- Bitte fehlende Attribute zuordnen (siehe unten für vollständige Liste), um die Transformation abzuschließen

SELECT
    -- ID für den Objekttyp zuordnen
    "PAKET_ID" AS "ID",
    "GEWICHT_KG" AS "GewichtKg",
    "ZIELORT" AS "ZIELORT"
FROM "pakete"
```

```sql
-- LKW-Transformation
-- Bitte fehlende Attribute zuordnen (siehe unten für vollständige Liste), um die Transformation abzuschließen

SELECT
    -- ID für den Objekttyp zuordnen
    "LKW_ID" AS "ID",
    "KENNZEICHEN" AS "KENNZEICHEN",
    "MODELL" AS "MODELL"
FROM "lkws"
```

```sql
-- PaketErfasst-Transformation
-- Hier werden auch die Relationen definiert, indem eine Transformation die Daten lädt
-- Bitte fehlende Attribute zuordnen (siehe unten für vollständige Liste), um die Transformation abzuschließen

SELECT
    "EVENT_ID" AS "ID",
    "TIMESTAMP" AS "Time"
FROM "events"
WHERE "events"."ACTIVITY" = 'Paket erfasst'
```

```sql
-- LKW-Verladen-Link-Transformation
-- Hier werden auch die Relationen definiert, indem eine Transformation die Daten lädt
-- Bitte fehlende Attribute zuordnen (siehe unten für vollständige Liste), um die Transformation abzuschließen

SELECT
    "links"."EVENT_ID" AS "ID",
    "links"."OBJECT_ID" AS "Lkws"  -- Muss genau "Lkws" heißen (Name des Relationships)
FROM "links"
JOIN "events" ON "links"."EVENT_ID" = "events"."event_id"  -- Event-Informationen hinzufügen
WHERE "links"."OBJECT_ID" LIKE 'T%'           -- Nur LKWs (T...)
  AND "events"."activity" = 'Paket erfasst'   -- Nur bei Verladungs-Events
```
```