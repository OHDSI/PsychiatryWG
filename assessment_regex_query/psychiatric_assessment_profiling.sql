-- ============================================================================
-- PSYCHIATRIC ASSESSMENT PROFILING QUERY
-- ============================================================================
--
-- Regex searches a text column for psychiatric assessment names and their
-- individual questions/items, returning record counts per match.
--
-- Patterns are loaded from external CSV lookup files:
--   assessment_lookup.csv  — assessment-level patterns (Query 1)
--   question_lookup.csv    — question/item-level patterns (Query 2)
--
-- SETUP: Run the CREATE TEMP TABLE + COPY block below ONCE per session,
-- then run Query 1 and/or Query 2 as needed.
--
-- USAGE: Update the FROM clause and column name to match your table.
--   OMOP measurement  → FROM measurement, column: measurement_source_value
--   OMOP observation  → FROM observation, column: observation_source_value
--   Other formats     → swap in your table/column
--
-- Dialect: PostgreSQL (~* = case-insensitive regex, \y = word boundary)
--   SQL Server  → replace  col ~* 'pat'  with  col LIKE '%pat%' or PATINDEX
--   BigQuery    → replace  col ~* 'pat'  with  REGEXP_CONTAINS(col, r'(?i)pat')
--   Snowflake   → replace  col ~* 'pat'  with  REGEXP_LIKE(col, 'pat', 'i')
-- ============================================================================


-- ============================================================================
-- STEP 0: LOAD LOOKUP TABLES FROM CSV (run once per session)
-- ============================================================================
-- Update the file paths below to point to your CSV locations.
-- If using psql, you can use \copy instead of COPY for client-side file access.
-- ============================================================================

DROP TABLE IF EXISTS assessment_lookup;
CREATE TEMP TABLE assessment_lookup (
    priority           INT,
    assessment_name    TEXT,
    assessment_full_name TEXT,
    assessment_regex   TEXT
);

COPY assessment_lookup (priority, assessment_name, assessment_full_name, assessment_regex)
FROM '/path/to/assessment_lookup.csv'       -- << UPDATE PATH
WITH (FORMAT csv, HEADER true);


DROP TABLE IF EXISTS question_lookup;
CREATE TEMP TABLE question_lookup (
    assessment_name    TEXT,
    question_label     TEXT,
    assessment_regex   TEXT,
    question_regex     TEXT
);

COPY question_lookup (assessment_name, question_label, assessment_regex, question_regex)
FROM '/path/to/question_lookup.csv'         -- << UPDATE PATH
WITH (FORMAT csv, HEADER true);


-- ============================================================================
-- QUERY 1: ASSESSMENT-LEVEL COUNTS
-- ============================================================================
-- Matches each record against assessment_lookup.csv patterns.
-- Uses priority to disambiguate overlapping patterns (e.g. PHQ-9 vs PHQ-9 Total).
-- Returns one row per assessment with abbreviation, full name, and record count.
-- ============================================================================

WITH matched AS (
    SELECT
        t.measurement_id,                                -- << CHANGE to your row ID column
        al.assessment_name,
        al.assessment_full_name,
        al.priority
    FROM measurement t                                   -- << CHANGE TABLE HERE
    CROSS JOIN assessment_lookup al
    WHERE t.measurement_source_value ~* al.assessment_regex  -- << CHANGE COLUMN HERE
),
deduped AS (
    SELECT DISTINCT ON (measurement_id)                  -- << CHANGE to your row ID column
        measurement_id,
        assessment_name,
        assessment_full_name
    FROM matched
    ORDER BY measurement_id, priority ASC                -- << CHANGE to your row ID column
)
SELECT
    assessment_name,
    assessment_full_name,
    COUNT(*) AS record_count
FROM deduped
GROUP BY assessment_name, assessment_full_name
ORDER BY assessment_name;


-- ============================================================================
-- QUERY 2: QUESTION / ITEM-LEVEL COUNTS
-- ============================================================================
-- Matches each record against question_lookup.csv patterns.
-- Both assessment_regex AND question_regex must match the same source value.
-- Returns the matched source value so you can verify what was captured.
--
-- NOTE: A single source value CAN match multiple question patterns if its
-- text contains keywords from more than one item. Review the matched_value
-- column to confirm correct categorisation.
-- ============================================================================

SELECT
    ql.assessment_name,
    ql.question_label,
    t.measurement_source_value AS matched_value,         -- << CHANGE COLUMN HERE
    COUNT(*) AS record_count
FROM measurement t                                       -- << CHANGE TABLE HERE
JOIN question_lookup ql
    ON  t.measurement_source_value ~* ql.assessment_regex    -- << CHANGE COLUMN HERE
    AND t.measurement_source_value ~* ql.question_regex      -- << CHANGE COLUMN HERE
GROUP BY
    ql.assessment_name,
    ql.question_label,
    t.measurement_source_value                               -- << CHANGE COLUMN HERE
ORDER BY
    ql.assessment_name,
    ql.question_label,
    record_count DESC;
