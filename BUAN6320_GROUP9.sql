CREATE DATABASE IF NOT EXISTS CarbonEmissionsDB;
USE CarbonEmissionsDB;

-- Vehicles Table
CREATE TABLE IF NOT EXISTS Vehicles (
    Vehicle_ID VARCHAR(255),
    Make VARCHAR(255),
    Model VARCHAR(255),
    Year NUMERIC,
    Fuel_Type_ID VARCHAR(255),
    Transmission_ID VARCHAR(255),
    Drive VARCHAR(255),
    Engine_Displacement DECIMAL(10 , 5 ),
    Cylinders DECIMAL(10 , 5 ),
    Fuel_Type2 DECIMAL(10 , 5 ),
    MPG_City NUMERIC,
    MPG_Highway NUMERIC,
    MPG_Combined NUMERIC,
    CO2_Emission_ID VARCHAR(255)
);

-- Create Fuel_Type Table
CREATE TABLE IF NOT EXISTS Fuel_Type (
    Fuel_Type_ID VARCHAR(255),
    Fuel_Type_Name VARCHAR(400)
);

-- Create table Transmission
CREATE TABLE IF NOT EXISTS Transmission (
    Transmission_ID VARCHAR(50) PRIMARY KEY,
    Transmission_Type VARCHAR(255)
);

-- Create EPA Utility table
CREATE TABLE EPA_Utility_Factor (
    EPA_Utility_ID VARCHAR(50) PRIMARY KEY,
    Vehicle_ID VARCHAR(50),
    EPA_City_Utility_Factor INT,
    EPA_Combined_Utility_Factor INT,
    EPA_Highway_Utility_Factor INT
);


-- Create Emissions table
CREATE TABLE CO2_Emission (
    CO2_Emission_ID VARCHAR(50) PRIMARY KEY,
    Co2_Tailpipe_For_Fuel_Type1 INT,
    Co2_Tailpipe_For_Fuel_Type2 INT
);

-- Create Charging_time
CREATE TABLE Charging_time (
    Charging_ID VARCHAR(50) PRIMARY KEY,
    Vehicle_ID VARCHAR(50),
    Time_To_Charge_At_120V INT,
    Time_To_Charge_At_240V INT
);


-- Create Vehicle_Specification Table
CREATE TABLE IF NOT EXISTS Vehicle_Specification (
    Spec_ID VARCHAR(50),
    Vehicle_ID VARCHAR(50),
    Cylinders INT,
    Drive VARCHAR(50),
    Transmission VARCHAR(50),
    Fuel_Type1 VARCHAR(50),
    Engine_Descriptor VARCHAR(100)
);

-- Create Annual Cost table
CREATE TABLE IF NOT EXISTS Annual_Cost_Emission (
    Cost_ID VARCHAR(50) PRIMARY KEY,
    Emissions_ID VARCHAR(50),
    Annual_Fuel_Cost_Type1 DECIMAL(10 , 2 ),
    Save_Spend NUMERIC,
    CO2_Tailpipe_Type1 VARCHAR(100)
);

-- Create MPG table
CREATE TABLE IF NOT EXISTS MPG_Data (
    MPG_ID VARCHAR(10),
    Vehicle_ID VARCHAR(20),
    Unrounded_City_MPG_Type1 DECIMAL(10 , 4 ),
    Unrounded_City_MPG_Type2 DECIMAL(10 , 4 ),
    Unrounded_Highway_MPG_Type1 DECIMAL(10 , 4 ),
    Unrounded_Highway_MPG_Type2 DECIMAL(10 , 4 ),
    Unrounded_Combined_MPG_Type1 DECIMAL(10 , 4 ),
    Unrounded_Combined_MPG_Type2 DECIMAL(10 , 4 )
);

-- Create Vehicle_Size
CREATE TABLE IF NOT EXISTS Vehicle_Size (
    Vehicle_ID VARCHAR(20) PRIMARY KEY,
    Vehicle_Size_Class VARCHAR(100),
    Size_Class_ID VARCHAR(20)
);

-- Create Engine_Descriptor
CREATE TABLE IF NOT EXISTS Engine_Descriptor (
    Descriptor_ID VARCHAR(20) PRIMARY KEY,
    Vehicle_ID VARCHAR(20),
    Engine_Descriptor VARCHAR(100)
);

-- Create CO2_Emission_factor
CREATE TABLE IF NOT EXISTS CO2_Emission_Factor (
    Factor_ID VARCHAR(255),
    Fuel_Type_ID VARCHAR(255),
    Co2_Fuel_Type1 DECIMAL(5 , 2 ),
    Co2_Fuel_Type2 DECIMAL(5 , 2 )
);

-- Create GHG Score Table
CREATE TABLE IF NOT EXISTS GHG_Score (
    GHG_Score_ID NUMERIC PRIMARY KEY,
    Vehicle_ID VARCHAR(255),
    GHG_Score DECIMAL(10 , 2 ),
    GHG_Score_Alternative_Fuel DECIMAL(10 , 2 )
);
    
 -- Create Vehicle_range table   
CREATE TABLE IF NOT EXISTS Vehicle_Range (
    Range_ID NUMERIC PRIMARY KEY,
    Vehicle_ID VARCHAR(255),
    Range_Type1 DECIMAL(10 , 2 ),
    Range_City_Type1 DECIMAL(10 , 2 ),
    Range_City_Type2 DECIMAL(10 , 2 ),
    Range_Highway_Type1 DECIMAL(10 , 2 ),
    Range_Highway_Type2 DECIMAL(10 , 2 )
);

-- Create Fuel_Cost Table
CREATE TABLE IF NOT EXISTS Fuel_Cost (
    Cost_ID NUMERIC PRIMARY KEY,
    Vehicle_ID VARCHAR(255),
    Annual_Fuel_Cost_Type1 DECIMAL(10 , 2 ),
    Annual_Fuel_Cost_Type2 DECIMAL(10 , 2 )
);

-- Insert into Vehicles Table
INSERT INTO Vehicles (Vehicle_ID, Make, Model, Year, Fuel_Type_ID, Transmission_ID, Drive, Engine_Displacement, Cylinders, Fuel_Type2 , MPG_City, MPG_Highway, MPG_Combined, CO2_Emission_ID) VALUES 
('ACRLX', 'Acura', 'RLX Hybrid', 2017, 'Hybrid17', 'AWDhybrid', 'All-Wheel Drive', 3.5, 6.0, 10.2589, 29, 30, 29, 'EM001'),
('ACMDX', 'Acura', 'MDX AWD', 2018, 'AAWD18', 'awdmdx', 'All-Wheel Drive', 3.5, 6.0, 14.1671, 18, 26, 21, 'EM002'),
('ACILX', 'Acura', 'ILX', 2019, 'ILX19', 'fwdilx', 'Front-Wheel Drive', 2.4, 4.0, 10.6253, 24, 34, 28, 'EM003'),
('ACNSX', 'Acura', 'NSX Hybrid', 2020, 'Hybrid20', 'AWDhybrid20', 'All-Wheel Drive', 3.5, 6.0, 14.1671, 21, 22, 21, 'EM004'),
('ACRDX', 'Acura', 'RDX FWD', 2021, 'AFWD21', 'fwdrdx', 'Front-Wheel Drive', 2.0, 4.0, 12.3962, 22, 28, 24, 'EM005'),
  ('ASV', 'Aston Martin', 'V8 Vantage', 2012, 'Vantage08', 'RWDvantage', 'Rear-Wheel Drive', 4.7, 8.0, 19.8340, 13, 19, 15, 'EM006'),
  ('ASDBVol', 'Aston Martin', 'DB9 Volante', 2008, 'Volante08', 'RWDvolante', 'Rear-Wheel Drive', 5.9, 12.0, 22.8853, 11, 17, 13, 'EM007'),
  ('ASLagonda', 'Aston Martin', 'Lagonda', 1985, 'Lagonda85', 'RWDlagonda', 'Rear-Wheel Drive', 5.3, 8.0, 37.1887, 7, 9, 8, 'EM008'),
  ('ASSaloon', 'Aston Martin', 'Saloon', 1985, 'Saloon85', 'RWDsaloon', 'Rear-Wheel Drive', 5.3, 8.0, 37.1887, 7, 10, 8, 'EM009'),
  ('ASDBCou', 'Aston Martin', 'DB9 Coupe', 2008, 'Coupe08', 'RWDBcoupe', 'Rear-Wheel Drive', 5.9, 12.0, 24.7925, 10, 16, 12, 'EM010'),
  ('AURS', 'Audi', 'RS 3', 2017, 'RS317', 'awdrs', 'All-Wheel Drive', 2.5, 5.0, 13.5231, 19, 28, 22, 'EM011'),
  ('AUA4', 'Audi', 'A4 Ultra', 2018, 'Ultra18', 'FWDultra', 'Front-Wheel Drive', 2.0, 4.0, 9.5970, 27, 37, 31, 'EM012'),
  ('AUA5', 'Audi', 'A5 Cabriolet quattro', 2019, 'quattro19', 'AWDquattro', 'All-Wheel Drive', 2.0, 4.0, 11.0188, 23, 34, 27, 'EM013'),
  ('AUSQ', 'Audi', 'SQ7', 2020, 'SQ720', 'awdsq', 'All-Wheel Drive', 4.0, 8.0, 17.5005, 15, 21, 17, 'EM014'),
  ('BEMulsanne', 'Bentley', 'Mulsanne', 2019, 'Mulsanne19', 'RWDmulsanne', 'Rear-Wheel Drive', 6.8, 8.0, 24.7925, 10, 16, 12, 'EM015'),
  ('BEContinental', 'Bentley', 'Continental GT Convertible', 2020, 'Convertible20', 'AWDGTconvertible', 'All-Wheel Drive', 4.0, 8.0, 15.6584, 16, 26, 19, 'EM016'),
  ('BEBentayga', 'Bentley', 'Bentayga', 2022, 'Bentayga22', 'AWDbentayga', 'All-Wheel Drive', 4.0, 8.0, 16.5283, 15, 24, 18, 'EM017'),
  ('BEAzure', 'Bentley', 'Azure', 1998, 'Azure98', 'RWDazure', 'Rear-Wheel Drive', 6.7, 8.0, 24.7925, 10, 15, 12, 'EM018'),
  ('BM640i', 'BMW', '640i xDrive Convertible', 2017, 'Convertible17', 'AWDconvertible', 'All-Wheel Drive', 3.0, 6.0, 13.5231, 19, 28, 22, 'EM019'),
  ('BMM6', 'BMW', 'M6 Coupe', 2017, 'Coupe17', 'RWDcoupe', 'Rear-Wheel Drive', 4.4, 8.0, 17.5005, 15, 22, 17, 'EM020'), 
  ('BMX3', 'BMW', 'X3 xDrive35i', 2017, 'Drive35i17', 'awdx3', 'All-Wheel Drive', 3.0, 6.0, 14.1671, 19, 26, 21, 'EM021'),
  ('BMX4', 'BMW', 'X4 M40i', 2017, 'i17', 'AWDi', 'All-Wheel Drive', 3.0, 6.0, 14.1671, 19, 26, 21, 'EM022'),
  ('BMM4', 'BMW', 'M4 GTS', 2016, 'GTS06', 'rwdm4', 'Rear-Wheel Drive', 3.0, 6.0, 15.6584, 16, 23, 19, 'EM023'),
  ('BUChiron', 'Bugatti', 'Chiron Super Sport', 2024, 'Sport24', 'AWDsport', 'All-Wheel Drive', 8.0, 16.0, 33.0566, 8, 11, 9, 'EM024'),
  ('BUVeyron', 'Bugatti', 'Veyron', 2014, 'Veyron14', 'AWDveyron', 'All-Wheel Drive', 8.0, 16.0, 29.751, 8, 15, 10, 'EM025'),
  ('BUDivo', 'Bugatti', 'Divo', 2020, 'Divo20', 'AWDdivo', 'All-Wheel Drive', 8.0, 16.0, 29.751, 9, 13, 10, 'EM026'),
  ('BULaCrosse', 'Buick', 'LaCrosse AWD', 2019, 'BAWD19', 'awdlacrosse', 'All-Wheel Drive', 3.6, 6.0, 12.9352, 20, 29, 23, 'EM027'),
  ('BURegal', 'Buick', 'Regal', 2020, 'Regal20', 'FWDregal', 'Front-Wheel Drive', 2.0, 4.0, 11.4426, 22, 32, 26, 'EM028'),
  ('BUCentury', 'Buick', 'Century', 1988, 'Century88', 'FWDcentury', 'Front-Wheel Drive', 2.5, 4.0, 12.3962, 21, 29, 24, 'EM029'),
  ('BULucerne', 'Buick', 'Lucerne', 2010, 'Lucerne10', 'FWDlucerne', 'Front-Wheel Drive', 3.9, 6.0, 14.8755, 17, 26, 20, 'EM030'),
  ('BUSkyhawk', 'Buick', 'Skyhawk', 1985, 'Skyhawk85', 'FWDskyhawk', 'Front-Wheel Drive', 1.8, 4.0, 13.5231, 19, 27, 22, 'EM031'),
  ('CAEscalade', 'Cadillac', 'Escalade 2WD', 2017, 'CWD17', 'rwd2wd', 'Rear-Wheel Drive', 6.2, 8.0, 17.5005, 15, 22, 17, 'EM032'),
  ('CAATS', 'Cadillac', 'ATS-V', 2018, 'V18', 'rwdats', 'Rear-Wheel Drive', 3.6, 6.0, 14.8755, 17, 25, 20, 'EM033'),
  ('CAXTS', 'Cadillac', 'XTS', 2019, 'XTS19', 'fwdxts', 'Front-Wheel Drive', 3.6, 6.0, 13.5231, 19, 28, 22, 'EM034'),
  ('CACTS', 'Cadillac', 'CTS-V', 2019, 'V19', 'rwdcts', 'Rear-Wheel Drive', 6.2, 8.0, 18.5943, 14, 21, 16, 'EM035'),
  ('CHCamaro', 'Chevrolet', 'Camaro', 2017, 'Camaro17', 'RWDcamaro', 'Rear-Wheel Drive', 2.0, 4.0, 12.9352, 20, 30, 23, 'EM036'),
  ('CHSilverado', 'Chevrolet', 'Silverado C15 2WD', 2017, '2WD17', 'rwdc15', 'Rear-Wheel Drive', 6.2, 8.0, 17.5005, 15, 21, 17, 'EM037'),
  ('CHG', 'Chevrolet', 'G10/20 Van 2WD', 1987, '2WD87', 'rwdvanwd', 'Rear-Wheel Drive', 4.3, 6.0, 18.5943, 15, 18, 16, 'EM038'),
  ('CHEquinox', 'Chevrolet', 'Equinox FWD', 2018, 'CFWD18', 'fwdequinox', 'Front-Wheel Drive', 2.0, 4.0, 11.9004, 22, 29, 25, 'EM039'),
  ('CHSonic', 'Chevrolet', 'Sonic', 2018, 'Sonic18', 'FWDsonic', 'Front-Wheel Drive', 1.4, 4.0, 9.917, 27, 35, 30, 'EM040'),
  ('CHPacifica', 'Chrysler', 'Pacifica Hybrid', 2022, 'Hybrid22', 'FWDhybrid', 'Front-Wheel Drive', 3.6, 6.0, 4.0226, 29, 30, 30, 'EM041'),
  ('CHLeBaron', 'Chrysler', 'LeBaron GTS', 1985, 'GTS85', 'fwdlebaron', 'Front-Wheel Drive', 2.2, 4.0, 15.6584, 18, 22, 19, 'EM042'),
  ('CHQC', 'Chrysler', 'QC Car', 1988, 'Car88', 'FWDcar', 'Front-Wheel Drive', 2.2, 4.0, 15.6584, 17, 21, 19, 'EM043'),
  ('CHConquest', 'Chrysler', 'Conquest', 1987, 'Conquest87', 'RWDconquest', 'Rear-Wheel Drive', 2.6, 4.0, 16.5283, 16, 22, 18, 'EM044'),
  ('CHLaser', 'Chrysler', 'Laser/Daytona', 1987, 'Daytona87', 'FWDdaytona', 'Front-Wheel Drive', 2.2, 4.0, 15.6584, 17, 22, 19, 'EM045'),
  ('DODart', 'Dodge', 'Dart', 2016, 'Dart16', 'FWDdart', 'Front-Wheel Drive', 1.4, 4.0, 9.5970, 27, 38, 31, 'EM046'),
  ('DODurango', 'Dodge', 'Durango RWD', 2017, 'RWD17', 'rwddurango', 'Rear-Wheel Drive', 5.7, 8.0, 17.5005, 14, 22, 17, 'EM047'),
  ('DOChallenger', 'Dodge', 'Challenger', 2017, 'Challenger17', 'RWDchallenger', 'Rear-Wheel Drive', 5.7, 8.0, 16.5283, 15, 23, 18, 'EM048'),
  ('DOB', 'Dodge', 'B250 Van 2WD', 1987, 'DWD87', 'b2502wd', 'Rear-Wheel Drive', 5.2, 8.0, 22.8853, 11, 16, 13, 'EM049'),
  ('DOCharger', 'Dodge', 'Charger AWD', 2018, 'DAWD18', 'awdcharger', 'All-Wheel Drive', 3.6, 6.0, 14.1671, 18, 27, 21, 'EM050'),
  ('FOMustang', 'Ford', 'Mustang', 2017, 'Mustang17', 'RWDmustang', 'Rear-Wheel Drive', 2.3, 4.0, 12.3962, 21, 30, 24, 'EM051'),
  ('FOF', 'Ford', 'F150 Pickup 2WD FFV', 2017, 'FFV17', 'rwdP2wd', 'Rear-Wheel Drive', 3.5, 6.0, 14.8755, 18, 24, 20, 'EM052'),
  ('FOEdge', 'Ford', 'Edge AWD', 2017, 'FAWD17', 'awdedge', 'All-Wheel Drive', 2.0, 4.0, 12.9352, 20, 27, 23, 'EM053'),
  ('FOFocus', 'Ford', 'Focus FWD', 2017, 'FWD17', 'fwdfocus', 'Front-Wheel Drive', 2.0, 4.0, 9.597, 26, 38, 31, 'EM054'),
  ('FOFusion', 'Ford', 'Fusion AWD', 2018, 'FAWD18', 'awdfusion', 'All-Wheel Drive', 2.7, 6.0, 14.8755, 17, 26, 20, 'EM055'),
  ('GEG80', 'Genesis', 'G80 AWD', 2017, 'AWD19', 'awdg80', 'All-Wheel Drive', 3.8, 6.0, 15.6581, 16, 25, 19, 'EM056'),
  ('GEG90', 'Genesis', 'G90 AWD', 2017, 'G90AWD17', 'awdg90', 'All-Wheel Drive', 3.3, 6.0, 14.8755, 17, 24, 20, 'EM057'),
  ('GEG70', 'Genesis', 'G70 RWD', 2019, 'RWD19', 'rwdg70', 'Rear-Wheel Drive', 2.0, 4.0, 13.5231, 18, 28, 22, 'EM058'),
  ('GEGV70', 'Genesis', 'GV70 AWD', 2024, 'AWD24', 'awdgv70', 'All-Wheel Drive', 3.5, 6.0, 14.8755, 18, 24, 20, 'EM059'),
  ('GEGV80', 'Genesis', 'GV80 RWD', 2022, 'RWD22', 'rwdgv80', 'Rear-Wheel Drive', 2.5, 4.0, 12.935, 21, 25, 23, 'EM060'),
  ('GMAcadia', 'GMC', 'Acadia AWD', 2017, 'GAWD17', 'awdacadia', 'All-Wheel Drive', 3.6, 6.0, 14.8755, 18, 25, 20, 'EM061'),
  ('GMYukon', 'GMC', 'Yukon C1500 XL 2WD', 2017, 'WD17', 'rwdxl', 'Rear-Wheel Drive', 5.3, 8.0, 15.6584, 16, 23, 19, 'EM062'),
  ('GMT', 'GMC', 'T15 (S15) Pickup 4WD', 1987, 'WD87', 'wawdSpickup', '4-Wheel or All-Wheel Drive', 2.8, 6.0, 17.5005, 15, 21, 17, 'EM063'),
  ('GMTerrain', 'GMC', 'Terrain AWD', 2018, 'ATWD18', 'awdterrain', 'All-Wheel Drive', 1.6, 4.0, 11.162, 28, 38, 32, 'EM064'),
  ('GMSierra', 'GMC', 'Sierra K10 4WD', 2019, 'WD19', 'wdk10', '4-Wheel Drive', 6.2, 8.0, 17.5005, 15, 20, 17, 'EM065'),
  ('HOAccord', 'Honda', 'Accord', 2017, 'Accord17', 'FWDaccord', 'Front-Wheel Drive', 2.4, 4.0, 11.442, 23, 32, 26, 'EM066'),
  ('HOCivic', 'Honda', 'Civic 4Dr', 2018, 'Dr018', 'FWDdr', 'Front-Wheel Drive', 1.5, 4.0, 8.2641, 32, 42, 36, 'EM067'),
  ('HOHybrid', 'Honda', 'Accord Hybrid', 2021, 'Hybrid21', 'FWDhybrid21', 'Front-Wheel Drive', 2.0, 4.0, 6.1981, 48, 48, 48, 'EM068'),
  ('HOInsight', 'Honda', 'Insight', 2022, 'Insight22', 'FWDinsight', 'Front-Wheel Drive', 1.5, 4.0, 5.7213, 55, 49, 52, 'EM069'),
  ('HOOdyssey', 'Honda', 'Odyssey', 2012, 'Odyssey12', 'FWDodyssey', 'Front-Wheel Drive', 3.5, 6.0, 13.523, 19, 27, 22, 'EM070'),
  ('HYSonata', 'Hyundai', 'Sonata', 2017, 'Sonata17', 'FWDsonata', 'Front-Wheel Drive', 4.0, 4.0, 10.2589, 25, 36, 29, 'EM071'),
  ('HYTucson', 'Hyundai', 'Tucson AWD', 2017, 'AWD17', 'awdtucson', 'All-Wheel Drive', 4.0, 4.0, 12.9352, 21, 26, 23, 'EM072'),
  ('HYSanta', 'Hyundai', 'Santa Fe FWD', 2018, 'FWD18', 'fwdsanta', 'Front-Wheel Drive', 6.0, 6.0, 14.1671, 18, 25, 21, 'EM073'),
  ('HYKona', 'Hyundai', 'Kona FWD', 2019, 'FWD19', 'fwdkona', 'Front-Wheel Drive', 4.0, 4.0, 9.917, 27, 33, 30, 'EM074'),
  ('HYIoniq', 'Hyundai', 'Ioniq Blue', 2020, 'Blue20', 'FWDblue', 'Front-Wheel Drive', 4.0, 4.0, 5.1294, 57, 59, 58, 'EM075'),
  ('INQ50', 'Infiniti', 'Q50S AWD', 2016, 'AWD01', 'awdq50', 'All-Wheel Drive', 3.0, 6.0, 14.1671, 18, 26, 21, 'EM076'),
  ('INQX', 'Infiniti', 'QX70 RWD', 2017, 'RWD06', 'rwdqx', 'Rear-Wheel Drive', 3.7, 6.0, 15.6584, 17, 24, 19, 'EM077'),
  ('INQ60', 'Infiniti', 'Q60', 2017, 'Q6017', 'rwdq60', 'Rear-Wheel Drive', 3.0, 6.0, 13.5231, 19, 28, 22, 'EM078'),
  ('ING20', 'Infiniti', 'G20', 1996, 'G2096', 'fwdg20', 'Front-Wheel Drive', 2.0, 4.0, 12.3962, 21, 29, 24, 'EM079'),
  ('INQ45', 'Infiniti', 'Q45', 1996, 'Q4596', 'rwdq45', 'Rear-Wheel Drive', 4.5, 8.0, 17.5005, 15, 20, 17, 'EM080'),
  ('JECherokee', 'Jeep', 'Cherokee/Wagoneer 4WD', 1987, '4WD87', 'wawdcherokee', '4-Wheel or All-Wheel Drive', 2.1, 4.0, 14.2878, 24, 26, 25, 'EM081'),
  ('JETrackhawk', 'Jeep', 'Grand Cherokee Trackhawk 4WD', 2019, '4WD21', 'awdtrackhawk', 'All-Wheel Drive', 6.2, 8.0, 22.88, 11, 17, 13, 'EM082'),
  ('JERenegade', 'Jeep', 'Renegade 2WD', 2021, '2WD21', 'fwdrenegade', 'Front-Wheel Drive', 1.3, 4.0, 11.0188, 24, 32, 27, 'EM083'),
  ('JEGrand', 'Jeep', 'Grand Wagoneer 4WD', 2022, '4WD22', 'awdgrand', 'All-Wheel Drive', 6.4, 8.0, 19.834, 13, 18, 15, 'EM084'),
  ('JECJ', 'Jeep', 'CJ7', 1986, 'CJ786', 'wawdcj', '4-Wheel or All-Wheel Drive', 4.2, 6.0, 19.834, 15, 17, 15, 'EM085'),
  ('KIStinger', 'Kia', 'Stinger AWD', 2018, 'AWD18', 'awdstinger', 'All-Wheel Drive', 3.3, 6.0, 14.8755, 17, 25, 20, 'EM086'),
  ('KISeltos', 'Kia', 'Seltos FWD', 2021, 'FWD21', 'fwdseltos', 'Front-Wheel Drive', 2.0, 4.0, 9.5970, 29, 34, 31, 'EM087'),
  ('KIEV', 'Kia', 'EV6 RWD (Long Range)', 2022, 'Range06', 'RWDrange)', 'Rear-Wheel Drive', null, null, 0.0696, 134, 101, 117, 'EM088'),
  ('KISorento', 'Kia', 'Sorento FWD', 2023, 'FWD23', 'fwdsorento', 'Front-Wheel Drive', 2.5, 4.0, 11.4426, 24, 29, 26, 'EM089'),
  ('KIOptima', 'Kia', 'Optima', 2010, 'Optima10', 'FWDoptima', 'Front-Wheel Drive', 2.4, 4.0, 11.9004, 22, 32, 25, 'EM090');

--  Insert Into Fuel Type Table
INSERT INTO Fuel_Type (Fuel_Type_ID, Fuel_Type_Name) VALUES 
  ('Hybrid17', 'Premium'),
  ('AAWD18', 'Premium'),
  ('ILX19', 'Premium'),
  ('Hybrid20', 'Premium'),
  ('AFWD21', 'Premium'),
    ('Vantage08', 'Premium') ,
    ('Volante08', 'Premium') ,
    ('Lagonda85', 'Regular') ,
    ('Saloon85', 'Regular') ,
    ('Coupe08', 'Premium') ,
    ('RS317', 'Premium') ,
    ('Ultra18', 'Premium') ,
    ('quattro19', 'Premium') ,
    ('SQ720', 'Premium') ,
    ('Mulsanne19', 'Premium') ,
    ('Convertible20', 'Premium') ,
    ('Bentayga22', 'Premium') ,
    ('Azure98', 'Premium') ,
    ('Convertible17', 'Premium') ,
    ('Coupe17', 'Premium') ,
    ('Drive35i17', 'Premium') ,
    ('i17', 'Premium') ,
    ('GTS06', 'Premium') ,
    ('Sport24', 'Premium') ,
    ('Veyron14', 'Premium') ,
    ('Divo20', 'Premium') ,
    ('BAWD19', 'Regular') ,
    ('Regal20', 'Premium') ,
    ('Century88', 'Regular') ,
    ('Lucerne10', 'Gasoline or E85') ,
    ('Skyhawk85', 'Premium') ,
    ('CWD17', 'Regular') ,
    ('V18', 'Premium') ,
    ('XTS19', 'Regular') ,
    ('V19', 'Premium') ,
    ('Camaro17', 'Premium') ,
    ('2WD17', 'Regular') ,
    ('2WD87', 'Regular') ,
    ('CFWD18', 'Premium') ,
    ('Sonic18', 'Regular') ,
    ('Hybrid22', 'Regular Gas and Electricity') ,
    ('GTS85', 'Premium') ,
    ('Car88', 'Premium') ,
    ('Conquest87', 'Premium') ,
    ('Daytona87', 'Premium') ,
    ('Dart16', 'Premium') ,
    ('RWD17', 'Midgrade') ,
    ('Challenger17', 'Premium') ,
    ('DWD87', 'Regular') ,
    ('DAWD18', 'Regular') ,
    ('Mustang17', 'Regular') ,
    ('FFV17', 'Gasoline or E85') ,
    ('FAWD17', 'Regular') ,
    ('FWD17', 'Regular') ,
    ('FAWD18', 'Regular') ,
    ('AWD19', 'Regular') ,
    ('G90AWD17', 'Premium') ,
    ('RWD19', 'Premium') ,
    ('AWD24', 'Premium') ,
    ('RWD22', 'Premium') ,
    ('GAWD17', 'Regular') ,
    ('WD17', 'Regular') ,
    ('WD87', 'Regular') ,
    ('ATWD18', 'Diesel') ,
    ('WD19', 'Premium') ,
    ('Accord17', 'Regular') ,
    ('Dr018', 'Regular') ,
    ('Hybrid21', 'Regular') ,
    ('Insight22', 'Regular') ,
    ('Odyssey12', 'Regular') ,
    ('Sonata17', 'Regular') ,
    ('AWD17', 'Regular') ,
    ('FWD18', 'Regular') ,
    ('FWD19', 'Regular') ,
    ('Blue20', 'Regular') ,
    ('AWD01', 'Premium') ,
    ('RWD06', 'Premium') ,
    ('Q6017', 'Premium') ,
    ('G2096', 'Regular') ,
    ('Q4596', 'Premium') ,
    ('4WD87', 'Diesel') ,
    ('4WD21', 'Premium') ,
    ('2WD21', 'Regular') ,
    ('4WD22', 'Premium') ,
    ('CJ786', 'Regular') ,
    ('AWD18', 'Premium') ,
    ('FWD21', 'Regular') ,
    ('Range06', 'Electricity') ,
    ('FWD23', 'Regular') ,
    ('Optima10', 'Regular');

-- Insert into Transmission
INSERT INTO Transmission VALUES 
 ('AWDhybrid', 'Automatic (AM-S8)'),
('awdmdx', 'Automatic (S9)'),
('fwdilx', 'Automatic (AM-S9)'),
('AWDhybrid20', 'Automatic (S10)'),
('fwdrdx', 'Automatic (AM-S7)'),
('RWDvantage', 'Automatic (S6)'),
('RWDvolante', 'Manual 6-spd'),
('RWDlagonda', 'Automatic 3-spd'),
('RWDsaloon', 'Manual 5-spd'),
('RWDBcoupe', 'Manual 6-spd'),
('awdrs', 'Automatic (AM-S7)'),
('FWDultra', 'Automatic (S8)'),
('AWDquattro', 'Automatic 4-spd'),
('awdsq', 'Automatic (AM-S8)'),
('RWDmulsanne', 'Automatic (S8)'),
('AWDGTconvertible', 'Automatic 4-spd'),
('AWDbentayga', 'Automatic 3-spd'),
('RWDazure', 'Automatic (variable gear ratios)'),
('AWDconvertible', 'Automatic 3-spd'),
('RWDcoupe', 'Manual 5-spd'),
('awdx3', 'Automatic 3-spd'),
('AWDi', 'Automatic 3-spd'),
('rwdm4', 'Automatic (AM-S7)'),
('AWDsport', 'Automatic (AM-S7)'),
('AWDveyron', 'Automatic (AM-S7)'),
('AWDdivo', 'Automatic (AM-S7)'),
('awdlacrosse', 'Automatic (S9)'),
('FWDregal', 'Automatic (S9)'),
('FWDcentury', 'Automatic 3-spd'),
('FWDlucerne', 'Automatic 4-spd'),
('FWDskyhawk', 'Manual 4-spd'),
('rwd2wd', 'Automatic 8-spd'),
('rwdats', 'Automatic (S8)'),
('fwdxts', 'Automatic 6-spd'),
('rwdcts', 'Automatic (S6)'),
('RWDcamaro', 'Automatic (S8)'),
('rwdc15', 'Automatic (S8)'),
('rwdvanwd', 'Manual 4-spd'),
('fwdequinox', 'Automatic 6-spd'),
('FWDsonic', 'Automatic 6-spd'),
('FWDhybrid', 'Automatic (AM-S6)'),
('fwdlebaron', 'Automatic (variable gear ratios)'),
('FWDcar', 'Automatic 3-spd'),
('RWDconquest', 'Manual 5-spd'),
('FWDdaytona', 'Automatic (variable gear ratios)'),
('FWDdart', 'Automatic 6-spd'),
('rwddurango', 'Automatic 8-spd'),
('RWDchallenger', 'Manual 6-spd'),
('b2502wd', 'Automatic 6-spd'),
('awdcharger', 'Automatic 8-spd'),
('RWDmustang', 'Automatic (S8)'),
('rwdP2wd', 'Automatic (S8)'),
('awdedge', 'Manual 6-spd'),
('fwdfocus', 'Automatic 10-spd'),
('awdfusion', 'Automatic (S6)'),
('awdg80', 'Automatic (AM-S7)'),
('awdg90', 'Automatic (AM-S7)'),
('rwdg70', 'Automatic (AM-S7)'),
('awdgv70', 'Automatic (AM-S7)'),
('rwdgv80', 'Automatic (AM-S7)'),
('awdacadia', 'Automatic 6-spd'),
('rwdxl', 'Automatic 6-spd'),
('wawdSpickup', 'Manual 6-spd'),
('awdterrain', 'Automatic (S8)'),
('wdk10', 'Automatic (S8)'),
('FWDaccord', 'Automatic (S8)'),
('FWDdr', 'Automatic (S8)'),
('FWDhybrid21', 'Automatic (S8)'),
('FWDinsight', 'Automatic (S8)'),
('FWDodyssey', 'Automatic (S8)'),
('FWDsonata', 'Automatic (S8)'),
('awdtucson', 'Automatic (S8)'),
('fwdsanta', 'Automatic (S8)'),
('fwdkona', 'Automatic (S8)'),
('FWDblue', 'Automatic (S8)'),
('awdq50', 'Automatic (S8)'),
('rwdqx', 'Automatic (S8)'),
('rwdq60', 'Automatic (S8)'),
('fwdg20', 'Automatic (S8)'),
('rwdq45', 'Automatic (S8)'),
('wawdcherokee', 'Automatic (S8)'),
('awdtrackhawk', 'Automatic (S8)'),
('fwdrenegade', 'Automatic (S8)'),
('awdgrand', 'Automatic (S8)'),
('wawdcj', 'Automatic (S8)'),
('awdstinger', 'Automatic (S8)'),
('fwdseltos', 'Automatic (S8)'),
('RWDrange)', 'Automatic (S8)'),
('fwdsorento', 'Automatic (S8)'),
('FWDoptima', 'Automatic (S8)');


-- Insert into CO2 emissions
INSERT INTO CO2_Emission (Co2_Tailpipe_For_Fuel_Type1, Co2_Tailpipe_For_Fuel_Type2, CO2_Emission_ID) VALUES
(29, 306, 'EM001'),
(21, 424, 'EM002'),
(28, 316, 'EM003'),
(21, 420, 'EM004'),
(24, 370, 'EM005'),
(15, 592.4666667, 'EM006'),
(13, 683.6153846, 'EM007'),
(8, 1110.875, 'EM008'),
(8, 1110.875, 'EM009'),
(12, 740.5833333, 'EM010'),
(22, 399, 'EM011'),
(31, 284, 'EM012'),
(27, 328, 'EM013'),
(17, 516, 'EM014'),
(12, 749, 'EM015'),
(19, 469, 'EM016'),
(18, 497, 'EM017'),
(12, 740.5833333, 'EM018'),
(22, 398, 'EM019'),
(17, 519, 'EM020'),
(21, 418, 'EM021'),
(21, 418, 'EM022'),
(19, 477, 'EM023'),
(9, 979, 'EM024'),
(10, 847, 'EM025'),
(10, 864, 'EM026'),
(23, 383, 'EM027'),
(26, 343, 'EM028'),
(24, 370.2916667, 'EM029'),
(20, 444.35, 'EM030'),
(22, 403.9545455, 'EM031'),
(17, 512, 'EM032'),
(20, 469, 'EM033'),
(22, 408, 'EM034'),
(16, 543, 'EM035'),
(23, 380, 'EM036'),
(17, 522, 'EM037'),
(16, 555.4375, 'EM038'),
(25, 355, 'EM039'),
(30, 296, 'EM040'),
(30, 119, 'EM041'),
(19, 467.7368421, 'EM042'),
(19, 467.7368421, 'EM043'),
(18, 493.7222222, 'EM044'),
(19, 467.7368421, 'EM045'),
(31, 285, 'EM046'),
(17, 525, 'EM047'),
(18, 494, 'EM048'),
(13, 683.6153846, 'EM049'),
(21, 415, 'EM050'),
(24, 370, 'EM051'),
(20, 437, 'EM052'),
(23, 393, 'EM053'),
(31, 289, 'EM054'),
(20, 444, 'EM055'),
(19, 459, 'EM056'),
(20, 448, 'EM057'),
(22, 410, 'EM058'),
(20, 441, 'EM059'),
(23, 394, 'EM060'),
(20, 437, 'EM061'),
(19, 477, 'EM062'),
(17, 522.7647059, 'EM063'),
(32, 319, 'EM064'),
(17, 525, 'EM065'),
(26, 334, 'EM066'),
(36, 247, 'EM067'),
(48, 183, 'EM068'),
(52, 170, 'EM069'),
(22, 403.9545455, 'EM070'),
(29, 307, 'EM071'),
(23, 388, 'EM072'),
(21, 427, 'EM073'),
(30, 300, 'EM074'),
(58, 154, 'EM075'),
(21, 422, 'EM076'),
(19, 457, 'EM077'),
(22, 396, 'EM078'),
(24, 370.2916667, 'EM079'),
(17, 522.7647059, 'EM080'),
(25, 407.2, 'EM081'),
(13, 664, 'EM082'),
(27, 329, 'EM083'),
(15, 602, 'EM084'),
(15, 592.4666667, 'EM085'),
(20, 445, 'EM086'),
(31, 285, 'EM087'),
(117, 0, 'EM088'),
(26, 342, 'EM089'),
(25, 355.48, 'EM090');



INSERT INTO EPA_Utility_Factor (EPA_Utility_ID, Vehicle_ID, EPA_City_Utility_Factor, EPA_Combined_Utility_Factor, EPA_Highway_Utility_Factor)
VALUES
('EPAA01', 'ACRLX', 306, 6, 0),
('EPAA02', 'ACMDX', 424, 6, 0),
('EPAA03', 'ACILX', 316, 4, 0),
('EPAA04', 'ACNSX', 420, 6, 0),
('EPAA05', 'ACRDX', 370, 4, 0),
('EPAA06', 'ASV', -1, 8, 0),
('EPAA07', 'ASDBVol', -1, 12, 0),
('EPAA08', 'ASLagonda', -1, 8, 0),
('EPAA09', 'ASSaloon', -1, 8, 0),
('EPAA10', 'ASDBCou', -1, 12, 0),
('EPAA11', 'AURS', 399, 5, 0),
('EPAA12', 'AUA4', 284, 4, 0),
('EPAA13', 'AUA5', 328, 4, 0),
('EPAA14', 'AUSQ', 516, 8, 0),
('EPAA15', 'BEMulsanne', 749, 8, 0),
('EPAA16', 'BEContinental', 469, 8, 0),
('EPAA17', 'BEBentayga', 497, 8, 0),
('EPAA18', 'BEAzure', -1, 8, 0),
('EPAA19', 'BM640i', 398, 6, 0),
('EPAA20', 'BMM6', 519, 8, 0),
('EPAA21', 'BMX3', 418, 6, 0),
('EPAA22', 'BMX4', 418, 6, 0),
('EPAA23', 'BMM4', 477, 6, 0),
('EPAA24', 'BUChiron', 979, 16, 0),
('EPAA25', 'BUVeyron', 847, 16, 0),
('EPAA26', 'BUDivo', 864, 16, 0),
('EPAA27', 'BULaCrosse', 383, 6, 0),
('EPAA28', 'BURegal', 343, 4, 18),
('EPAA29', 'BUCentury', -1, 4, 0),
('EPAA30', 'BULucerne', -1, 6, 0),
('EPAA31', 'BUSkyhawk', -1, 4, 0),
('EPAA32', 'CAEscalade', 512, 8, 0),
('EPAA33', 'CAATS', 469, 6, 0),
('EPAA34', 'CAXTS', 408, 6, 0),
('EPAA35', 'CACTS', 543, 8, 0),
('EPAA36', 'CHCamaro', 380, 4, 0),
('EPAA37', 'CHSilverado', 522, 8, 0),
('EPAA38', 'CHG', -1, 6, 0),
('EPAA39', 'CHEquinox', 355, 4, 0),
('EPAA40', 'CHSonic', 296, 4, 0),
('EPAA41', 'CHPacifica', 119, 6, 0),
('EPAA42', 'CHLeBaron', -1, 4, 18),
('EPAA43', 'CHQC', -1, 4, 0),
('EPAA44', 'CHConquest', -1, 4, 10),
('EPAA45', 'CHLaser', -1, 4, 17),
('EPAA46', 'DODart', 285, 4, 13),
('EPAA47', 'DODurango', 525, 8, 0),
('EPAA48', 'DOChallenger', 494, 8, 0),
('EPAA49', 'DOB', -1, 8, 0),
('EPAA50', 'DOCharger', 415, 6, 0),
('EPAA51', 'FOMustang', 370, 4, 0),
('EPAA52', 'FOF', 437, 6, 0),
('EPAA53', 'FOEdge', 393, 4, 0),
('EPAA54', 'FOFocus', 289, 4, 23),
('EPAA55', 'FOFusion', 444, 6, 0),
('EPAA56', 'GEG80', 459, 6, 0),
('EPAA57', 'GEG90', 448, 6, 0),
('EPAA58', 'GEG70', 410, 4, 0),
('EPAA59', 'GEGV70', 441, 6, 0),
('EPAA60', 'GEGV80', 394, 4, 0),
('EPAA61', 'GMAcadia', 437, 6, 0),
('EPAA62', 'GMYukon', 477, 8, 0),
('EPAA63', 'GMT', -1, 6, 0),
('EPAA64', 'GMTerrain', 319, 4, 0),
('EPAA65', 'GMSierra', 525, 8, 0),
('EPAA66', 'HOAccord', 334, 4, 0),
('EPAA67', 'HOCivic', 247, 4, 0),
('EPAA68', 'HOHybrid', 183, 4, 0),
('EPAA69', 'HOInsight', 170, 4, 0),
('EPAA70', 'HOOdyssey', -1, 6, 0),
('EPAA71', 'HYSonata', 307, 4, 0),
('EPAA72', 'HYTucson', 388, 4, 0),
('EPAA73', 'HYSanta', 427, 6, 0),
('EPAA74', 'HYKona', 300, 4, 0),
('EPAA75', 'HYIoniq', 154, 4, 27),
('EPAA76', 'INQ50', 422, 6, 0),
('EPAA77', 'INQX', 457, 6, 0),
('EPAA78', 'INQ60', 396, 6, 0),
('EPAA79', 'ING20', -1, 4, 0),
('EPAA80', 'INQ45', -1, 8, 0),
('EPAA81', 'JECherokee', -1, 4, 0),
('EPAA82', 'JETrackhawk', 664, 8, 0),
('EPAA83', 'JERenegade', 329, 4, 0),
('EPAA84', 'JEGrand', 602, 8, 0),
('EPAA85', 'JECJ', -1, 6, 0),
('EPAA86', 'KIStinger', 445, 6, 0),
('EPAA87', 'KISeltos', 285, 4, 0),
('EPAA88', 'KIEV', 0, 0, 0),
('EPAA89', 'KISorento', 342, 4, 0),
('EPAA90', 'KIOptima', -1, 4, 0);


INSERT INTO Charging_time(Charging_ID, Vehicle_ID, Time_To_Charge_At_120V, Time_To_Charge_At_240V)
VALUES
('Char01', 'ACRLX', 0, 29),
('Char02', 'ACMDX', 0, 18),
('Char03', 'ACILX', 0, 24),
('Char04', 'ACNSX', 0, 21),
('Char05', 'ACRDX', 0, 22),
('Char06', 'ASV', 0, 13),
('Char07', 'ASDBVol', 0, 11),
('Char08', 'ASLagonda', 0, 7),
('Char09', 'ASSaloon', 0, 7),
('Char10', 'ASDBCou', 0, 10),
('Char11', 'AURS', 0, 19),
('Char12', 'AUA4', 0, 27),
('Char13', 'AUA5', 0, 23),
('Char14', 'AUSQ', 0, 15),
('Char15', 'BEMulsanne', 0, 10),
('Char16', 'BEContinental', 0, 16),
('Char17', 'BEBentayga', 0, 15),
('Char18', 'BEAzure', 0, 10),
('Char19', 'BM640i', 0, 19),
('Char20', 'BMM6', 0, 15),
('Char21', 'BMX3', 0, 19),
('Char22', 'BMX4', 0, 19),
('Char23', 'BMM4', 0, 16),
('Char24', 'BUChiron', 0, 8),
('Char25', 'BUVeyron', 0, 8),
('Char26', 'BUDivo', 0, 9),
('Char27', 'BULaCrosse', 0, 20),
('Char28', 'BURegal', 0, 22),
('Char29', 'BUCentury', 0, 21),
('Char30', 'BULucerne', 0, 17),
('Char31', 'BUSkyhawk', 0, 19),
('Char32', 'CAEscalade', 0, 15),
('Char33', 'CAATS', 0, 17),
('Char34', 'CAXTS', 0, 19),
('Char35', 'CACTS', 0, 14),
('Char36', 'CHCamaro', 0, 20),
('Char37', 'CHSilverado', 0, 15),
('Char38', 'CHG', 0, 15),
('Char39', 'CHEquinox', 0, 22),
('Char40', 'CHSonic', 0, 27),
('Char41', 'CHPacifica', 2, 29),
('Char42', 'CHLeBaron', 0, 18),
('Char43', 'CHQC', 0, 17),
('Char44', 'CHConquest', 0, 16),
('Char45', 'CHLaser', 0, 17),
('Char46', 'DODart', 0, 27),
('Char47', 'DODurango', 0, 14),
('Char48', 'DOChallenger', 0, 15),
('Char49', 'DOB', 0, 11),
('Char50', 'DOCharger', 0, 18),
('Char51', 'FOMustang', 0, 21),
('Char52', 'FOF', 0, 18),
('Char53', 'FOEdge', 0, 20),
('Char54', 'FOFocus', 0, 26),
('Char55', 'FOFusion', 0, 17),
('Char56', 'GEG80', 0, 16),
('Char57', 'GEG90', 0, 17),
('Char58', 'GEG70', 0, 18),
('Char59', 'GEGV70', 0, 18),
('Char60', 'GEGV80', 0, 21),
('Char61', 'GMAcadia', 0, 18),
('Char62', 'GMYukon', 0, 16),
('Char63', 'GMT', 0, 15),
('Char64', 'GMTerrain', 0, 28),
('Char65', 'GMSierra', 0, 15),
('Char66', 'HOAccord', 0, 23),
('Char67', 'HOCivic', 0, 32),
('Char68', 'HOHybrid', 0, 48),
('Char69', 'HOInsight', 0, 55),
('Char70', 'HOOdyssey', 0, 19),
('Char71', 'HYSonata', 0, 25),
('Char72', 'HYTucson', 0, 21),
('Char73', 'HYSanta', 0, 18),
('Char74', 'HYKona', 0, 27),
('Char75', 'HYIoniq', 0, 57),
('Char76', 'INQ50', 0, 18),
('Char77', 'INQX', 0, 17),
('Char78', 'INQ60', 0, 19),
('Char79', 'ING20', 0, 21),
('Char80', 'INQ45', 0, 15),
('Char81', 'JECherokee', 0, 24),
('Char82', 'JETrackhawk', 0, 11),
('Char83', 'JERenegade', 0, 24),
('Char84', 'JEGrand', 0, 13),
('Char85', 'JECJ', 0, 15),
('Char86', 'KIStinger', 0, 17),
('Char87', 'KISeltos', 0, 29),
('Char88', 'KIEV', 8.7, 134),
('Char89', 'KISorento', 0, 24),
('Char90', 'KIOptima', 0, 22);


-- Insert into Vehcile_Specification Table
INSERT INTO Vehicle_Specification (Spec_id, Vehicle_ID, Cylinders, Drive, Transmission, Fuel_Type1, Engine_descriptor) 
VALUES 
('Spec1', 'ACRLX', 6, 'All-Wheel Drive', 'Automatic (AM-S7)', 'Premium Gasoline', 'SIDI; Stop-Start'),
('Spec2', 'ACMDX', 6, 'All-Wheel Drive', 'Automatic (S9)', 'Premium Gasoline', 'SIDI'),
('Spec3', 'ACILX', 4, 'Front-Wheel Drive', 'Automatic (AM-S8)', 'Premium Gasoline', 'SIDI'),
('Spec4', 'ACNSX', 6, 'All-Wheel Drive', 'Automatic (AM-S9)', 'Premium Gasoline', 'SIDI; Hybrid'),
('Spec5', 'ACRDX', 4, 'Front-Wheel Drive', 'Automatic (S10)', 'Premium Gasoline', 'SIDI'),
('Spec6', 'ASV', 8, 'Rear-Wheel Drive', 'Manual 6-spd', 'Premium Gasoline', NULL),
('Spec7', 'ASDBVol', 12, 'Rear-Wheel Drive', 'Automatic (S6)', 'Premium Gasoline', NULL),
('Spec8', 'ASLagonda', 8, 'Rear-Wheel Drive', 'Automatic 3-spd', 'Regular Gasoline', 'GUZZLER CA model'),
('Spec9', 'ASSaloon', 8, 'Rear-Wheel Drive', 'Manual 5-spd', 'Regular Gasoline', 'GUZZLER CA model'),
('Spec10', 'ASDBCou', 12, 'Rear-Wheel Drive', 'Manual 6-spd', 'Premium Gasoline', NULL),
('Spec11', 'AURS', 5, 'All-Wheel Drive', 'Automatic (AM-S7)', 'Premium Gasoline', 'SIDI'),
('Spec12', 'AUA4', 4, 'Front-Wheel Drive', 'Automatic (AM-S7)', 'Premium Gasoline', 'SIDI'),
('Spec13', 'AUA5', 4, 'All-Wheel Drive', 'Automatic (AM-S7)', 'Premium Gasoline', 'SIDI'),
('Spec14', 'AUSQ', 8, 'All-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec15', 'BEMulsanne', 8, 'Rear-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', NULL),
('Spec16', 'BEContinental', 8, 'All-Wheel Drive', 'Automatic (AM-S8)', 'Premium Gasoline', 'SIDI'),
('Spec17', 'BEBentayga', 8, 'All-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec18', 'BEAzure', 8, 'Rear-Wheel Drive', 'Automatic 4-spd', 'Premium Gasoline', 'L410MT2'),
('Spec19', 'BM640i', 6, 'All-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec20', 'BMM6', 8, 'Rear-Wheel Drive', 'Manual 6-spd', 'Premium Gasoline', 'SIDI'),
('Spec21', 'BMX3', 6, 'All-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec22', 'BMX4', 6, 'All-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec23', 'BMM4', 6, 'Rear-Wheel Drive', 'Automatic (AM-S7)', 'Premium Gasoline', 'SIDI'),
('Spec24', 'BUChiron', 16, 'All-Wheel Drive', 'Automatic (AM-S7)', 'Premium Gasoline', NULL),
('Spec25', 'BUVeyron', 16, 'All-Wheel Drive', 'Automatic (AM-S7)', 'Premium Gasoline', NULL),
('Spec26', 'BUDivo', 16, 'All-Wheel Drive', 'Automatic (AM-S7)', 'Premium Gasoline', NULL),
('Spec27', 'BULaCrosse', 6, 'All-Wheel Drive', 'Automatic (S9)', 'Regular Gasoline', 'SIDI'),
('Spec28', 'BURegal', 4, 'Front-Wheel Drive', 'Automatic (S9)', 'Premium Gasoline', 'SIDI'),
('Spec29', 'BUCentury', 4, 'Front-Wheel Drive', 'Automatic 3-spd', 'Regular Gasoline', 'FFS'),
('Spec30', 'BULucerne', 6, 'Front-Wheel Drive', 'Automatic 4-spd', 'Regular Gasoline', 'FFV'),
('Spec31', 'BUSkyhawk', 4, 'Front-Wheel Drive', 'Manual 4-spd', 'Premium Gasoline', 'FFS/TRBO CA model'),
('Spec32', 'CAEscalade', 8, 'Rear-Wheel Drive', 'Automatic 8-spd', 'Regular Gasoline', 'SIDI'),
('Spec33', 'CAATS', 6, 'Rear-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec34', 'CAXTS', 6, 'Front-Wheel Drive', 'Automatic (S6)', 'Regular Gasoline', 'SIDI'),
('Spec35', 'CACTS', 8, 'Rear-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec36', 'CHCamaro', 4, 'Rear-Wheel Drive', 'Manual 6-spd', 'Premium Gasoline', 'SIDI'),
('Spec37', 'CHSilverado', 8, 'Rear-Wheel Drive', 'Automatic 8-spd', 'Regular Gasoline', 'SIDI'),
('Spec38', 'CHG', 6, 'Rear-Wheel Drive', 'Automatic 4-spd', 'Regular Gasoline', 'FFS'),
('Spec39', 'CHEquinox', 4, 'Front-Wheel Drive', 'Automatic 9-spd', 'Premium Gasoline', 'SIDI'),
('Spec40', 'CHSonic', 4, 'Front-Wheel Drive', 'Automatic (S6)', 'Regular Gasoline', NULL),
('Spec41', 'CHPacifica', 6, 'Front-Wheel Drive', 'Automatic (variable gear ratios)', 'Regular Gasoline', 'PHEV'),
('Spec42', 'CHLeBaron', 4, 'Front-Wheel Drive', 'Automatic 3-spd', 'Premium Gasoline', 'FFS,TRBO'),
('Spec43', 'CHQC', 4, 'Front-Wheel Drive', 'Automatic 3-spd', 'Premium Gasoline', 'FFS'),
('Spec44', 'CHConquest', 4, 'Rear-Wheel Drive', 'Manual 5-spd', 'Premium Gasoline', 'FFS,TRBO'),
('Spec45', 'CHLaser', 4, 'Front-Wheel Drive', 'Automatic 3-spd', 'Premium Gasoline', 'FFS,TRBO'),
('Spec46', 'DODart', 4, 'Front-Wheel Drive', 'Manual 6-spd', 'Premium Gasoline', NULL),
('Spec47', 'DODurango', 8, 'Rear-Wheel Drive', 'Automatic 8-spd', 'Midgrade Gasoline', NULL),
('Spec48', 'DOChallenger', 8, 'Rear-Wheel Drive', 'Manual 6-spd', 'Premium Gasoline', NULL),
('Spec49', 'DOB', 8, 'Rear-Wheel Drive', 'Manual 4-spd', 'Regular Gasoline', 'FFS'),
('Spec50', 'DOCharger', 6, 'All-Wheel Drive', 'Automatic 8-spd', 'Regular Gasoline', NULL),
('Spec51', 'FOMustang', 4, 'Rear-Wheel Drive', 'Manual 6-spd', 'Regular Gasoline', 'SIDI'),
('Spec52', 'FOF', 6, 'Rear-Wheel Drive', 'Automatic 6-spd', 'Regular Gasoline', 'FFV'),
('Spec53', 'FOEdge', 4, 'All-Wheel Drive', 'Automatic (S6)', 'Regular Gasoline', 'SIDI'),
('Spec54', 'FOFocus', 4, 'Front-Wheel Drive', 'Automatic (AM6)', 'Regular Gasoline', 'SIDI'),
('Spec55', 'FOFusion', 6, 'All-Wheel Drive', 'Automatic (S6)', 'Regular Gasoline', 'SIDI'),
('Spec56', 'GEG80', 6, 'All-Wheel Drive', 'Automatic (S8)', 'Regular Gasoline', 'SIDI'),
('Spec57', 'GEG90', 6, 'All-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec58', 'GEG70', 4, 'Rear-Wheel Drive', 'Manual 6-spd', 'Premium Gasoline', 'SIDI'),
('Spec59', 'GEGV70', 6, 'All-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI & PFI'),
('Spec60', 'GEGV80', 4, 'Rear-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI & PFI'),
('Spec61', 'GMAcadia', 6, 'All-Wheel Drive', 'Automatic 6-spd', 'Regular Gasoline', 'SIDI'),
('Spec62', 'GMYukon', 8, 'Rear-Wheel Drive', 'Automatic 6-spd', 'Regular Gasoline', 'SIDI'),
('Spec63', 'GMT', 6, '4-Wheel or All-Wheel Drive', 'Manual 4-spd', 'Regular Gasoline', 'FFS'),
('Spec64', 'GMTerrain', 4, 'All-Wheel Drive', 'Automatic 6-spd', 'Diesel', NULL),
('Spec65', 'GMSierra', 8, '4-Wheel Drive', 'Automatic 10-spd', 'Premium Gasoline', 'SIDI'),
('Spec66', 'HOAccord', 4, 'Front-Wheel Drive', 'Manual 6-spd', 'Regular Gasoline', 'SIDI'),
('Spec67', 'HOCivic', 4, 'Front-Wheel Drive', 'Automatic (variable gear ratios)', 'Regular Gasoline', 'SIDI'),
('Spec68', 'HOHybrid', 4, 'Front-Wheel Drive', 'Automatic (variable gear ratios)', 'Regular Gasoline', 'Hybrid'),
('Spec69', 'HOInsight', 4, 'Front-Wheel Drive', 'Automatic (variable gear ratios)', 'Regular Gasoline', 'Hybrid'),
('Spec70', 'HOOdyssey', 6, 'Front-Wheel Drive', 'Automatic 6-spd', 'Regular Gasoline', NULL),
('Spec71', 'HYSonata', 4, 'Front-Wheel Drive', 'Automatic (S6)', 'Regular Gasoline', 'SIDI'),
('Spec72', 'HYTucson', 4, 'All-Wheel Drive', 'Automatic (S6)', 'Regular Gasoline', 'SIDI'),
('Spec73', 'HYSanta', 6, 'Front-Wheel Drive', 'Automatic (S6)', 'Regular Gasoline', 'SIDI'),
('Spec74', 'HYKona', 4, 'Front-Wheel Drive', 'Automatic (S6)', 'Regular Gasoline', 'SIDI'),
('Spec75', 'HYIoniq', 4, 'Front-Wheel Drive', 'Automatic (AM6)', 'Regular Gasoline', 'SIDI; Hybrid'),
('Spec76', 'INQ50', 6, 'All-Wheel Drive', 'Automatic (S7)', 'Premium Gasoline', 'SIDI'),
('Spec77', 'INQX', 6, 'Rear-Wheel Drive', 'Automatic (S7)', 'Premium Gasoline', NULL),
('Spec78', 'INQ60', 6, 'Rear-Wheel Drive', 'Automatic (S7)', 'Premium Gasoline', 'SIDI'),
('Spec79', 'ING20', 4, 'Front-Wheel Drive', 'Manual 5-spd', 'Regular Gasoline', 'FFS'),
('Spec80', 'INQ45', 8, 'Rear-Wheel Drive', 'Automatic 4-spd', 'Premium Gasoline', 'FFS'),
('Spec81', 'JECherokee', 4, '4-Wheel or All-Wheel Drive', 'Manual 5-spd', 'Diesel', 'DSL,TRBO NO-CAT'),
('Spec82', 'JETrackhawk', 8, 'All-Wheel Drive', 'Automatic 8-spd', 'Premium Gasoline', NULL),
('Spec83', 'JERenegade', 4, 'Front-Wheel Drive', 'Automatic 9-spd', 'Regular Gasoline', 'SIDI'),
('Spec84', 'JEGrand', 8, 'All-Wheel Drive', 'Automatic 8-spd', 'Premium Gasoline', NULL),
('Spec85', 'JECJ', 6, '4-Wheel or All-Wheel Drive', 'Automatic 3-spd', 'Regular Gasoline', 'FFS'),
('Spec86', 'KIStinger', 6, 'All-Wheel Drive', 'Automatic (S8)', 'Premium Gasoline', 'SIDI'),
('Spec87', 'KISeltos', 4, 'Front-Wheel Drive', 'Automatic (AV-S8)', 'Regular Gasoline', NULL),
('Spec88', 'KIEV', NULL, 'Rear-Wheel Drive', 'Automatic (A1)', 'Electricity', NULL),
('Spec89', 'KISorento', 4, 'Front-Wheel Drive', 'Automatic (S8)', 'Regular Gasoline', 'SIDI & PFI'),
('Spec90', 'KIOptima', 4, 'Front-Wheel Drive', 'Automatic 5-spd', 'Regular Gasoline', NULL);


-- Insert into Annual_Cost Table
INSERT INTO Annual_Cost_Emission (Cost_ID, Emissions_ID, Annual_Fuel_Cost_Type1, Save_Spend, CO2_Tailpipe_Type1) 
VALUES 
('Price1', 'EM001', 2450, -1750, 306),
('Price2', 'EM002', 3400, -6500, 424),
('Price3', 'EM003', 2550, -2250, 316),
('Price4', 'EM004', 3400, -6500, 420),
('Price5', 'EM005', 3000, -4500, 370),
('Price6', 'EM006', 4800, -13500, 592.4666667),
('Price7', 'EM007', 5500, -17000, 683.6153846),
('Price8', 'EM008', 7300, -26000, 1110.875),
('Price9', 'EM009', 7300, -26000, 1110.875),
('Price10', 'EM010', 6000, -19500, 740.5833333),
('Price11', 'EM011', 3250, -5750, 399),
('Price12', 'EM012', 2300, -1000, 284),
('Price13', 'EM013', 2650, -2750, 328),
('Price14', 'EM014', 4200, -10500, 516),
('Price15', 'EM015', 6000, -19500, 749),
('Price16', 'EM016', 3750, -8250, 469),
('Price17', 'EM017', 4000, -9500, 497),
('Price18', 'EM018', 6000, -19500, 740.5833333),
('Price19', 'EM019', 3250, -5750, 398),
('Price20', 'EM020', 4200, -10500, 519),
('Price21', 'EM021', 3400, -6500, 418),
('Price22', 'EM022', 3400, -6500, 418),
('Price23', 'EM023', 3750, -8250, 477),
('Price24', 'EM024', 7950, -29250, 979),
('Price25', 'EM025', 7150, -25250, 847),
('Price26', 'EM026', 7150, -25250, 864),
('Price27', 'EM027', 2550, -2250, 383),
('Price28', 'EM028', 2750, -3250, 343),
('Price29', 'EM029', 2400, -1500, 370.2916667),
('Price30', 'EM030', 2900, -4000, 444.35),
('Price31', 'EM031', 3250, -5750, 403.9545455),
('Price32', 'EM032', 3400, -6500, 512),
('Price33', 'EM033', 3600, -7500, 469),
('Price34', 'EM034', 2650, -2750, 408),
('Price35', 'EM035', 4500, -12000, 543),
('Price36', 'EM036', 3100, -5000, 380),
('Price37', 'EM037', 3400, -6500, 522),
('Price38', 'EM038', 3650, -7750, 555.4375),
('Price39', 'EM039', 2850, -3750, 355),
('Price40', 'EM040', 1950, 750, 296),
('Price41', 'EM041', 1950, 4000, 119),
('Price42', 'EM042', 3750, -8250, 467.7368421),
('Price43', 'EM043', 3750, -8250, 467.7368421),
('Price44', 'EM044', 4000, -9500, 493.7222222),
('Price45', 'EM045', 3750, -8250, 467.7368421),
('Price46', 'EM046', 2300, -1000, 285),
('Price47', 'EM047', 3950, -9250, 525),
('Price48', 'EM048', 4000, -9500, 494),
('Price49', 'EM049', 4500, -12000, 683.6153846),
('Price50', 'EM050', 2750, -3250, 415),
('Price51', 'EM051', 2400, -1500, 370),
('Price52', 'EM052', 2900, -4000, 437),
('Price53', 'EM053', 2550, -2250, 393),
('Price54', 'EM054', 1900, 1000, 289),
('Price55', 'EM055', 2900, -4000, 444),
('Price56', 'EM056', 3050, -4750, 459),
('Price57', 'EM057', 3600, -7500, 448),
('Price58', 'EM058', 3250, -5750, 410),
('Price59', 'EM059', 3600, -7500, 441),
('Price60', 'EM060', 3100, -5000, 394),
('Price61', 'EM061', 2900, -4000, 437),
('Price62', 'EM062', 3050, -4750, 477),
('Price63', 'EM063', 3400, -6500, 522.7647059),
('Price64', 'EM064', 2150, -250, 319),
('Price65', 'EM065', 4200, -10500, 525),
('Price66', 'EM066', 2250, -750, 334),
('Price67', 'EM067', 1600, 2500, 247),
('Price68', 'EM068', 1200, 4500, 183),
('Price69', 'EM069', 1100, 5000, 170),
('Price70', 'EM070', 2650, -2750, 403.9545455),
('Price71', 'EM071', 2000, 500, 307),
('Price72', 'EM072', 2550, -2250, 388),
('Price73', 'EM073', 2750, -3250, 427),
('Price74', 'EM074', 1950, 750, 300),
('Price75', 'EM075', 1000, 5500, 154),
('Price76', 'EM076', 3400, -6500, 422),
('Price77', 'EM077', 3750, -8250, 457),
('Price78', 'EM078', 3250, -5750, 396),
('Price79', 'EM079', 2400, -1500, 370.2916667),
('Price80', 'EM080', 4200, -10500, 522.7647059),
('Price81', 'EM081', 2800, -3500, 407.2),
('Price82', 'EM082', 5500, -17000, 664),
('Price83', 'EM083', 2150, -250, 329),
('Price84', 'EM084', 4800, -13500, 602),
('Price85', 'EM085', 3900, -9000, 592.4666667),
('Price86', 'EM086', 3600, -7500, 445),
('Price87', 'EM087', 1900, 1000, 285),
('Price88', 'EM088', 600, 7500, 0),
('Price89', 'EM089', 2250, -750, 342),
('Price90', 'EM090', 2350, -1250, 355.48);


-- Insert into MPG table
INSERT INTO MPG_Data (MPG_ID, Vehicle_ID, Unrounded_City_MPG_Type1, Unrounded_City_MPG_Type2, Unrounded_Highway_MPG_Type1, Unrounded_Highway_MPG_Type2, Unrounded_Combined_MPG_Type1, Unrounded_Combined_MPG_Type2) 
VALUES 
('MPG1', 'ACRLX', 29.1463, 0, 30, 0, 29, 0),
('MPG2', 'ACMDX', 18, 0, 26, 0, 21, 0),
('MPG3', 'ACILX', 24.2285, 0, 34.3255, 0, 27.9249, 0),
('MPG4', 'ACNSX', 21, 0, 21.7131, 0, 21, 0),
('MPG5', 'ACRDX', 22.2521, 0, 28.2546, 0, 24, 0),
('MPG6', 'ASV', 13.0667, 0, 19.2317, 0, 15.2694, 0),
('MPG7', 'ASDBVol', 0, 0, 0, 0, 0, 0),
('MPG8', 'ASLagonda', 0, 0, 0, 0, 0, 0),
('MPG9', 'ASSaloon', 0, 0, 0, 0, 0, 0),
('MPG10', 'ASDBCou', 0, 0, 0, 0, 0, 0),
('MPG11', 'AURS', 18.9487, 0, 28.4333, 0, 22.2954, 0),
('MPG12', 'AUA4', 27.4955, 0, 36.9717, 0, 31.0803, 0),
('MPG13', 'AUA5', 23.4534, 0, 33.5185, 0, 27.1178, 0),
('MPG14', 'AUSQ', 14.7421, 0, 21.3781, 0, 17.1357, 0),
('MPG15', 'BEMulsanne', 9.5936, 0, 16.2898, 0, 11.771, 0),
('MPG16', 'BEContinental', 15.5755, 0, 25.8394, 0, 18.9656, 0),
('MPG17', 'BEBentayga', 14.878, 0, 23.7022, 0, 17.8722, 0),
('MPG18', 'BEAzure', 0, 0, 0, 0, 0, 0),
('MPG19', 'BM640i', 19.103, 0, 28.248, 0, 22.3606, 0),
('MPG20', 'BMM6', 14.589, 0, 21.5792, 0, 17.0785, 0),
('MPG21', 'BMX3', 18.5614, 0, 25.9339, 0, 21.2842, 0),
('MPG22', 'BMX4', 18.5614, 0, 25.9339, 0, 21.2842, 0),
('MPG23', 'BMM4', 16.1333, 0, 22.7829, 0, 18.5726, 0),
('MPG24', 'BUChiron', 7.762, 0, 11.2461, 0, 9.0194, 0),
('MPG25', 'BUVeyron', 8.4232, 0, 14.7698, 0, 10.4424, 0),
('MPG26', 'BUDivo', 8.6476, 0, 13.1016, 0, 10.2095, 0),
('MPG27', 'BULaCrosse', 20.0948, 0, 28.6378, 0, 23.2106, 0),
('MPG28', 'BURegal', 22.4579, 0, 31.9039, 0, 25.91, 0),
('MPG29', 'BUCentury', 0, 0, 0, 0, 0, 0),
('MPG30', 'BULucerne', 0, 0, 0, 20, 0, 15),
('MPG31', 'BUSkyhawk', 0, 0, 0, 0, 0, 0),
('MPG32', 'CAEscalade', 14.9703, 0, 21.5122, 0, 17.3437, 0),
('MPG33', 'CAATS', 16.9285, 0, 24.89, 0, 19.7749, 0),
('MPG34', 'CAXTS', 18.5752, 0, 27.5285, 0, 21.7599, 0),
('MPG35', 'CACTS', 13.7484, 0, 21.4451, 0, 16.3965, 0),
('MPG36', 'CHCamaro', 19.8496, 0, 29.5006, 0, 23.2762, 0),
('MPG37', 'CHSilverado', 14.9703, 0, 21, 0, 17.3827, 0),
('MPG38', 'CHG', 0, 0, 0, 0, 0, 0),
('MPG39', 'CHEquinox', 22.3944, 0, 29, 0, 25.3669, 0),
('MPG40', 'CHSonic', 26.6501, 0, 35.4237, 0, 29.9929, 0),
('MPG41', 'CHPacifica', 29.4158, 86.6743, 29.6499, 77, 29.5207, 82),
('MPG42', 'CHLeBaron', 0, 0, 0, 0, 0, 0),
('MPG43', 'CHQC', 0, 0, 0, 0, 0, 0),
('MPG44', 'CHConquest', 0, 0, 0, 0, 0, 0),
('MPG45', 'CHLaser', 0, 0, 0, 0, 0, 0),
('MPG46', 'DODart', 26.9575, 0, 38.1314, 0, 31.0523, 0),
('MPG47', 'DODurango', 14.1316, 0, 22.3141, 0, 16.9243, 0),
('MPG48', 'DOChallenger', 15.1221, 0, 23.3102, 0, 17.9612, 0),
('MPG49', 'DOB', 0, 0, 0, 0, 0, 0),
('MPG50', 'DOCharger', 18.3385, 0, 26.9053, 0, 21.4055, 0),
('MPG51', 'FOMustang', 21, 0, 30.0971, 0, 24, 0),
('MPG52', 'FOF', 17.8913, 13.1588, 24.2499, 18, 20.2848, 15),
('MPG53', 'FOEdge', 19.7796, 0, 27.2581, 0, 22.5656, 0),
('MPG54', 'FOFocus', 26.4446, 0, 38.37, 0, 30.7445, 0),
('MPG55', 'FOFusion', 17, 0, 26.1286, 0, 20, 0),
('MPG56', 'GEG80', 16.4046, 0, 24.8246, 0, 19.3594, 0),
('MPG57', 'GEG90', 17.2268, 0, 24.2996, 0, 19.8232, 0),
('MPG58', 'GEG70', 18.4122, 0, 27.6779, 0, 21.6779, 0),
('MPG59', 'GEGV70', 18.2297, 0, 23.6716, 0, 20.3332, 0),
('MPG60', 'GEGV80', 21.0347, 0, 25.2654, 0, 22.7489, 0),
('MPG61', 'GMAcadia', 17.7469, 0, 24.8246, 0, 20.3589, 0),
('MPG62', 'GMYukon', 15.9536, 0, 23.4426, 0, 18.6321, 0),
('MPG63', 'GMT', 0, 0, 0, 0, 0, 0),
('MPG64', 'GMTerrain', 27.9425, 0, 38.3105, 0, 31.8173, 0),
('MPG65', 'GMSierra', 15.1246, 0, 19.8108, 0, 16.9264, 0),
('MPG66', 'HOAccord', 22.9891, 0, 32.4754, 0, 26.4683, 0),
('MPG67', 'HOCivic', 31.8635, 0, 41.7107, 0, 35.651, 0),
('MPG68', 'HOHybrid', 48.4262, 0, 47.7975, 0, 48.1413, 0),
('MPG69', 'HOInsight', 54.9485, 0, 48.7657, 0, 51.9827, 0),
('MPG70', 'HOOdyssey', 19.0736, 0, 27.3565, 0, 22.0823, 0),
('MPG71', 'HYSonata', 25.1757, 0, 36.4206, 0, 29.238, 0),
('MPG72', 'HYTucson', 21.3942, 0, 25.7386, 0, 23.1527, 0),
('MPG73', 'HYSanta', 18.1909, 0, 25.105, 0, 20.7643, 0),
('MPG74', 'HYKona', 27.3787, 0, 33.4483, 0, 29.8132, 0),
('MPG75', 'HYIoniq', 56.5105, 0, 59.4169, 0, 57.7824, 0),
('MPG76', 'INQ50', 18.3015, 0, 25.8685, 0, 21.0758, 0),
('MPG77', 'INQX', 17.0031, 0, 23.6408, 0, 19.4621, 0),
('MPG78', 'INQ60', 19.2812, 0, 28.2094, 0, 22.4834, 0),
('MPG79', 'ING20', 0, 0, 0, 0, 0, 0),
('MPG80', 'INQ45', 0, 0, 0, 0, 0, 0),
('MPG81', 'JECherokee', 0, 0, 0, 0, 0, 0),
('MPG82', 'JETrackhawk', 11.2651, 0, 17.0907, 0, 13.3061, 0),
('MPG83', 'JERenegade', 23.9833, 0, 31.7598, 0, 26.9531, 0),
('MPG84', 'JEGrand', 12.6685, 0, 18.3966, 0, 14.7328, 0),
('MPG85', 'JECJ', 0, 0, 0, 0, 0, 0),
('MPG86', 'KIStinger', 17.374, 0, 25.0507, 0, 20.1531, 0),
('MPG87', 'KISeltos', 29.2169, 0, 34.2648, 0, 31.2913, 0),
('MPG88', 'KIEV', 134, 0, 101, 0, 117, 0),
('MPG89', 'KISorento', 24.1573, 0, 29.1395, 0, 26.1709, 0),
('MPG90', 'KIOptima', 0, 0, 0, 0, 0, 0);



-- Insert data into the table


INSERT INTO CO2_Emission_Factor (Factor_ID, Fuel_Type_ID, Co2_Fuel_Type1, Co2_Fuel_Type2)
VALUES
('A01', 'Hybrid17', 306, -1),
('A02', 'AAWD18', 424, -1),
('A03', 'ILX19', 316, -1),
('A04', 'Hybrid20', 420, -1),
('A05', 'AFWD21', 370, -1),
('A06', 'Vantage08', -1, -1),
('A07', 'Volante08', -1, -1),
('A08', 'Lagonda85', -1, -1),
('A09', 'Saloon85', -1, -1),
('A10', 'Coupe08', -1, -1),
('A11', 'RS317', 399, -1),
('A12', 'Ultra18', 284, -1),
('A13', 'quattro19', 328, -1),
('A14', 'SQ720', 516, -1),
('A15', 'Mulsanne19', 749, -1),
('A16', 'Convertible20', 469, -1),
('A17', 'Bentayga22', 497, -1),
('A18', 'Azure98', -1, -1),
('A19', 'Convertible17', 398, -1),
('A20', 'Coupe17', 519, -1),
('A21', 'Drive35i17', 418, -1),
('A22', 'i17', 418, -1),
('A23', 'GTS06', 477, -1),
('A24', 'Sport24', 979, -1),
('A25', 'Veyron14', 847, -1),
('A26', 'Divo20', 864, -1),
('A27', 'BAWD19', 383, -1),
('A28', 'Regal20', 343, -1),
('A29', 'Century88', -1, -1),
('A30', 'Lucerne10', -1, -1),
('A31', 'Skyhawk85', -1, -1),
('A32', 'CWD17', 512, -1),
('A33', 'V18', 469, -1),
('A34', 'XTS19', 408, -1),
('A35', 'V19', 543, -1),
('A36', 'Camaro17', 380, -1),
('A37', '2WD17', 522, -1),
('A38', '2WD87', -1, -1),
('A39', 'CFWD18', 355, -1),
('A40', 'Sonic18', 296, -1),
('A41', 'Hybrid22', 119, -1),
('A42', 'GTS85', -1, -1),
('A43', 'Car88', -1, -1),
('A44', 'Conquest87', -1, -1),
('A45', 'Daytona87', -1, -1),
('A46', 'Dart16', 285, -1),
('A47', 'RWD17', 525, -1),
('A48', 'Challenger17', 494, -1),
('A49', 'DWD87', -1, -1),
('A50', 'DAWD18', 415, -1),
('A51', 'Mustang17', 370, -1),
('A52', 'FFV17', 437, 415),
('A53', 'FAWD17', 393, -1),
('A54', 'FWD17', 289, -1),
('A55', 'FAWD18', 444, -1),
('A56', 'AWD19', 459, -1),
('A57', 'G90AWD17', 448, -1),
('A58', 'RWD19', 410, -1),
('A59', 'AWD24', 441, -1),
('A60', 'RWD22', 394, -1),
('A61', 'GAWD17', 437, -1),
('A62', 'WD17', 477, -1),
('A63', 'WD87', -1, -1),
('A64', 'ATWD18', 319, -1),
('A65', 'WD19', 525, -1),
('A66', 'Accord17', 334, -1),
('A67', 'Dr018', 247, -1),
('A68', 'Hybrid21', 183, -1),
('A69', 'Insight22', 170, -1),
('A70', 'Odyssey12', -1, -1),
('A71', 'Sonata17', 307, -1),
('A72', 'AWD17', 388, -1),
('A73', 'FWD18', 427, -1),
('A74', 'FWD19', 300, -1),
('A75', 'Blue20', 154, -1),
('A76', 'AWD01', 422, -1),
('A77', 'RWD06', 457, -1),
('A78', 'Q6017', 396, -1),
('A79', 'G2096', -1, -1),
('A80', 'Q4596', -1, -1),
('A81', '4WD87', -1, -1),
('A82', '4WD21', 664, -1),
('A83', '2WD21', 329, -1),
('A84', '4WD22', 602, -1),
('A85', 'CJ786', -1, -1),
('A86', 'AWD18', 445, -1),
('A87', 'FWD21', 285, -1),
('A88', 'Range06', 0, -1),
('A89', 'FWD23', 342, -1),
('A90', 'Optima10', -1, -1);

INSERT INTO Vehicle_Size (Vehicle_ID, Vehicle_Size_Class, Size_Class_ID)
VALUES
('ACRLX', 'Midsize Cars', 'SIZEC01'),
('ACMDX', 'Small Sport Utility Vehicle 4WD', 'SIZEC02'),
('ACILX', 'Compact Cars', 'SIZEC03'),
('ACNSX', 'Two Seaters', 'SIZEC04'),
('ACRDX', 'Small Sport Utility Vehicle 2WD', 'SIZEC05'),
('ASV', 'Two Seaters', 'SIZEC06'),
('ASDBVol', 'Minicompact Cars', 'SIZEC07'),
('ASLagonda', 'Subcompact Cars', 'SIZEC08'),
('ASSaloon', 'Subcompact Cars', 'SIZEC09'),
('ASDBCou', 'Minicompact Cars', 'SIZEC10'),
('AURS', 'Subcompact Cars', 'SIZEC11'),
('AUA4', 'Compact Cars', 'SIZEC12'),
('AUA5', 'Subcompact Cars', 'SIZEC13'),
('AUSQ', 'Standard Sport Utility Vehicle 4WD', 'SIZEC14'),
('BEMulsanne', 'Midsize Cars', 'SIZEC15'),
('BEContinental', 'Minicompact Cars', 'SIZEC16'),
('BEBentayga', 'Standard Sport Utility Vehicle 4WD', 'SIZEC17'),
('BEAzure', 'Subcompact Cars', 'SIZEC18'),
('BM640i', 'Subcompact Cars', 'SIZEC19'),
('BMM6', 'Subcompact Cars', 'SIZEC20'),
('BMX3', 'Small Sport Utility Vehicle 4WD', 'SIZEC21'),
('BMX4', 'Small Sport Utility Vehicle 4WD', 'SIZEC22'),
('BMM4', 'Two Seaters', 'SIZEC23'),
('BUChiron', 'Two Seaters', 'SIZEC24'),
('BUVeyron', 'Two Seaters', 'SIZEC25'),
('BUDivo', 'Two Seaters', 'SIZEC26'),
('BULaCrosse', 'Midsize Cars', 'SIZEC27'),
('BURegal', 'Midsize Cars', 'SIZEC28'),
('BUCentury', 'Midsize Cars', 'SIZEC29'),
('BULucerne', 'Large Cars', 'SIZEC30'),
('BUSkyhawk', 'Compact Cars', 'SIZEC31'),
('CAEscalade', 'Standard Sport Utility Vehicle 2WD', 'SIZEC32'),
('CAATS', 'Compact Cars', 'SIZEC33'),
('CAXTS', 'Large Cars', 'SIZEC34'),
('CACTS', 'Midsize Cars', 'SIZEC35'),
('CHCamaro', 'Subcompact Cars', 'SIZEC36'),
('CHSilverado', 'Standard Pickup Trucks 2WD', 'SIZEC37'),
('CHG', 'Vans', 'SIZEC38'),
('CHEquinox', 'Small Sport Utility Vehicle 2WD', 'SIZEC39'),
('CHSonic', 'Compact Cars', 'SIZEC40'),
('CHPacifica', 'Minivan - 2WD', 'SIZEC41'),
('CHLeBaron', 'Midsize Cars', 'SIZEC42'),
('CHQC', 'Two Seaters', 'SIZEC43'),
('CHConquest', 'Subcompact Cars', 'SIZEC44'),
('CHLaser', 'Subcompact Cars', 'SIZEC45'),
('DODart', 'Midsize Cars', 'SIZEC46'),
('DODurango', 'Standard Sport Utility Vehicle 2WD', 'SIZEC47'),
('DOChallenger', 'Midsize Cars', 'SIZEC48'),
('DOB', 'Vans', 'SIZEC49'),
('DOCharger', 'Large Cars', 'SIZEC50'),
('FOMustang', 'Subcompact Cars', 'SIZEC51'),
('FOF', 'Standard Pickup Trucks 2WD', 'SIZEC52'),
('FOEdge', 'Small Sport Utility Vehicle 4WD', 'SIZEC53'),
('FOFocus', 'Compact Cars', 'SIZEC54'),
('FOFusion', 'Midsize Cars', 'SIZEC55'),
('GEG80', 'Large Cars', 'SIZEC56'),
('GEG90', 'Large Cars', 'SIZEC57'),
('GEG70', 'Compact Cars', 'SIZEC58'),
('GEGV70', 'Small Sport Utility Vehicle 4WD', 'SIZEC59'),
('GEGV80', 'Small Sport Utility Vehicle 2WD', 'SIZEC60'),
('GMAcadia', 'Standard Sport Utility Vehicle 4WD', 'SIZEC61'),
('GMYukon', 'Standard Sport Utility Vehicle 2WD', 'SIZEC62'),
('GMT', 'Standard Pickup Trucks', 'SIZEC63'),
('GMTerrain', 'Small Sport Utility Vehicle 4WD', 'SIZEC64'),
('GMSierra', 'Standard Pickup Trucks 4WD', 'SIZEC65'),
('HOAccord', 'Midsize Cars', 'SIZEC66'),
('HOCivic', 'Midsize Cars', 'SIZEC67'),
('HOHybrid', 'Large Cars', 'SIZEC68'),
('HOInsight', 'Midsize Cars', 'SIZEC69'),
('HOOdyssey', 'Minivan - 2WD', 'SIZEC70'),
('HYSonata', 'Large Cars', 'SIZEC71'),
('HYTucson', 'Small Sport Utility Vehicle 4WD', 'SIZEC72'),
('HYSanta', 'Small Sport Utility Vehicle 2WD', 'SIZEC73'),
('HYKona', 'Small Sport Utility Vehicle 2WD', 'SIZEC74'),
('HYIoniq', 'Large Cars', 'SIZEC75'),
('INQ50', 'Midsize Cars', 'SIZEC76'),
('INQX', 'Small Sport Utility Vehicle 2WD', 'SIZEC77'),
('INQ60', 'Subcompact Cars', 'SIZEC78'),
('ING20', 'Compact Cars', 'SIZEC79'),
('INQ45', 'Midsize Cars', 'SIZEC80'),
('JECherokee', 'Special Purpose Vehicles', 'SIZEC81'),
('JETrackhawk', 'Standard Sport Utility Vehicle 4WD', 'SIZEC82'),
('JERenegade', 'Small Sport Utility Vehicle 2WD', 'SIZEC83'),
('JEGrand', 'Standard Sport Utility Vehicle 4WD', 'SIZEC84'),
('JECJ', 'Special Purpose Vehicles', 'SIZEC85'),
('KIStinger', 'Midsize Cars', 'SIZEC86'),
('KISeltos', 'Small Sport Utility Vehicle 2WD', 'SIZEC87'),
('KIEV', 'Small Station Wagons', 'SIZEC88'),
('KISorento', 'Small Sport Utility Vehicle 2WD', 'SIZEC89'),
('KIOptima', 'Midsize Cars', 'SIZEC90');

-- Insert into Desciptor 
INSERT INTO Engine_Descriptor (Descriptor_ID, Vehicle_ID, Engine_Descriptor)
VALUES
('DES001', 'ACRLX', 'SIDI; Stop-Start'),
('DES002', 'ACMDX', 'SIDI'),
('DES003', 'ACILX', 'SIDI'),
('DES004', 'ACNSX', 'SIDI; Hybrid'),
('DES005', 'ACRDX', 'SIDI'),
('DES006', 'ASV', ''),
('DES007', 'ASDBVol', ''),
('DES008', 'ASLagonda', 'GUZZLER CA model'),
('DES009', 'ASSaloon', 'GUZZLER CA model'),
('DES010', 'ASDBCou', ''),
('DES011', 'AURS', 'SIDI'),
('DES012', 'AUA4', 'SIDI'),
('DES013', 'AUA5', 'SIDI'),
('DES014', 'AUSQ', 'SIDI'),
('DES015', 'BEMulsanne', ''),
('DES016', 'BEContinental', 'SIDI'),
('DES017', 'BEBentayga', 'SIDI'),
('DES018', 'BEAzure', 'L410MT2'),
('DES019', 'BM640i', 'SIDI'),
('DES020', 'BMM6', 'SIDI'),
('DES021', 'BMX3', 'SIDI'),
('DES022', 'BMX4', 'SIDI'),
('DES023', 'BMM4', 'SIDI'),
('DES024', 'BUChiron', ''),
('DES025', 'BUVeyron', ''),
('DES026', 'BUDivo', ''),
('DES027', 'BULaCrosse', 'SIDI'),
('DES028', 'BURegal', 'SIDI'),
('DES029', 'BUCentury', 'FFS'),
('DES030', 'BULucerne', 'FFV'),
('DES031', 'BUSkyhawk', 'FFS/TRBO CA model'),
('DES032', 'CAEscalade', 'SIDI'),
('DES033', 'CAATS', 'SIDI'),
('DES034', 'CAXTS', 'SIDI'),
('DES035', 'CACTS', 'SIDI'),
('DES036', 'CHCamaro', 'SIDI'),
('DES037', 'CHSilverado', 'SIDI'),
('DES038', 'CHG', 'FFS'),
('DES039', 'CHEquinox', 'SIDI'),
('DES040', 'CHSonic', ''),
('DES041', 'CHPacifica', 'PHEV'),
('DES042', 'CHLeBaron', 'FFS,TRBO'),
('DES043', 'CHQC', 'FFS'),
('DES044', 'CHConquest', 'FFS,TRBO'),
('DES045', 'CHLaser', 'FFS,TRBO'),
('DES046', 'DODart', ''),
('DES047', 'DODurango', ''),
('DES048', 'DOChallenger', ''),
('DES049', 'DOB', 'FFS'),
('DES050', 'DOCharger', ''),
('DES051', 'FOMustang', 'SIDI'),
('DES052', 'FOF', 'FFV'),
('DES053', 'FOEdge', 'SIDI'),
('DES054', 'FOFocus', 'SIDI'),
('DES055', 'FOFusion', 'SIDI'),
('DES056', 'GEG80', 'SIDI'),
('DES057', 'GEG90', 'SIDI'),
('DES058', 'GEG70', 'SIDI'),
('DES059', 'GEGV70', 'SIDI & PFI'),
('DES060', 'GEGV80', 'SIDI & PFI'),
('DES061', 'GMAcadia', 'SIDI'),
('DES062', 'GMYukon', 'SIDI'),
('DES063', 'GMT', 'FFS'),
('DES064', 'GMTerrain', ''),
('DES065', 'GMSierra', 'SIDI'),
('DES066', 'HOAccord', 'SIDI'),
('DES067', 'HOCivic', 'SIDI'),
('DES068', 'HOHybrid', 'Hybrid'),
('DES069', 'HOInsight', 'Hybrid'),
('DES070', 'HOOdyssey', ''),
('DES071', 'HYSonata', 'SIDI'),
('DES072', 'HYTucson', 'SIDI'),
('DES073', 'HYSanta', 'SIDI'),
('DES074', 'HYKona', 'SIDI'),
('DES075', 'HYIoniq', 'SIDI; Hybrid'),
('DES076', 'INQ50', 'SIDI'),
('DES077', 'INQX', ''),
('DES078', 'INQ60', 'SIDI'),
('DES079', 'ING20', 'FFS'),
('DES080', 'INQ45', 'FFS'),
('DES081', 'JECherokee', 'DSL,TRBO NO-CAT'),
('DES082', 'JETrackhawk', ''),
('DES083', 'JERenegade', 'SIDI'),
('DES084', 'JEGrand', ''),
('DES085', 'JECJ', 'FFS'),
('DES086', 'KIStinger', 'SIDI'),
('DES087', 'KISeltos', ''),
('DES088', 'KIEV', ''),
('DES089', 'KISorento', 'SIDI & PFI'),
('DES090', 'KIOptima', '');

-- Insert into GHG table
INSERT INTO GHG_Score (GHG_Score_ID, Vehicle_ID, GHG_Score, GHG_Score_Alternative_Fuel) VALUES 
(1, 'ACRLX', 7, 30),
(2, 'ACMDX', 4, 26),
(3, 'ACILX', 6, 34),
(4, 'ACNSX', 4, 22),
(5,'ACRDX', 5, 28),
(6, 'ASV', NULL, 19),
(7, 'ASDBVol', NULL, 17),
(8, 'ASLagonda', NULL, 9),
(9, 'ASSaloon', NULL, 10),
(10, 'ASDBCou', NULL, 16),
(11, 'AURS', 5, 28),
(12, 'AUA4', 7, 37),
(13,'AUA5', 6, 34),
(14,'AUSQ', 3, 21),
(15,'BEMulsanne', 1, 16),
(16,'BEContinental', 3, 26),
(17,'BEBentayga', 3, 24),
(18,'BEAzure', NULL, 15),
(19,'BM640i', 5, 28),
(20,'BMM6', 3, 22),
(21,'BMX3', 4, 26),
(22,'BMX4', 4, 26),
(23,'BMM4', 4, 23),
(24,'BUChiron', 1, 11),
(25,'BUVeyron', 1, 15),
(26,'BUDivo', 1, 13),
(27,'BULaCrosse', 5, 29),
(28,'BURegal', 5, 32),
(29,'BUCentury', NULL, 29),
(30,'BULucerne', NULL, 26),
(31,'BUSkyhawk', NULL, 27),
(32,'CAEscalade', 3, 22),
(33,'CAATS', 4, 25),
(34,'CAXTS', 4, 28),
(35,'CACTS', 2, 21),
(36,'CHCamaro', 5, 30),
(37,'CHSilverado', 3, 21),
(38,'CHG', NULL, 18),
(39,'CHEquinox', 5, 29),
(40,'CHSonic', 7, 35),
(41,'CHPacifica', 10, 30),
(42,'CHLeBaron', NULL, 22),
(43,'CHQC', NULL, 21),
(44,'CHConquest', NULL, 22),
(45,'CHLaser', NULL, 22),
(46,'DODart', 8, 38),
(47,'DODurango', 3, 22),
(48,'DOChallenger', 3, 23),
(49,'DOB', NULL, 16),
(50,'DOCharger', 4, 27),
(51,'FOMustang', 5, 30),
(52,'FOF', 4, 24),
(53,'FOEdge', 5, 27),
(54,'FOFocus', 7, 38),
(55,'FOFusion', 4, 26),
(56,'GEG80', 4, 25),
(57,'GEG90', 4, 24),
(58,'GEG70', 4, 28),
(59,'GEGV70', 4, 24),
(60,'GEGV80', 5, 25),
(61,'GMAcadia', 4, 25),
(62,'GMYukon', 4, 23),
(63,'GMT', NULL, 20),
(64,'GMTerrain', 6, 38),
(65,'GMSierra', 3, 20),
(66,'HOAccord', 6, 32),
(67,'HOCivic', 8, 42),
(68,'HOHybrid', 9, 48),
(69,'HOInsight', 9, 49),
(70,'HOOdyssey', NULL, 27),
(71,'HYSonata', 7, 36),
(72,'HYTucson', 5, 26),
(73,'HYSanta', 4, 25),
(74,'HYKona', 7, 33),
(75,'HYIoniq', 10, 59),
(76,'INQ50', 5, 26),
(77,'INQX', 4, 24),
(78,'INQ60', 5, 28),
(79,'ING20', NULL, 29),
(80,'INQ45', NULL, 20),
(81,'JECherokee', NULL, 26),
(82,'JETrackhawk', 1, 17),
(83,'JERenegade', 6, 32),
(84,'JEGrand', 2, 18),
(85,'JECJ', NULL, 17),
(86,'KIStinger', 4, 25),
(87,'KISeltos', 7, 34),
(88,'KIEV', 10, 101),
(89,'KISorento', 5, 29),
(90,'KIOptima', NULL, 32);

-- Insert into Vehicle_range table
INSERT INTO Vehicle_Range (Range_ID, Vehicle_ID, Range_Type1, Range_City_Type1, Range_City_Type2, Range_Highway_Type1, Range_Highway_Type2) VALUES 
(1,'ACRLX', 0, 0, 0, 0, 0),
(2,'ACMDX', 0, 0, 0, 0, 0),
(3,'ACILX', 0, 0, 0, 0, 0),
(4,'ACNSX', 0, 0, 0, 0, 0),
(5,'ACRDX', 0, 0, 0, 0, 0),
(6,'ASV', 0, 0, 0, 0, 0),
(7,'ASDBVol', 0, 0, 0, 0, 0),
(8,'ASLagonda', 0, 0, 0, 0, 0),
(9,'ASSaloon', 0, 0, 0, 0, 0),
(10,'ASDBCou', 0, 0, 0, 0, 0),
(11,'AURS', 0, 0, 0, 0, 0),
(12,'AUA4', 0, 0, 0, 0, 0),
(13,'AUA5', 0, 0, 0, 0, 0),
(14,'AUSQ', 0, 0, 0, 0, 0),
(15,'BEMulsanne', 0, 0, 0, 0, 0),
(16,'BEContinental', 0, 0, 0, 0, 0),
(17,'BEBentayga', 0, 0, 0, 0, 0),
(18,'BEAzure', 0, 0, 0, 0, 0),
(19,'BM640i', 0, 0, 0, 0, 0),
(20,'BMM6', 0, 0, 0, 0, 0),
(21,'BMX3', 0, 0, 0, 0, 0),
(22,'BMX4', 0, 0, 0, 0, 0),
(23,'BMM4', 0, 0, 0, 0, 0),
(24,'BUChiron', 0, 0, 0, 0, 0),
(25,'BUVeyron', 0, 0, 0, 0, 0),
(26,'BUDivo', 0, 0, 0, 0, 0),
(27,'BULaCrosse', 0, 0, 0, 0, 0),
(28,'BURegal', 0, 0, 0, 0, 0),
(29,'BUCentury', 0, 0, 0, 0, 0),
(30,'BULucerne', 0, 0, 0, 0, 0),
(31,'BUSkyhawk', 0, 0, 0, 0, 0),
(32,'CAEscalade', 0, 0, 0, 0, 0),
(33,'CAATS', 0, 0, 0, 0, 0),
(34,'CAXTS', 0, 0, 0, 0, 0),
(35,'CACTS', 0, 0, 0, 0, 0),
(36,'CHCamaro', 0, 0, 0, 0, 0),
(37,'CHSilverado', 0, 0, 0, 0, 0),
(38,'CHG', 0, 0, 0, 0, 0),
(39,'CHEquinox', 0, 0, 0, 0, 0),
(40,'CHSonic', 0, 0, 34.41, 0, 29.49),
(41,'CHPacifica', 0, 0, 0, 0, 0),
(42,'CHLeBaron', 0, 0, 0, 0, 0),
(43,'CHQC', 0, 0, 0, 0, 0),
(44,'CHConquest', 0, 0, 0, 0, 0),
(45,'CHLaser', 0, 0, 0, 0, 0),
(46,'DODart', 0, 0, 0, 0, 0),
(47,'DODurango', 0, 0, 0, 0, 0),
(48,'DOChallenger', 0, 0, 0, 0, 0),
(49,'DOB', 0, 0, 0, 0, 0),
(50,'DOCharger', 0, 0, 0, 0, 0),
(51,'FOMustang', 0, 0, 0, 0, 0),
(52,'FOF', 0, 0, 0, 0, 0),
(53,'FOEdge', 0, 0, 0, 0, 0),
(54,'FOFocus', 0, 0, 0, 0, 0),
(55,'FOFusion', 0, 0, 0, 0, 0),
(56,'GEG80', 0, 0, 0, 0, 0),
(57,'GEG90', 0, 0, 0, 0, 0),
(58,'GEG70', 0, 0, 0, 0, 0),
(59,'GEGV70', 0, 0, 0, 0, 0),
(60,'GEGV80', 0, 0, 0, 0, 0),
(61,'GMAcadia', 0, 0, 0, 0, 0),
(62,'GMYukon', 0, 0, 0, 0, 0),
(63,'GMT', 0, 0, 0, 0, 0),
(64,'GMTerrain', 0, 0, 0, 0, 0),
(65,'GMSierra', 0, 0, 0, 0, 0),
(66,'HOAccord', 0, 0, 0, 0, 0),
(67,'HOCivic', 0, 0, 0, 0, 0),
(68,'HOHybrid', 0, 0, 0, 0, 0),
(69,'HOInsight', 0, 0, 0, 0, 0),
(70,'HOOdyssey', 0, 0, 0, 0, 0),
(71,'HYSonata', 0, 0, 0, 0, 0),
(72,'HYTucson', 0, 0, 0, 0, 0),
(73,'HYSanta', 0, 0, 0, 0, 0),
(74,'HYKona', 0, 0, 0, 0, 0),
(75,'HYIoniq', 310, 349.2, 0, 262.1, 0),
(76,'INQ50', 0, 0, 0, 0, 0),
(77,'INQX', 0, 0, 0, 0, 0),
(78,'INQ60', 0, 0, 0, 0, 0),
(79,'ING20', 0, 0, 0, 0, 0),
(80,'INQ45', 0, 0, 0, 0, 0),
(81,'JECherokee', 0, 0, 0, 0, 0),
(82,'JETrackhawk', 0, 0, 0, 0, 0),
(83,'JERenegade', 0, 0, 0, 0, 0),
(84,'JEGrand', 0, 0, 0, 0, 0),
(85,'JECJ', 0, 0, 0, 0, 0),
(86,'KIStinger', 0, 0, 0, 0, 0),
(87,'KISeltos', 0, 0, 0, 0, 0),
(88,'KIEV', 0, 0, 0, 0, 0),
(89,'KISorento', 0, 0, 0, 0, 0),
(90,'KIOptima', 0, 0, 0, 0, 0);

-- Insert into Fuel_cost
INSERT INTO Fuel_Cost (Cost_ID, Vehicle_ID, Annual_Fuel_Cost_Type1, Annual_Fuel_Cost_Type2) VALUES
(1,'ACRLX', 10.259, 0),
(2,'ACMDX', 14.167, 0),
(3,'ACILX', 10.625, 0),
(4,'ACNSX', 14.167, 0),
(5,'ACRDX', 12.396, 0),
(6,'ASV', 19.834, 0),
(7,'ASDBVol', 22.885, 0),
(8,'ASLagonda', 37.189, 0),
(9,'ASSaloon', 37.189, 0),
(10,'ASDBCou', 24.793, 0),
(11,'AURS', 13.523, 0),
(12,'AUA4', 9.597, 0),
(13,'AUA5', 11.019, 0),
(14,'AUSQ', 17.501, 0),
(15,'BEMulsanne', 24.793, 0),
(16,'BEContinental', 15.658, 0),
(17,'BEBentayga', 16.528, 0),
(18,'BEAzure', 24.793, 0),
(19,'BM640i', 13.523, 0),
(20,'BMM6', 17.501, 0),
(21,'BMX3', 14.167, 0),
(22,'BMX4', 14.167, 0),
(23,'BMM4', 15.658, 0),
(24,'BUChiron', 33.057, 0),
(25,'BUVeyron', 29.751, 0),
(26,'BUDivo', 29.751, 0),
(27,'BULaCrosse', 12.935, 0),
(28,'BURegal', 11.443, 0),
(29,'BUCentury', 12.396, 0),
(30,'BULucerne', 14.876, 4.258),
(31,'BUSkyhawk', 13.523, 0),
(32,'CAEscalade', 17.501, 0),
(33,'CAATS', 14.876, 0),
(34,'CAXTS', 13.523, 0),
(35,'CACTS', 18.594, 0),
(36,'CHCamaro', 12.935, 0),
(37,'CHSilverado', 17.501, 0),
(38,'CHG', 18.594, 0),
(39,'CHEquinox', 11.900, 0),
(40,'CHSonic', 9.917, 0),
(41,'CHPacifica', 4.023, 3.628),
(42,'CHLeBaron', 15.658, 0),
(43,'CHQC', 15.658, 0),
(44,'CHConquest', 16.528, 0),
(45,'CHLaser', 15.658, 0),
(46,'DODart', 9.597, 0),
(47,'DODurango', 17.501, 0),
(48,'DOChallenger', 16.528, 0),
(49,'DOB', 22.885, 0),
(50,'DOCharger', 14.167, 0),
(51,'FOMustang', 12.396, 0),
(52,'FOF', 14.876, 4.258),
(53,'FOEdge', 12.935, 0),
(54,'FOFocus', 9.597, 0),
(55,'FOFusion', 14.876, 0),
(56,'GEG80', 15.658, 0),
(57,'GEG90', 14.876, 0),
(58,'GEG70', 13.523, 0),
(59,'GEGV70', 14.876, 0),
(60,'GEGV80', 12.935, 0),
(61,'GMAcadia', 14.876, 0),
(62,'GMYukon', 15.658, 0),
(63,'GMT', 17.501, 0),
(64,'GMTerrain', 11.162, 0),
(65,'GMSierra', 17.501, 0),
(66,'HOAccord', 11.443, 0),
(67,'HOCivic', 8.264, 0),
(68,'HOHybrid', 6.198, 0),
(69,'HOInsight', 5.721, 0),
(70,'HOOdyssey', 13.523, 0),
(71,'HYSonata', 10.259, 0),
(72,'HYTucson', 12.935, 0),
(73,'HYSanta', 14.167, 0),
(74,'HYKona', 9.917, 0),
(75,'HYIoniq', 5.129, 0),
(76,'INQ50', 14.167, 0),
(77,'INQX', 15.658, 0),
(78,'INQ60', 13.523, 0),
(79,'ING20', 12.396, 0),
(80,'INQ45', 17.501, 0),
(81,'JECherokee', 14.288, 0),
(82,'JETrackhawk', 22.885, 0),
(83,'JERenegade', 11.019, 0),
(84,'JEGrand', 19.834, 0),
(85,'JECJ', 19.834, 0),
(86,'KIStinger', 14.876, 0),
(87,'KISeltos', 9.597, 0),
(88,'KIEV', 0.070, 0),
(89,'KISorento', 11.443, 0),
(90,'KIOptima', 11.900, 0);


##### Queries ######
-- 1) Select TOP 5 Highest GHG_Score for alternative fuel cars
SELECT 
    v.Make, v.Model, v.Year, ghg.GHG_Score_Alternative_Fuel
FROM
    Vehicles v
        JOIN
    GHG_Score ghg ON v.Vehicle_ID = ghg.Vehicle_ID
ORDER BY ghg.GHG_Score_Alternative_Fuel DESC
LIMIT 5;

-- 2) Average CO2 emission from each fuel type. 
SELECT 
    ft.Fuel_Type_Name,
    AVG(ce.Co2_Tailpipe_For_Fuel_Type1) AS 'Average Co2 Fuel Type 1',
    AVG(ce.Co2_Tailpipe_For_Fuel_Type2) AS 'Average Co2 Fuel Type 2'
FROM
    Vehicles v
        JOIN
    Fuel_Type ft ON v.Fuel_Type_ID = ft.Fuel_Type_ID
        JOIN
    CO2_Emission ce ON v.CO2_Emission_ID = ce.CO2_Emission_ID
GROUP BY ft.Fuel_Type_Name;
    
-- 3) TOP 10 vehicle CO2 emissions
SELECT 
    v.Make,
    v.Model,
    v.Year,
    ce.Co2_Tailpipe_For_Fuel_Type1,
    ce.Co2_Tailpipe_For_Fuel_Type2
FROM
    Vehicles v
        JOIN
    CO2_Emission ce ON v.CO2_Emission_ID = ce.CO2_Emission_ID
ORDER BY ce.Co2_Tailpipe_For_Fuel_Type1 DESC
LIMIT 10;

-- 4) Total annual fuel cost joining fuel cost with vehicles table
SELECT 
    v.Make,
    v.Model,
    SUM(fc.Annual_Fuel_Cost_Type1 * 12) AS 'Annual Sum Fuel Type 1',
    SUM(fc.Annual_Fuel_Cost_Type2 * 12) AS 'Annual Sum Fuel Type 2'
FROM
    Vehicles v
        JOIN
    Fuel_Cost fc ON v.Vehicle_ID = fc.Vehicle_ID
GROUP BY v.Make , v.Model;

-- 5) GHG score count per vehicle count
SELECT 
    GHG_Score, COUNT(*) AS Vehicle_Count
FROM
    GHG_Score
GROUP BY GHG_Score;

-- 6) Retrrieve all fuel types of vehicles
SELECT 
    v.Make, v.Model, ft.Fuel_Type_Name
FROM
    Vehicles v
        INNER JOIN
    Fuel_Type ft ON v.Fuel_Type_ID = ft.Fuel_Type_ID;

-- 7) Retrieve the transmission type of all vehicles
SELECT 
    v.Make, v.Model, tr.Transmission_Type
FROM
    Vehicles v
        INNER JOIN
    Transmission tr ON v.Transmission_ID = tr.Transmission_ID;

-- 8) Join vehicles with c02 emissions and show make model along with co2 emissions for tailpipe
SELECT 
    v.Make,
    v.Model,
    ce.CO2_Tailpipe_For_Fuel_Type1,
    ce.CO2_Tailpipe_For_Fuel_Type2
FROM
    Vehicles v
        INNER JOIN
    CO2_Emission ce ON v.CO2_Emission_ID = ce.CO2_Emission_ID;

-- 9) calculate average MPG for each transmission type 
SELECT 
    t.Transmission_Type,
    AVG(mpg.Unrounded_Combined_MPG_Type1) AS Avg_MPG_Combined_Type1,
    AVG(mpg.Unrounded_Combined_MPG_Type2) AS Avg_MPG_Combined_Type2
FROM
    Vehicles v
        JOIN
    Transmission t ON v.Transmission_ID = t.Transmission_ID
        JOIN
    MPG_Data mpg ON v.Vehicle_ID = mpg.Vehicle_ID
GROUP BY t.Transmission_Type;

-- 10) Get vehicles with the highest combined MPG by make
SELECT 
    v.Make, MAX(v.MPG_Combined) AS Max_MPG_Combined
FROM
    Vehicles v
GROUP BY v.Make;


########### Procedures #############



-- 1) Stored procedure that retrieves the MPG data for a given vehicleID
DELIMITER //

CREATE PROCEDURE GetMPGDataByVehicleID(
    IN vehicleID VARCHAR(255))
BEGIN
    SELECT Unrounded_City_MPG_Type1, Unrounded_Highway_MPG_Type1, Unrounded_Combined_MPG_Type1
    FROM MPG_Data
    WHERE Vehicle_ID = vehicleID;
  
END;
//

DELIMITER ;
-- call created procedure 
CALL  GetMPGDataByVehicleID ('ACRLX');

-- 2) Stored Procedure to Insert new vehicle entry. Allows for easier entry of new vehicle data
DELIMITER //

CREATE PROCEDURE InsertVehicle(
    IN p_Vehicle_ID VARCHAR(255),
    IN p_Make VARCHAR(255),
    IN p_Model VARCHAR(255),
    IN p_Year NUMERIC,
    IN p_Fuel_Type_ID VARCHAR(255),
    IN p_Transmission_ID VARCHAR(50),
    IN p_Drive VARCHAR(255),
    IN p_Engine_Displacement DECIMAL(10, 5),
    IN p_Cylinders DECIMAL(10, 5)
)
BEGIN
    INSERT INTO Vehicles (Vehicle_ID, Make, Model, Year, Fuel_Type_ID, Transmission_ID, Drive, Engine_Displacement, Cylinders)
    VALUES (p_Vehicle_ID, p_Make, p_Model, p_Year, p_Fuel_Type_ID, p_Transmission_ID, p_Drive, p_Engine_Displacement, p_Cylinders);
END;
//

DELIMITER ;

###Call InsertVehicle
CALL InsertVehicle('brian','brain','brain',1999,'brian','brian','brian',2.0,2);

SELECT *
FROM Vehicles
WHERE Vehicle_ID = 'brian';


-- 3 Calculates total annual fuel cost per vehicle
DELIMITER //
CREATE PROCEDURE Calculate_Annual_Fuel_Cost_For_All_Vehicles()
BEGIN
    SELECT Vehicles.Vehicle_ID, Vehicles.Make, Vehicles.Model,
           (Vehicles.MPG_Combined * Fuel_Cost.Annual_Fuel_Cost_Type1 / 12) AS Annual_Fuel_Cost
    FROM Vehicles
    JOIN Fuel_Cost ON Vehicles.Vehicle_ID = Fuel_Cost.Vehicle_ID;
END;
//
DELIMITER ;


CALL Calculate_Annual_Fuel_Cost_For_All_Vehicles;


#### 4 Generates Total sum of all Co2 emissions for all  vehicles in current data set 
DELIMITER //
CREATE PROCEDURE Calculate_Total_CO2_Emissions()
BEGIN
    SELECT SUM(CO2_Emission.Co2_Tailpipe_For_Fuel_Type1) AS Total_CO2_Emissions
    FROM Vehicles
    JOIN CO2_Emission ON Vehicles.CO2_Emission_ID = CO2_Emission.CO2_Emission_ID;
END;
//
DELIMITER ;

-- calling created procedure  
CALL Calculate_Total_CO2_Emissions;



### 5 Generates GHG score report for all vehicles
DELIMITER //
CREATE PROCEDURE Generate_GHG_Score_Report()
BEGIN
    SELECT Vehicles.Vehicle_ID, Vehicles.Make, Vehicles.Model, GHG_Score.GHG_Score
    FROM Vehicles
    JOIN GHG_Score ON Vehicles.Vehicle_ID = GHG_Score.Vehicle_ID;
END;
//
DELIMITER ;

CALL Generate_GHG_Score_Report;



###### Triggers ######

CREATE TABLE IF NOT EXISTS Fuel_Cost_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    Vehicle_ID VARCHAR(255),
    Old_Annual_Fuel_Cost_Type1 DECIMAL(10 , 2 ),
    New_Annual_Fuel_Cost_Type1 DECIMAL(10 , 2 ),
    Old_Annual_Fuel_Cost_Type2 DECIMAL(10 , 2 ),
    New_Annual_Fuel_Cost_Type2 DECIMAL(10 , 2 ),
    Change_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

## Create trigger that creates change log for changes made to fuel_cost after update
DELIMITER //
CREATE TRIGGER Track_Annual_Fuel_Cost_Changes
AFTER UPDATE ON Fuel_Cost
FOR EACH ROW
BEGIN
    INSERT INTO Fuel_Cost_Log (Vehicle_ID, Old_Annual_Fuel_Cost_Type1, New_Annual_Fuel_Cost_Type1, Old_Annual_Fuel_Cost_Type2, New_Annual_Fuel_Cost_Type2, Change_Date)
    VALUES (NEW.Vehicle_ID, OLD.Annual_Fuel_Cost_Type1, NEW.Annual_Fuel_Cost_Type1, OLD.Annual_Fuel_Cost_Type2, NEW.Annual_Fuel_Cost_Type2, NOW());
END;
//
DELIMITER ;

UPDATE Fuel_Cost 
SET Annual_Fuel_Cost_Type1 = 10.26, Annual_Fuel_Cost_Type2 = 0.00
WHERE Cost_ID = 1;

-- SEE update from fuel_cost_log
SELECT * FROM Fuel_Cost_Log;


## 2) Trigger to Save data before delete command goes through, this way to proctect against accidental deletion of records
CREATE TABLE IF NOT EXISTS Deleted_Records_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    Record_ID VARCHAR(255),
    Vehicle_ID VARCHAR(255),
    Make VARCHAR(255),
    Year NUMERIC,
    Fuel_Type_ID VARCHAR(255),
    Transmission_ID VARCHAR(255),
    Drive VARCHAR(255),
    MPG_City NUMERIC,
    MPG_Highway NUMERIC,
    MPG_Combined NUMERIC,
    CO2_Emission_ID VARCHAR(255),
    Deletion_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER save_records
BEFORE DELETE ON Vehicles
FOR EACH ROW
BEGIN
    DECLARE vehicleID VARCHAR(255);
    DECLARE make VARCHAR(255);
    DECLARE year NUMERIC;
    DECLARE fuelTypeID VARCHAR(255);
    DECLARE transmissionID VARCHAR(255);
    DECLARE drive VARCHAR(255);
    DECLARE mpgCity NUMERIC;
    DECLARE mpgHighway NUMERIC;
    DECLARE mpgCombined NUMERIC;
    DECLARE co2EmissionID VARCHAR(255);

    -- Assign values from OLD to local variables
    SET vehicleID = OLD.Vehicle_ID;
    SET make = OLD.Make;
    SET year = OLD.Year;
    SET fuelTypeID = OLD.Fuel_Type_ID;
    SET transmissionID = OLD.Transmission_ID;
    SET drive = OLD.Drive;
    SET mpgCity = OLD.MPG_City;
    SET mpgHighway = OLD.MPG_Highway;
    SET mpgCombined = OLD.MPG_Combined;
    SET co2EmissionID = OLD.CO2_Emission_ID;

    -- Insert values from local variables into Deleted_Records_Log table
    INSERT INTO Deleted_Records_Log (Record_ID, Vehicle_ID, Make, Year, Fuel_Type_ID, Transmission_ID, Drive, MPG_City, MPG_Highway, MPG_Combined, CO2_Emission_ID, Deletion_Date)
    VALUES (NULL, vehicleID, make, year, fuelTypeID, transmissionID, drive, mpgCity, mpgHighway, mpgCombined, co2EmissionID, NOW());
END;
//
DELIMITER ;

-- Delete a record from the Vehicles table
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Vehicles 
WHERE Vehicle_ID = 'brian';
-- SEE stored delted items
SELECT * FROM Deleted_Records_Log;

-- 3) Trigger to automatically update Vehicle_Size table values after adding a new record for vehicles table

DELIMITER //
CREATE TRIGGER update_vehicle_size_class_and_id
AFTER INSERT ON Vehicles
FOR EACH ROW
BEGIN
    DECLARE size_class VARCHAR(100);
    DECLARE size_class_id VARCHAR(20);
    
    -- Your logic to determine the size class based on vehicle attributes
    IF NEW.Engine_Displacement < 2.0 THEN
        SET size_class = 'Small';
        SET size_class_id = 'SC001'; -- Example ID for Small
    ELSEIF NEW.Engine_Displacement >= 2.0 AND NEW.Engine_Displacement < 3.0 THEN
        SET size_class = 'Medium';
        SET size_class_id = 'MC001'; -- Example ID for Medium
    ELSE
        SET size_class = 'Large';
        SET size_class_id = 'LC001'; -- Example ID for Large
    END IF;
    
    INSERT INTO Vehicle_Size (Vehicle_ID, Vehicle_Size_Class, Size_Class_ID)
    VALUES (NEW.Vehicle_ID, size_class, size_class_id)
    ON DUPLICATE KEY UPDATE Vehicle_Size_Class = size_class, Size_Class_ID = size_class_id;
END;
//
DELIMITER ;


INSERT INTO Vehicles (Vehicle_ID, Make, Model, Year, Fuel_Type_ID, Transmission_ID, Drive, Engine_Displacement, Cylinders, Fuel_Type2, MPG_City, MPG_Highway, MPG_Combined, CO2_Emission_ID)
VALUES ('1', 'Toyota', 'Camry', 2022, 'Gasoline', 'Automatic', 'FWD', 2.5, 4, 2.00, 28, 39, 32, 'CO2_001');

SELECT *
FROM Vehicle_Size
WHERE Vehicle_ID = '1';



########### FUNCTIONS ##########


###### 1) Create function that identifies vehicle ID with lowest CO2 emission ########
DELIMITER //
CREATE FUNCTION Find_Vehicles_With_Lowest_CO2_Emissions() RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE vehicleID VARCHAR(255);
    
    SELECT Vehicle_ID INTO vehicleID
    FROM (
        SELECT v.Vehicle_ID, (c.Co2_Tailpipe_For_Fuel_Type1 + c.Co2_Tailpipe_For_Fuel_Type2) AS total_co2
        FROM Vehicles v
        JOIN CO2_Emission c ON v.CO2_Emission_ID = c.CO2_Emission_ID
        ORDER BY total_co2 ASC
    ) AS subquery
    LIMIT 1;
    
    RETURN vehicleID;
END;

// 
DELIMITER ;

-- using created function to find lowest CO2_Emission
SELECT FIND_VEHICLES_WITH_LOWEST_CO2_EMISSIONS() AS Vehicle_With_Lowest_CO2_Emissions_ID;


###### 2 Function that quickly calculates total annual fuel cost given vehicle ID######

DELIMITER //
CREATE FUNCTION Total_Annual_Fuel_Cost_By_Vehicle(VehicleID VARCHAR(50))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_cost DECIMAL(10,2);
    SELECT SUM(Annual_Fuel_Cost_Type1 + Annual_Fuel_Cost_Type1  * 2 * 12) INTO total_cost
    FROM Fuel_Cost
    WHERE Vehicle_ID = VehicleID;
    RETURN total_cost;
END//

DELIMITER ;

-- using created function to generate total fuel cost with different vehicle ID

SELECT TOTAL_ANNUAL_FUEL_COST_BY_VEHICLE('ACILX');
SELECT TOTAL_ANNUAL_FUEL_COST_BY_VEHICLE('ACMDX');
SELECT TOTAL_ANNUAL_FUEL_COST_BY_VEHICLE('BMM4');


###### 3) function to get GHG score with vehicle ID ######

DELIMITER //
CREATE FUNCTION Get_GHG_Score(VehicleID VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC 
BEGIN
    DECLARE ghg DECIMAL(10,2);
    SELECT GHG_Score.GHG_Score INTO ghg
    FROM GHG_Score WHERE GHG_Score.Vehicle_ID = VehicleID;
    RETURN ghg;
END;
//
DELIMITER ;

-- USING FUNCTION to quickly find GHG Score
SELECT GET_GHG_SCORE('ACILX');
SELECT GET_GHG_SCORE('JETrackhawk');
SELECT GET_GHG_SCORE('HYIoniq');
SELECT GET_GHG_SCORE('GEG70');



###### 4) Funtion to get average CO2 emissions given fuel_type Id ######

DELIMITER //

CREATE FUNCTION Avg_CO2_Emissions_By_Fuel_Type(FuelType VARCHAR(255))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_co2 DECIMAL(10,2);
    SELECT AVG(Co2_Tailpipe_For_Fuel_Type1 + Co2_Tailpipe_For_Fuel_Type2) INTO avg_co2
    FROM CO2_Emission
    WHERE CO2_Emission_ID IN (
        SELECT CO2_Emission_ID
        FROM Vehicles
        WHERE Fuel_Type_ID = FuelType
    );
    RETURN avg_co2;
END;
//
DELIMITER ;

-- quickly estimate co2 emissions given Fuel_Type_ID
SELECT AVG_CO2_EMISSIONS_BY_FUEL_TYPE('XTS19');
SELECT AVG_CO2_EMISSIONS_BY_FUEL_TYPE('Hybrid17');
SELECT AVG_CO2_EMISSIONS_BY_FUEL_TYPE('Coupe08');



###### 5 Best GHG SCore calculator #######
DELIMITER //
CREATE FUNCTION Vehicle_With_Best_GHG_Score()
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE best_vehicle VARCHAR(255);
    SELECT Vehicle_ID INTO best_vehicle
    FROM GHG_Score
    ORDER BY GHG_Score DESC
    LIMIT 1;
    RETURN best_vehicle;
END//
DELIMITER ;

-- Quickly find best GHG score
SELECT VEHICLE_WITH_BEST_GHG_SCORE();
SELECT * FROM GHG_Score WHERE Vehicle_ID = 'CHPacifica';