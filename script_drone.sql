USE [competetion]
GO
/****** Object:  Table [dbo].[Geofence]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geofence](
	[GeofenceID] [int] IDENTITY(1,1) NOT NULL,
	[Coordinate1] [varchar](50) NOT NULL,
	[Coordinate2] [varchar](50) NOT NULL,
	[Coordinate3] [varchar](50) NOT NULL,
	[Coordinate4] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GeofenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentID] [int] IDENTITY(1,1) NOT NULL,
	[Drone_Location] [nvarchar](50) NULL,
	[Shipment_To] [nvarchar](50) NULL,
	[Drone_Name] [nvarchar](50) NULL,
	[Shipment_Weight] [int] NULL,
	[Shipment_Date] [date] NULL,
	[UserID] [int] NULL,
	[ShipmentStatus] [bit] NULL,
 CONSTRAINT [PK__Shipment__5CAD378D2FD9600C] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddGeofence]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddGeofence]
    @Coordinate1 VARCHAR(50),
    @Coordinate2 VARCHAR(50),
    @Coordinate3 VARCHAR(50),
    @Coordinate4 VARCHAR(50)
AS
BEGIN
    INSERT INTO Geofence (Coordinate1, Coordinate2, Coordinate3, Coordinate4)
    VALUES (@Coordinate1, @Coordinate2, @Coordinate3, @Coordinate4);
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteShipment]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteShipment]
    @ShipmentID INT
AS
BEGIN
    DELETE FROM Shipment WHERE ShipmentID = @ShipmentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllShipments]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetAllShipments]
AS
BEGIN
    SELECT * FROM Shipment;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GetGeofences]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetGeofences]
AS
BEGIN
    SELECT * FROM Geofence;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GetShipmentByID]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetShipmentByID]
    @ShipmentID INT
AS
BEGIN
    SELECT * FROM Shipment WHERE ShipmentID = @ShipmentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertShipment]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertShipment]
    @Drone_Location NVARCHAR(50) ,
	@Shipment_To NVARCHAR(50),
	@Drone_Name NVARCHAR(50),
	@Shipment_Weight INT ,
	@Shipment_Date nvarchar(50),
	@UserID INT
AS
BEGIN
    INSERT INTO Shipment (Drone_Location, Shipment_To, Drone_Name,Shipment_Weight,Shipment_Date,UserID,ShipmentStatus)
    VALUES (@Drone_Location, @Shipment_To, @Drone_Name,@Shipment_Weight,@Shipment_Date,@UserID,0);
END;
select * from Shipment
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateShipment]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_UpdateShipment]
    @ShipmentID INT,
    @Drone_Location NVARCHAR(50) ,
	@Shipment_To NVARCHAR(50),
	@Drone_Name NVARCHAR(50),
	@Shipment_Weight INT ,
	@Shipment_Date nvarchar(50),
	@UserID INT
AS
BEGIN
    UPDATE Shipment
    SET Drone_Location = @Drone_Location, Shipment_To = @Shipment_To, Drone_Name = @Drone_Name,Shipment_Weight = @Shipment_Weight, Shipment_Date = @Shipment_Date, UserID = @UserID
    WHERE ShipmentID = @ShipmentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStatus]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateStatus]
    @ShipmentID INT,
    @ShipmentStatus bit 

AS
BEGIN
    UPDATE Shipment
    SET ShipmentStatus = @ShipmentStatus
    WHERE ShipmentID = @ShipmentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[U_SP_GetUserByName]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[U_SP_GetUserByName]
@Email nvarchar(50)
as
begin
select * from UserInfo
where 
Email =@Email
end
GO
/****** Object:  StoredProcedure [dbo].[U_SP_SaveSignUp]    Script Date: 04/03/2024 9:46:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[U_SP_SaveSignUp]
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@Password nvarchar(50),
@ContactNo nvarchar(50),
@City nvarchar(50),
@Gender nvarchar(50),
@Role nvarchar(50)
as
begin
Insert into UserInfo (FirstName,LastName,Email,Password,ContactNo,City,Gender,Role) values (@FirstName,@LastName,@Email,@Password,@ContactNo,@City,@Gender,@Role)
end
GO
