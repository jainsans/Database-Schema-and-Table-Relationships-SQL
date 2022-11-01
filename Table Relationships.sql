--Creating table Employee Details

CREATE TABLE Employee_Details
(
Emp_ID			INT,
Emp_NAME		VARCHAR(50),
Emp_BRANCH		VARCHAR(20),
Emp_DESIGNATION	VARCHAR(40),
Emp_ADDR		VARCHAR(100),
Emp_CONT_NO		VARCHAR(10),
PRIMARY KEY (Emp_ID)
)

--Creating table Membership

CREATE TABLE Membership  
(
M_ID			INT,
START_DATE		VARCHAR(50),
END_DATE		VARCHAR(50),
PRIMARY KEY (M_ID)
)

--Creating table customer 

CREATE TABLE Customer  
(
Cust_ID				INT,
Cust_NAME			VARCHAR(30),
Cust_EMAIL_ID		VARCHAR(50),
Cust_CONT_NO		VARCHAR(10),
Cust_ADDR			VARCHAR(100),
Cust_TYPE			VARCHAR(30),
Membership_M_ID		INT,
PRIMARY KEY (Cust_ID),
FOREIGN KEY (Membership_M_ID) REFERENCES Membership(M_ID)
)

--Creating Shipment_Details table

CREATE TABLE Shipment_Details  
(
SD_ID				VARCHAR(6),
SD_CONTENT			VARCHAR(40),
SD_DOMAIN			VARCHAR(15),
SD_TYPE				VARCHAR(15),
SD_WEIGHT			VARCHAR(10),
SD_CHARGES			INT,
SD_ADDR				VARCHAR(100),
DS_ADDR				VARCHAR(100),
Customer_Cust_ID	INT,
PRIMARY KEY (SD_ID),
FOREIGN KEY (Customer_Cust_ID) REFERENCES Customer(Cust_ID)
)

--Creating Payment_Details table

CREATE TABLE Payment_Details  
(
PAYMENT_ID				VARCHAR(40),
AMOUNT					INT,
PAYMENT_STATUS			VARCHAR(10),
PAYMENT_DATE			VARCHAR(50),
PAYMENT_MODE			VARCHAR(25),
Shipment_SH_ID			VARCHAR(6),
Shipment_Client_C_ID	INT,
PRIMARY KEY (PAYMENT_ID),
FOREIGN KEY (Shipment_SH_ID) REFERENCES Shipment_Details(SD_ID),
FOREIGN KEY (Shipment_Client_C_ID) REFERENCES Customer(Cust_ID)
)

--Creating Status table 

CREATE TABLE Status  
(
CURRENT_ST				VARCHAR(15),
SENT_DATE				VARCHAR(50),
DELIVERY_DATE			VARCHAR(50),
SH_ID					VARCHAR(6),
PRIMARY KEY (SH_ID)
)


--Creating Employee_Shipment table 

CREATE TABLE Employee_manages_Shipment  
(
Employee_E_ID				INT,
Shipment_SH_ID				VARCHAR(6),
Status_SH_ID				VARCHAR(6),
FOREIGN KEY (Employee_E_ID)   REFERENCES Employee_Details(Emp_ID),
FOREIGN KEY (Shipment_SH_ID) REFERENCES Shipment_Details(SD_ID),
FOREIGN KEY (Status_SH_ID)   REFERENCES Status(SH_ID),
)
