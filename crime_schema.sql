--------------------------------------------------------
--  File created - Tuesday-April-08-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CRIMEPREDICTION
--------------------------------------------------------

  CREATE TABLE "IBRAHIM"."CRIMEPREDICTION" 
   (	"PREDICTIONID" NUMBER(*,0), 
	"CRIME" VARCHAR2(255), 
	"PREDICTEDDATE" DATE, 
	"LIKELIHOOD" NUMBER(3,2)
   )
--------------------------------------------------------
--  DDL for Table CRIMERECORDS
--------------------------------------------------------

  CREATE TABLE "IBRAHIM"."CRIMERECORDS" 
   (	"RECORDID" NUMBER(*,0), 
	"CRIMEID" NUMBER(*,0), 
	"CRIMINALID" NUMBER(*,0), 
	"DATEOFCRIME" DATE, 
	"CONVICTIONSTATUS" NUMBER(1,0), 
	"SENTENCE" VARCHAR2(100), 
	"OFFICERID" NUMBER(38,0)
   )
--------------------------------------------------------
--  DDL for Table CRIMES
--------------------------------------------------------

  CREATE TABLE "IBRAHIM"."CRIMES" 
   (	"CRIMEID" NUMBER(*,0), 
	"CRIMETYPE" VARCHAR2(255), 
	"DATEOCCURRED" DATE, 
	"LOCATION" VARCHAR2(255), 
	"SEVERITY" VARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table CRIMINALS
--------------------------------------------------------

  CREATE TABLE "IBRAHIM"."CRIMINALS" 
   (	"CRIMINALID" NUMBER(*,0), 
	"FIRSTNAME" VARCHAR2(255), 
	"LASTNAME" VARCHAR2(255), 
	"DATEOFBIRTH" DATE, 
	"GENDER" VARCHAR2(50), 
	"ADDRESS" VARCHAR2(255), 
	"CRIMEHISTORY" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table POLICEOFFICERS
--------------------------------------------------------

  CREATE TABLE "IBRAHIM"."POLICEOFFICERS" 
   (	"OFFICERID" NUMBER(*,0), 
	"FIRSTNAME" VARCHAR2(255), 
	"LASTNAME" VARCHAR2(255), 
	"RANK" VARCHAR2(50), 
	"STATION" VARCHAR2(255), 
	"CONTACTINFO" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table WITNESSCRIME
--------------------------------------------------------

  CREATE TABLE "IBRAHIM"."WITNESSCRIME" 
   (	"WITNESSCRIMEID" NUMBER, 
	"CRIMEID" NUMBER, 
	"WITNESSID" NUMBER
   )
--------------------------------------------------------
--  DDL for Table WITNESSES
--------------------------------------------------------

  CREATE TABLE "IBRAHIM"."WITNESSES" 
   (	"WITNESSID" NUMBER, 
	"FIRSTNAME" VARCHAR2(100), 
	"LASTNAME" VARCHAR2(100), 
	"GENDER" VARCHAR2(20), 
	"DATEOFBIRTH" DATE, 
	"CONTACTINFO" VARCHAR2(150)
   )
--------------------------------------------------------
--  DDL for Index SYS_C008226
--------------------------------------------------------

  CREATE UNIQUE INDEX "IBRAHIM"."SYS_C008226" ON "IBRAHIM"."CRIMEPREDICTION" ("PREDICTIONID")
--------------------------------------------------------
--  DDL for Index SYS_C008222
--------------------------------------------------------

  CREATE UNIQUE INDEX "IBRAHIM"."SYS_C008222" ON "IBRAHIM"."CRIMERECORDS" ("RECORDID")
--------------------------------------------------------
--  DDL for Index SYS_C008221
--------------------------------------------------------

  CREATE UNIQUE INDEX "IBRAHIM"."SYS_C008221" ON "IBRAHIM"."CRIMES" ("CRIMEID")
--------------------------------------------------------
--  DDL for Index SYS_C008220
--------------------------------------------------------

  CREATE UNIQUE INDEX "IBRAHIM"."SYS_C008220" ON "IBRAHIM"."CRIMINALS" ("CRIMINALID")
--------------------------------------------------------
--  DDL for Index SYS_C008225
--------------------------------------------------------

  CREATE UNIQUE INDEX "IBRAHIM"."SYS_C008225" ON "IBRAHIM"."POLICEOFFICERS" ("OFFICERID")
--------------------------------------------------------
--  DDL for Index SYS_C008229
--------------------------------------------------------

  CREATE UNIQUE INDEX "IBRAHIM"."SYS_C008229" ON "IBRAHIM"."WITNESSCRIME" ("WITNESSCRIMEID")
--------------------------------------------------------
--  DDL for Index SYS_C008228
--------------------------------------------------------

  CREATE UNIQUE INDEX "IBRAHIM"."SYS_C008228" ON "IBRAHIM"."WITNESSES" ("WITNESSID")
--------------------------------------------------------
--  Constraints for Table CRIMEPREDICTION
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."CRIMEPREDICTION" ADD PRIMARY KEY ("PREDICTIONID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table CRIMERECORDS
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."CRIMERECORDS" ADD PRIMARY KEY ("RECORDID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table CRIMES
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."CRIMES" ADD PRIMARY KEY ("CRIMEID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table CRIMINALS
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."CRIMINALS" ADD PRIMARY KEY ("CRIMINALID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table POLICEOFFICERS
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."POLICEOFFICERS" ADD PRIMARY KEY ("OFFICERID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table WITNESSCRIME
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."WITNESSCRIME" ADD PRIMARY KEY ("WITNESSCRIMEID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table WITNESSES
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."WITNESSES" ADD PRIMARY KEY ("WITNESSID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CRIMERECORDS
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."CRIMERECORDS" ADD FOREIGN KEY ("CRIMEID")
	  REFERENCES "IBRAHIM"."CRIMES" ("CRIMEID") ENABLE
  ALTER TABLE "IBRAHIM"."CRIMERECORDS" ADD FOREIGN KEY ("CRIMINALID")
	  REFERENCES "IBRAHIM"."CRIMINALS" ("CRIMINALID") ENABLE
  ALTER TABLE "IBRAHIM"."CRIMERECORDS" ADD FOREIGN KEY ("OFFICERID")
	  REFERENCES "IBRAHIM"."POLICEOFFICERS" ("OFFICERID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table WITNESSCRIME
--------------------------------------------------------

  ALTER TABLE "IBRAHIM"."WITNESSCRIME" ADD CONSTRAINT "FK_CRIME" FOREIGN KEY ("CRIMEID")
	  REFERENCES "IBRAHIM"."CRIMES" ("CRIMEID") ON DELETE CASCADE ENABLE
  ALTER TABLE "IBRAHIM"."WITNESSCRIME" ADD CONSTRAINT "FK_WITNESS" FOREIGN KEY ("WITNESSID")
	  REFERENCES "IBRAHIM"."WITNESSES" ("WITNESSID") ON DELETE CASCADE ENABLE
