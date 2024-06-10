SELECT "PatientData"."PatientID", "PatientData"."Sex", "Sex"."Value"
FROM "PatientData"
INNER JOIN "Sex" ON "PatientData"."Sex"="Sex"."ID";