-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "PatientData" (
    "PatientID" int UNIQUE NOT NULL,
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
    "AlchoholDrinkers" int   NOT NULL,
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


CREATE TABLE "AgeCategory" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_AgeCategory" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "CovidPos" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_CovidPos" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "ECigaretteUsage" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_ECigaretteUsage" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "GeneralHealth" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_GeneralHealth" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "HadDiabetes" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_HadDiabetes" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "LastCheckupTime" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_LastCheckupTime" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "RaceEthnicityCategory" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_RaceEthnicityCategory" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "RemovedTeeth" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_RemovedTeeth" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Sex" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_Sex" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "SmokerStatus" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_SmokerStatus" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "State" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_State" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "TetanusLast10Tdap" (
    "Value" varchar   NOT NULL,
    "ID" int   NOT NULL,
    CONSTRAINT "pk_TetanusLast10Tdap" PRIMARY KEY (
        "ID"
     )
);



ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_State" FOREIGN KEY("State")
REFERENCES "State" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_Sex" FOREIGN KEY("Sex")
REFERENCES "Sex" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_GeneralHealth" FOREIGN KEY("GeneralHealth")
REFERENCES "GeneralHealth" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_LastCheckupTime" FOREIGN KEY("LastCheckupTime")
REFERENCES "LastCheckupTime" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_RemovedTeeth" FOREIGN KEY("RemovedTeeth")
REFERENCES "RemovedTeeth" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_HadDiabetes" FOREIGN KEY("HadDiabetes")
REFERENCES "HadDiabetes" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_SmokerStatus" FOREIGN KEY("SmokerStatus")
REFERENCES "SmokerStatus" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_ECigaretteUsage" FOREIGN KEY("ECigaretteUsage")
REFERENCES "ECigaretteUsage" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_RaceEthnicityCategory" FOREIGN KEY("RaceEthnicityCategory")
REFERENCES "RaceEthnicityCategory" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_AgeCategory" FOREIGN KEY("AgeCategory")
REFERENCES "AgeCategory" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_TetanusLast10Tdap" FOREIGN KEY("TetanusLast10Tdap")
REFERENCES "TetanusLast10Tdap" ("ID");

ALTER TABLE "PatientData" ADD CONSTRAINT "fk_PatientData_CovidPos" FOREIGN KEY("CovidPos")
REFERENCES "CovidPos" ("ID");

