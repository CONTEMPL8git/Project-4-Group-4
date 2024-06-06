-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/X3kVEp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/X3kVEp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/X3kVEp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "PatientData" (
    "PatientID" int   NOT NULL,
    "State" int   NOT NULL,
    "Sex" int   NOT NULL,
    "GeneralHealth" int   NOT NULL,
    "PhysicalHealthDays" float   NOT NULL,
    "MentalHealthDays" float   NOT NULL,
    "LastCheckupTime" int   NOT NULL,
    "PhysicalActivities" int   NOT NULL,
    "SleepHours" float   NOT NULL,
    "RemovedTeeth" int   NOT NULL,
    "HadHeartAttack" int   NOT NULL,
    "HadAngina" int   NOT NULL,
    "HadStroke" int   NOT NULL,
    "HadAsthma" int   NOT NULL,
    "HadSkinCancer" int   NOT NULL,
    "HadCOPD" int   NOT NULL,
    "HadDepressiveDisorder" int   NOT NULL,
    "HadKidneyDisease" int   NOT NULL,
    "HadArthritis" int   NOT NULL,
    "HadDiabetes" int   NOT NULL,
    "DeafOrHardOfHearing" int   NOT NULL,
    "BlindOrVisionDifficulty" int   NOT NULL,
    "DifficultyConcentrating" int   NOT NULL,
    "DifficultyWalking" int   NOT NULL,
    "DifficultyDressingBathing" int   NOT NULL,
    "DifficultyErrands" int   NOT NULL,
    "SmokerStatus" int   NOT NULL,
    "ECigaretteUsage" int   NOT NULL,
    "ChestScan" int   NOT NULL,
    "RaceEthnicityCategory" int   NOT NULL,
    "AgeCategory" int   NOT NULL,
    "HeightInMeters" float   NOT NULL,
    "WeightInKilograms" float   NOT NULL,
    "AlcoholDrinkers" int   NOT NULL,
    "HIVTesting" int   NOT NULL,
    "FluVaxLast12" int   NOT NULL,
    "PneumoVaxEver" int   NOT NULL,
    "TetanusLast10Tdap" int   NOT NULL,
    "HighRiskLastYear" int   NOT NULL,
    "CovidPos" int   NOT NULL,
    CONSTRAINT "pk_PatientData" PRIMARY KEY (
        "PatientID"
     )
);

SELECT pg_size_pretty(pg_database_size('Heart_Disease_2022_Analysis>'));