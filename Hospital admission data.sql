select * from  SideProject..['ABBREVIATION & MEANING$']

select * from SideProjects..AdmissionData 

--standardize the date
--change the date of addmission format 
Select * 
from SideProjects..AdmissionData 

select D#O#A#CONVERTED ,CONVERT(Date,D#O#A)
from SideProjects..AdmissionData

update SideProjects..AdmissionData
SET D#O#A=CONVERT(Date,D#O#A)

ALTER TABLE AdmissionData
Add D#O#A#CONVERTED Date

update SideProjects..AdmissionData
SET D#O#A#CONVERTED =CONVERT(Date,D#O#A)
 

--change the date month year
select [month year] from SideProjects..AdmissionData

select [month year],CONVERT(Date,[month year])
from SideProjects..AdmissionData

update SideProjects..AdmissionData
SET [month year]=CONVERT(Date,[month year])

ALTER TABLE AdmissionData
Add  MonthYear Date

update SideProjects..AdmissionData
SET MonthYear=CONVERT(Date,[month year])


--Change 0 and 1 to Smoker and Non Smoker to SMOKING field 
--and Converting a float to char value
  Select Case
  when CAST(SMOKING AS FLOAT) =1 THEN 'Smoker'
  when CAST (SMOKING AS FLOAT) =0 THEN 'Non-Smoker'
  Else CAST(SMOKING AS VARCHAR(50))
  END 
   from SideProjects..AdmissionData--this is correct 


  ALTER TABLE SideProjects..AdmissionData
ADD Smokingtable nvarchar(255)

update SideProjects..AdmissionData
SET Smokingtable= Case
  when CAST(SMOKING AS FLOAT) =1 THEN 'Smoker'
  when CAST (SMOKING AS FLOAT) =0 THEN 'Non-Smoker'
  Else CAST(SMOKING AS VARCHAR(50))
  END 
   from SideProjects..AdmissionData

   select * from SideProjects..AdmissionData
   ALTER TABLE SideProjects..AdmissionData
           --DROP COLUMN SMOKINGConverted

           --ALCOHOL COLUMN
      select ALCOHOL from SideProjects..AdmissionData
      ALTER TABLE SideProjects..AdmissionData
ADD AlcoholIntake nvarchar(255)

update SideProjects..AdmissionData
SET AlcoholIntake= Case
  when CAST(ALCOHOL AS FLOAT) =1 THEN 'Drinks Alcohol'
  when CAST (ALCOHOL AS FLOAT) =0 THEN 'Does not drink Alcohol'
  Else CAST(ALCOHOL AS VARCHAR(50))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --SHOCK
           ALTER TABLE SideProjects..AdmissionData
ADD Shock_data nvarchar(255)

update SideProjects..AdmissionData
SET Shock_data  = Case
  when CAST(SHOCK AS FLOAT) =1 THEN 'Shock'
  when CAST (SHOCK AS FLOAT) =0 THEN 'No Shock'
  Else CAST(SHOCK AS VARCHAR(50))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --CHEST INFECTION
           ALTER TABLE SideProjects..AdmissionData
ADD CHEST_INFECTION  nvarchar(255)

update SideProjects..AdmissionData
SET CHEST_INFECTION  = Case
  when CAST([CHEST INFECTION] AS FLOAT) =1 THEN 'Chest infection'
  when CAST ([CHEST INFECTION] AS FLOAT) =0 THEN 'No Chest Infection'
  Else CAST([CHEST INFECTION] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --Pulmonary embolism
             ALTER TABLE SideProjects..AdmissionData
ADD PULMONARY_EMBOLISM   nvarchar(255)

update SideProjects..AdmissionData
SET PULMONARY_EMBOLISM  = Case
  when CAST([PULMONARY EMBOLISM] AS FLOAT) =1 THEN ' Pulmonary embolism'
  when CAST ([PULMONARY EMBOLISM] AS FLOAT) =0 THEN 'No Pulmonary embolism'
  Else CAST([PULMONARY EMBOLISM] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     -- ANAEMIA
     ALTER TABLE SideProjects..AdmissionData
ADD ANAEMIA_RESULTS nvarchar(255)

update SideProjects..AdmissionData
SET ANAEMIA_RESULTS  = Case
  when CAST(ANAEMIA AS FLOAT) =1 THEN ' Anaemia'
  when CAST (ANAEMIA AS FLOAT) =0 THEN 'No Anaemia'
  Else CAST(ANAEMIA AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --Diabetes Mellitus
     ALTER TABLE SideProjects..AdmissionData
ADD DIABETES  nvarchar(255)

update SideProjects..AdmissionData
SET DIABETES  = Case
  when CAST(DM AS FLOAT) =1 THEN ' Diabetes Mellitus'
  when CAST (DM AS FLOAT) =0 THEN 'No Diabetes Mellitus'
  Else CAST(DM AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --HYPERTENTION
     ALTER TABLE SideProjects..AdmissionData
ADD Hypertension_Results nvarchar(255)

update SideProjects..AdmissionData
SET Hypertension_Results  = Case
  when CAST(HTN AS FLOAT) =1 THEN ' Hypertension'
  when CAST (HTN AS FLOAT) =0 THEN 'No Hypertension'
  Else CAST(HTN AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --CORONARY ARTERY DISEASE
     ALTER TABLE SideProjects..AdmissionData
ADD CORONARY_ARTERY_DISEASE  nvarchar(255)

update SideProjects..AdmissionData
SET CORONARY_ARTERY_DISEASE  = Case
  when CAST(CAD AS FLOAT) =1 THEN ' CORONARY ARTERY DISEASE'
  when CAST (CAD AS FLOAT) =0 THEN 'NO CORONARY ARTERY DISEASE'
  Else CAST(CAD AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     
     --Prior Cardiomyopathy
     ALTER TABLE SideProjects..AdmissionData
ADD [PRIOR_CMP]  nvarchar(255)

update SideProjects..AdmissionData
SET [PRIOR_CMP]  = Case
  when CAST([PRIOR CMP] AS FLOAT) =1 THEN ' Prior Cardiomyopathy'
  when CAST ([PRIOR CMP] AS FLOAT) =0 THEN 'No Prior Cardiomyopathy'
  Else CAST([PRIOR CMP] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData


     --Chronic Kidney disease

     ALTER TABLE SideProjects..AdmissionData
ADD Chronic_Kidney_disease  nvarchar(255)

update SideProjects..AdmissionData
SET Chronic_Kidney_disease = Case
  when CAST(CKD AS FLOAT) =1 THEN ' Chronic Kidney disease'
  when CAST (CKD AS FLOAT) =0 THEN 'No Chronic Kidney disease'
  Else CAST(CKD AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData
    
    --Raised Cardiac Enzymes

      ALTER TABLE SideProjects..AdmissionData
ADD [RAISED_CARDIAC_ENZYMES] nvarchar(255)

update SideProjects..AdmissionData
SET [RAISED_CARDIAC_ENZYMES]  = Case
  when CAST([RAISED CARDIAC ENZYMES] AS FLOAT) =1 THEN ' Raised Cardiac Enzymes'
  when CAST ([RAISED CARDIAC ENZYMES]AS FLOAT) =0 THEN ' No Raised Cardiac Enzymes'
  Else CAST([RAISED CARDIAC ENZYMES] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --SEVERE ANAEMIA
     ALTER TABLE SideProjects..AdmissionData
ADD SEVERE_ANAEMIA nvarchar(255)

update SideProjects..AdmissionData
SET SEVERE_ANAEMIA = Case
  when CAST([SEVERE ANAEMIA]  AS FLOAT) =1 THEN ' SEVERE ANAEMIA'
  when CAST ([SEVERE ANAEMIA] AS FLOAT) =0 THEN 'NO SEVERE ANAEMIA'
  Else CAST([SEVERE ANAEMIA] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --STABLE ANGINA
     ALTER TABLE SideProjects..AdmissionData
ADD [STABLE_ANGINA]  nvarchar(255)

update SideProjects..AdmissionData
SET [STABLE_ANGINA] = Case
  when CAST([STABLE ANGINA]AS FLOAT) =1 THEN 'STABLE ANGINA'
  when CAST ([STABLE ANGINA] AS FLOAT) =0 THEN 'NO STABLE ANGINA'
  Else CAST([STABLE ANGINA] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select SEVERE_ANAEMIA from SideProjects..AdmissionData

     --3.Acute Coronary Syndrome 
     ALTER TABLE SideProjects..AdmissionData
ADD Acute_Coronary_Syndrome  nvarchar(255)

update SideProjects..AdmissionData
SET Acute_Coronary_Syndrome = Case
  when CAST(ACS AS FLOAT) =1 THEN ' Acute Coronary Syndrome'
  when CAST (ACS AS FLOAT) =0 THEN 'No Acute Coronary Syndrome'
  Else CAST(ACS AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --4.STEMI(ST-Myocardio infection)
     ALTER TABLE SideProjects..AdmissionData
ADD STMYOCARDICINFECTION nvarchar(255)

update SideProjects..AdmissionData
SET STMYOCARDICINFECTION  = Case
  when CAST(STEMI AS FLOAT) =1 THEN ' STEMI'
  when CAST (STEMI AS FLOAT) =0 THEN 'NO STEMI'
  Else CAST(STEMI AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --5.ATYPICAL CHEST PAIN
     ALTER TABLE SideProjects..AdmissionData
ADD ATYPICAL_CHEST_PAIN  nvarchar(255)

update SideProjects..AdmissionData
SET ATYPICAL_CHEST_PAIN = Case
  when CAST([ATYPICAL CHEST PAIN] AS FLOAT) =1 THEN ' Chest pain'
  when CAST ([ATYPICAL CHEST PAIN]  AS FLOAT) =0 THEN 'No Chest pain'
  Else CAST([ATYPICAL CHEST PAIN]  AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --6.HEART FAILURE
     ALTER TABLE SideProjects..AdmissionData
ADD HEART_FAILURE nvarchar(255)

update SideProjects..AdmissionData
SET HEART_FAILURE = Case
  when CAST([HEART FAILURE] AS FLOAT) =1 THEN ' Heart Failure'
  when CAST ([HEART FAILURE] AS FLOAT) =0 THEN 'No Heart Failure'
  Else CAST([HEART FAILURE] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --.[CARDIOGENIC SHOCK]
     ALTER TABLE SideProjects..AdmissionData
ADD CARDIOGENIC_SHOCK  nvarchar(255)

update SideProjects..AdmissionData
SET CARDIOGENIC_SHOCK = Case
  when CAST([CARDIOGENIC SHOCK] AS FLOAT) =1 THEN ' Cardiogenic shock'
  when CAST ([CARDIOGENIC SHOCK] AS FLOAT) =0 THEN 'No Cardiogenic shock'
  Else CAST([CARDIOGENIC SHOCK] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --.DVT
     ALTER TABLE SideProjects..AdmissionData
ADD DEEP_VAIN_THROMBOSIS  nvarchar(255)

update SideProjects..AdmissionData
SET DEEP_VAIN_THROMBOSIS  = Case
  when CAST(DVT AS FLOAT) =1 THEN ' DVT'
  when CAST (DVT AS FLOAT) =0 THEN 'No DVT'
  Else CAST(DVT AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --.INEFECTIVE ENDOCARDITIS
     ALTER TABLE SideProjects..AdmissionData
ADD INFECTIVE_ENDOCARDITIS nvarchar(255)

update SideProjects..AdmissionData
SET INFECTIVE_ENDOCARDITIS = Case
  when CAST([INFECTIVE ENDOCARDITIS] AS FLOAT) =1 THEN ' INFECTIVE_ENDOCARDITIS'
  when CAST ([INFECTIVE ENDOCARDITIS]AS FLOAT) =0 THEN 'NO INFECTIVE_ENDOCARDITIS'
  Else CAST([INFECTIVE ENDOCARDITIS]  AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --11.
     ALTER TABLE SideProjects..AdmissionData
ADD Chronic_Kidney_disease  nvarchar(255)

update SideProjects..AdmissionData
SET Chronic_Kidney_disease = Case
  when CAST(CKD AS FLOAT) =1 THEN ' CHRONIC KIDNEY DISEASE'
  when CAST (CKD AS FLOAT) =0 THEN 'NO CHRONIC KIDNEY DISEASE'
  Else CAST(CKD AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --12.
     ALTER TABLE SideProjects..AdmissionData
ADD Chronic_Kidney_disease  nvarchar(255)

update SideProjects..AdmissionData
SET Chronic_Kidney_disease = Case
  when CAST(CKD AS FLOAT) =1 THEN ' Chronic Kidney disease'
  when CAST (CKD AS FLOAT) =0 THEN 'No Chronic Kidney disease'
  Else CAST(CKD AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
     select * from SideProjects..AdmissionData

     --13.Update the Orthostatic Results
     ALTER TABLE SideProjects..AdmissionData
ADD Orthostatic_results nvarchar(255)

update SideProjects..AdmissionData
SET Orthostatic_results = Case
  when CAST( ORTHOSTATIC AS FLOAT) =1 THEN ' Orthostatic'
  when CAST ( ORTHOSTATIC AS FLOAT) =0 THEN 'No Orthostatic'
  Else CAST( ORTHOSTATIC AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
    
    select * from SideProjects..AdmissionData
     

       ALTER TABLE SideProjects..AdmissionData
     DROP COLUMN [DM]
        select * from SideProjects..AdmissionData
        where D#O#A#CONVERTED IS NOT NULL
    ORDER BY 3,4


 ALTER TABLE SideProjects..AdmissionData
ADD NEURO_CARDIOGENIC_SYNCOPE nvarchar(255)

update SideProjects..AdmissionData
SET NEURO_CARDIOGENIC_SYNCOPE  = Case
  when CAST( [NEURO CARDIOGENIC SYNCOPE] AS FLOAT) =1 THEN ' NEURO CARDIOGENIC SYNCOPE'
  when CAST ( [NEURO CARDIOGENIC SYNCOPE] AS FLOAT) =0 THEN 'NO NEURO CARDIOGENIC SYNCOPE'
  Else CAST( [NEURO CARDIOGENIC SYNCOPE] AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
    
   -- select * from SideProjects..AdmissionData

   --ATRIAL 
    ALTER TABLE SideProjects..AdmissionData
ADD ATRIAL_FIBRILATION nvarchar(255)

update SideProjects..AdmissionData
SET ATRIAL_FIBRILATION = Case
  when CAST( AF AS FLOAT) =1 THEN 'ATRIAL FIBRILATION '
  when CAST ( AF AS FLOAT) =0 THEN 'NO ATRIAL FIBRILATION'
  Else CAST( AF AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData

   --UTI
    ALTER TABLE SideProjects..AdmissionData
ADD Urinary_Tract_Infection nvarchar(255)

update SideProjects..AdmissionData
SET Urinary_Tract_Infection = Case
  when CAST( UTI AS FLOAT) =1 THEN 'Urinary Tract Infection '
  when CAST ( UTI AS FLOAT) =0 THEN 'No Urinary Tract Infection'
  Else CAST( UTI AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData


   --VALVULAR

       ALTER TABLE SideProjects..AdmissionData
ADD Valvular_Heart_Disease nvarchar(255)

update SideProjects..AdmissionData
SET Valvular_Heart_Disease = Case
  when CAST( VALVULAR AS FLOAT) =1 THEN 'Valvular'
  when CAST ( VALVULAR AS FLOAT) =0 THEN 'No Valvular'
  Else CAST( VALVULAR AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData

   --Congenital

       ALTER TABLE SideProjects..AdmissionData
ADD Congenital_results nvarchar(255)

update SideProjects..AdmissionData
SET Congenital_results = Case
  when CAST( CONGENITAL AS FLOAT) =1 THEN 'Congenital'
  when CAST (CONGENITAL AS FLOAT) =0 THEN 'No Congenital'
  Else CAST( CONGENITAL AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData


   --CHB
    ALTER TABLE SideProjects..AdmissionData
ADD Complete_Heart_Block nvarchar(255)

update SideProjects..AdmissionData
SET Complete_Heart_Block = Case
  when CAST(CHB AS FLOAT) =1 THEN 'CHB'
  when CAST (CHB AS FLOAT) =0 THEN 'NO CHB'
  Else CAST( CHB AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData

   --VT
     ALTER TABLE SideProjects..AdmissionData
ADD Ventricular_Tachyacardia  nvarchar(255)

update SideProjects..AdmissionData
SET Ventricular_Tachyacardia = Case
  when CAST(VT AS FLOAT) =1 THEN 'VT'
  when CAST (VT AS FLOAT) =0 THEN 'NO VT'
  Else CAST( VT AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData
   
   --HFREF

    ALTER TABLE SideProjects..AdmissionData
ADD Heart_Failure_with_Red  nvarchar(255)

update SideProjects..AdmissionData
SET Heart_Failure_with_Red = Case
  when CAST(HFREF AS FLOAT) =1 THEN 'HFREF'
  when CAST (HFREF AS FLOAT) =0 THEN 'NO HFREF'
  Else CAST( HFREF AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData

   --AKI
       ALTER TABLE SideProjects..AdmissionData
ADD Acute_Kidney_Injury nvarchar(255)

update SideProjects..AdmissionData
SET Acute_Kidney_Injury = Case
  when CAST(AKI AS FLOAT) =1 THEN 'AKI'
  when CAST (AKI AS FLOAT) =0 THEN 'NO AKI'
  Else CAST(AKI AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData
      

   --AGE
   ALTER TABLE SideProjects..AdmissionData
ADD AGE_RESULTS nvarchar(255)

update SideProjects..AdmissionData
SET AGE_RESULTS = Case
  when CAST(AGE AS FLOAT) >=60 THEN 'Young'
  when CAST (AGE AS FLOAT) <=59 THEN 'Old'
  Else CAST( AGE AS VARCHAR(255))
  END 
   from SideProjects..AdmissionData
   select * from SideProjects..AdmissionData









































    --Change R TO Rural and U to Urban
select distinct [TYPE OF AREA],count( [TYPE OF AREA])
from SideProjects..AdmissionData
group by [TYPE OF AREA]
order by 2

select [TYPE OF AREA]
,CASE when [TYPE OF AREA] ='R' THEN 'Rural'
       when  [TYPE OF AREA] ='U' THEN 'Urban'
       else  [TYPE OF AREA]
        END
          from SideProjects..AdmissionData
update SideProjects..AdmissionData
SET [TYPE OF AREA] = CASE when [TYPE OF AREA] ='R' THEN 'Rural'
       when [TYPE OF AREA] ='U' THEN 'Urban'
       else [TYPE OF AREA]
       END
       from SideProjects..AdmissionData
       select * from  SideProjects..AdmissionData



           --Change OPD TO Outpatient Department and E to Emergency
select distinct [TYPE OF ADMISSION-EMERGENCY/OPD],count( [TYPE OF ADMISSION-EMERGENCY/OPD])
from SideProjects..AdmissionData
group by [TYPE OF ADMISSION-EMERGENCY/OPD]
order by 2

select [TYPE OF ADMISSION-EMERGENCY/OPD]
,CASE when [TYPE OF ADMISSION-EMERGENCY/OPD] ='O' THEN 'Outpatient Department'
       when  [TYPE OF ADMISSION-EMERGENCY/OPD] ='E' THEN 'Emergency'
       else [TYPE OF ADMISSION-EMERGENCY/OPD]
        END
          from SideProjects..AdmissionData

update SideProjects..AdmissionData
SET[TYPE OF ADMISSION-EMERGENCY/OPD] = CASE when [TYPE OF ADMISSION-EMERGENCY/OPD] ='O' THEN 'Outpatient Department'
     when [TYPE OF ADMISSION-EMERGENCY/OPD] ='E' THEN 'Emergency'
       else[TYPE OF ADMISSION-EMERGENCY/OPD]
       END
       from SideProjects..AdmissionData
        select * from  SideProjects..AdmissionData

        --Changing F to female and M to male
 select distinct GENDER,count( GENDER)
from SideProjects..AdmissionData
group by GENDER
order by 2

select GENDER
,CASE when GENDER ='F' THEN 'FEMALE'
       when  GENDER ='M' THEN 'MALE'
       else GENDER
        END
          from SideProjects..AdmissionData

update SideProjects..AdmissionData
SET GENDER = CASE when GENDER ='F' THEN 'FEMALE'
       when GENDER ='M' THEN 'MALE'
       else GENDER
       END
       from SideProjects..AdmissionData

     select * from  SideProjects..AdmissionData

    







      

    
    

