
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Maghazeh_Foroosh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Maghazeh_Foroosh]
  
GO

Create Procedure sp_tblMelk_Insert_Maghazeh_Foroosh
	@UserName nvarchar(20),
	@ConuntryID int,
	@OstanID int,
	@ShahrID int,
	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Price_Kol nvarchar(20),
	@Price_Metri nvarchar(20),
	@Tozihat_Price nvarchar(200),
	@NamaTypeID int,
	@Metraj_Kol int,
	@Tool_Bar int,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Anbari bit,
	@Parking bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
	
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Price_Kol],[Price_Metri],[Tozihat_Price],[NamaTypeID],[Metraj_Kol],[Tool_Bar],[Ab],[Bargh],[Gaz],[Telphone],[Anbari],[Parking],[Tozihat],[Visable],[AgahiTitle],[MalekiatTypeID])
	Values
		(@UserName,@ConuntryID,@OstanID,@ShahrID,@MantaghehID,3,1,@Tel1,@Tel2,@Address,@Price_Kol,@Price_Metri,@Tozihat_Price,@NamaTypeID,@Metraj_Kol,@Tool_Bar,@Ab,@Bargh,@Gaz,@Telphone,@Anbari,@Parking,@Tozihat,0,@AgahiTitle,@MalekiatTypeID)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

--======================================================================================
--======================================================================================


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Maghazeh_RahnEjareh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Maghazeh_RahnEjareh]
  
GO

Create Procedure sp_tblMelk_Insert_Maghazeh_RahnEjareh
	@UserName nvarchar(20),
	@ConuntryID int,
	@OstanID int,
	@ShahrID int,
	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Vadieh nvarchar(20),
	@Ejareh nvarchar(20),
	@Tozihat_Price nvarchar(200),
	@NamaTypeID int,
	@Metraj_Kol int,
	@Tool_Bar int,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Anbari bit,
	@Parking bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
	
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Vadieh],[Ejareh],[Tozihat_Price],[NamaTypeID],[Metraj_Kol],[Tool_Bar],[Ab],[Bargh],[Gaz],[Telphone],[Anbari],[Parking],[Tozihat],[Visable],[AgahiTitle],[MalekiatTypeID])
	Values
		(@UserName,@ConuntryID,@OstanID,@ShahrID,@MantaghehID,3,2,@Tel1,@Tel2,@Address,@Vadieh,@Ejareh,@Tozihat_Price,@NamaTypeID,@Metraj_Kol,@Tool_Bar,@Ab,@Bargh,@Gaz,@Telphone,@Anbari,@Parking,@Tozihat,0,@AgahiTitle,@MalekiatTypeID)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

--======================================================================================
--======================================================================================

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Maghazeh_Rahn]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Maghazeh_Rahn]
  
GO

Create Procedure sp_tblMelk_Insert_Maghazeh_Rahn
	@UserName nvarchar(20),
	@ConuntryID int,
	@OstanID int,
	@ShahrID int,
	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Vadieh nvarchar(20),
	@Tozihat_Price nvarchar(200),
	@NamaTypeID int,
	@Metraj_Kol int,
	@Tool_Bar int,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Anbari bit,
	@Parking bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
	
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Vadieh],[Tozihat_Price],[NamaTypeID],[Metraj_Kol],[Tool_Bar],[Ab],[Bargh],[Gaz],[Telphone],[Anbari],[Parking],[Tozihat],[Visable],[AgahiTitle],[MalekiatTypeID])
	Values
		(@UserName,@ConuntryID,@OstanID,@ShahrID,@MantaghehID,3,3,@Tel1,@Tel2,@Address,@Vadieh,@Tozihat_Price,@NamaTypeID,@Metraj_Kol,@Tool_Bar,@Ab,@Bargh,@Gaz,@Telphone,@Anbari,@Parking,@Tozihat,0,@AgahiTitle,@MalekiatTypeID)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

--======================================================================================
--======================================================================================

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Maghazeh_Ejareh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Maghazeh_Ejareh]
  
GO

Create Procedure sp_tblMelk_Insert_Maghazeh_Ejareh
	@UserName nvarchar(20),
	@ConuntryID int,
	@OstanID int,
	@ShahrID int,
	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Ejareh nvarchar(20),
	@Tozihat_Price nvarchar(200),
	@NamaTypeID int,
	@Metraj_Kol int,
	@Tool_Bar int,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Anbari bit,
	@Parking bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
	
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Ejareh],[Tozihat_Price],[NamaTypeID],[Metraj_Kol],[Tool_Bar],[Ab],[Bargh],[Gaz],[Telphone],[Anbari],[Parking],[Tozihat],[Visable],[AgahiTitle],[MalekiatTypeID])
	Values
		(@UserName,@ConuntryID,@OstanID,@ShahrID,@MantaghehID,3,4,@Tel1,@Tel2,@Address,@Ejareh,@Tozihat_Price,@NamaTypeID,@Metraj_Kol,@Tool_Bar,@Ab,@Bargh,@Gaz,@Telphone,@Anbari,@Parking,@Tozihat,0,@AgahiTitle,@MalekiatTypeID)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

--======================================================================================
--======================================================================================

--IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Maghazeh_SarGhofli]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
--  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Maghazeh_SarGhofli]
--  
--GO
--
--Create Procedure sp_tblMelk_Insert_Maghazeh_SarGhofli
--	@UserName nvarchar(20),
--	@ConuntryID int,
--	@OstanID int,
--	@ShahrID int,
--	@MantaghehID int,
--	@MantaghehName nvarchar(50),
--	@Tel1 nvarchar(15),
--	@Tel2 nvarchar(15),
--	@Tel3 nvarchar(15),
--	@Address nvarchar(200),
--	@Gheymat_Metri nvarchar(12),
--	@Gheymat_HadBala nvarchar(12),
--	@Gheymat_HadPaein nvarchar(12),
--	@Tozihat_Gheymat nvarchar(200),
--	@NamaTypeID int,
--	@Metraj_Kol int,
--	@Tool_Bar int,
--	@Tool_Eslahi int,
--	@Ab bit,
--	@Bargh bit,
--	@Gaz bit,
--	@Telphone bit,
--	@Anbari bit,
--	@Parking bit,
--	@Tozihat nvarchar(1000),
--	@AgahiTitle nvarchar(50)
--As
--Begin
--	Insert Into tblMelk
--		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MantaghehName],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Tel3],[Address],[Gheymat_Metri],[Gheymat_HadBala],[Gheymat_HadPaein],[Tozihat_Gheymat],[NamaTypeID],[Metraj_Kol],[Tool_Bar],[Tool_Eslahi],[Ab],[Bargh],[Gaz],[Telphone],[Anbari],[Parking],[Tozihat],[Visable],[AgahiTitle])
--	Values
--		(@UserName,@ConuntryID,@OstanID,@ShahrID,@MantaghehID,@MantaghehName,3,5,@Tel1,@Tel2,@Tel3,@Address,@Gheymat_Metri,@Gheymat_HadBala,@Gheymat_HadPaein,@Tozihat_Gheymat,@NamaTypeID,@Metraj_Kol,@Tool_Bar,@Tool_Eslahi,@Ab,@Bargh,@Gaz,@Telphone,@Anbari,@Parking,@Tozihat,0,@AgahiTitle)
--
--	Declare @ReferenceID int
--	Select @ReferenceID = @@IDENTITY
--
--	Return @ReferenceID
--
--End
--
--GO
--
--======================================================================================
--======================================================================================


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Maghazeh_Foroosh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Maghazeh_Foroosh]
  
GO

Create Procedure sp_tblMelk_Update_Maghazeh_Foroosh
	@ID int,
--	@ConuntryID int,
--	@OstanID int,
--	@ShahrID int,
--	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Price_Kol nvarchar(20),
	@Price_Metri nvarchar(20),
	@Tozihat_Price nvarchar(200),
	@NamaTypeID int,
	@Metraj_Kol int,
	@Tool_Bar int,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Anbari bit,
	@Parking bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
As
Begin
	Update tblMelk
	SET
--		[ConuntryID]	 =	@ConuntryID,
--		[OstanID]		 =	@OstanID,
--		[ShahrID]		 =	@ShahrID,
--		[MantaghehID]	 =	@MantaghehID,
		[Tel1]			 =	@Tel1,
		[Tel2]		     =	@Tel2,
		[Address]		 =	@Address,
		[Price_Kol]	     =	@Price_Kol,
		[Price_Metri]    =	@Price_Metri,
		[Tozihat_Price]	 =	@Tozihat_Price,
		[NamaTypeID]	 =	@NamaTypeID,
		[Metraj_Kol]	 =	@Metraj_Kol,
		[Tool_Bar]		 =	@Tool_Bar,
		[Ab]			 =	@Ab,
		[Bargh]			 =	@Bargh,
		[Gaz]			 =	@Gaz,
		[Telphone]		 =	@Telphone,
		[Anbari]		 =	@Anbari,
		[Parking]		 =	@Parking,
		[Tozihat]		 =	@Tozihat,
		[AgahiTitle]	 =	@AgahiTitle,
		[MalekiatTypeID] =	@MalekiatTypeID
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	Select @ReferenceID = @ID

	Return @ReferenceID

End

GO

----=====================================================================================
----=====================================================================================
--
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Maghazeh_RahnEjareh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Maghazeh_RahnEjareh]
  
GO

Create Procedure sp_tblMelk_Update_Maghazeh_RahnEjareh
	@ID int,
--	@ConuntryID int,
--	@OstanID int,
--	@ShahrID int,
--	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Vadieh nvarchar(20),
	@Ejareh nvarchar(20),
	@Tozihat_Price nvarchar(200),
	@NamaTypeID int,
	@Metraj_Kol int,
	@Tool_Bar int,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Anbari bit,
	@Parking bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
As
Begin
	Update tblMelk
	SET
--		[ConuntryID]	 =	@ConuntryID,
--		[OstanID]		 =	@OstanID,
--		[ShahrID]		 =	@ShahrID,
--		[MantaghehID]	 =	@MantaghehID,
		[Tel1]			 =	@Tel1,
		[Tel2]		     =	@Tel2,
		[Address]		 =	@Address,
		[Vadieh]	     =	@Vadieh,
		[Ejareh]		 =	@Ejareh,
		[Tozihat_Price]	 =	@Tozihat_Price,
		[NamaTypeID]	 =	@NamaTypeID,
		[Metraj_Kol]	 =	@Metraj_Kol,
		[Tool_Bar]		 =	@Tool_Bar,
		[Ab]			 =	@Ab,
		[Bargh]			 =	@Bargh,
		[Gaz]			 =	@Gaz,
		[Telphone]		 =	@Telphone,
		[Anbari]		 =	@Anbari,
		[Parking]		 =	@Parking,
		[Tozihat]		 =	@Tozihat,
		[AgahiTitle]	 =	@AgahiTitle,
		[MalekiatTypeID] =	@MalekiatTypeID
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	Select @ReferenceID = @ID

	Return @ReferenceID

End

GO

----=====================================================================================
----=====================================================================================
--
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Maghazeh_Rahn]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Maghazeh_Rahn]
  
GO

Create Procedure sp_tblMelk_Update_Maghazeh_Rahn
	@ID int,
--	@ConuntryID int,
--	@OstanID int,
--	@ShahrID int,
--	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Vadieh nvarchar(20),
	@Tozihat_Price nvarchar(200),
	@NamaTypeID int,
	@Metraj_Kol int,
	@Tool_Bar int,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Anbari bit,
	@Parking bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
As
Begin
	Update tblMelk
	SET
--		[ConuntryID]	 =	@ConuntryID,
--		[OstanID]		 =	@OstanID,
--		[ShahrID]		 =	@ShahrID,
--		[MantaghehID]	 =	@MantaghehID,
		[Tel1]			 =	@Tel1,
		[Tel2]		     =	@Tel2,
		[Address]		 =	@Address,
		[Vadieh]	     =	@Vadieh,
		[Tozihat_Price]	 =	@Tozihat_Price,
		[NamaTypeID]	 =	@NamaTypeID,
		[Metraj_Kol]	 =	@Metraj_Kol,
		[Tool_Bar]		 =	@Tool_Bar,
		[Ab]			 =	@Ab,
		[Bargh]			 =	@Bargh,
		[Gaz]			 =	@Gaz,
		[Telphone]		 =	@Telphone,
		[Anbari]		 =	@Anbari,
		[Parking]		 =	@Parking,
		[Tozihat]		 =	@Tozihat,
		[AgahiTitle]	 =	@AgahiTitle,
		[MalekiatTypeID] =	@MalekiatTypeID
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	Select @ReferenceID = @ID

	Return @ReferenceID

End

GO

----=====================================================================================
----=====================================================================================
--
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Maghazeh_Ejareh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Maghazeh_Ejareh]
  
GO

Create Procedure sp_tblMelk_Update_Maghazeh_Ejareh
	@ID int,
--	@ConuntryID int,
--	@OstanID int,
--	@ShahrID int,
--	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Ejareh nvarchar(20),
	@Tozihat_Price nvarchar(200),
	@NamaTypeID int,
	@Metraj_Kol int,
	@Tool_Bar int,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Anbari bit,
	@Parking bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
As
Begin
	Update tblMelk
	SET
--		[ConuntryID]	 =	@ConuntryID,
--		[OstanID]		 =	@OstanID,
--		[ShahrID]		 =	@ShahrID,
--		[MantaghehID]	 =	@MantaghehID,
		[Tel1]			 =	@Tel1,
		[Tel2]		     =	@Tel2,
		[Address]		 =	@Address,
		[Ejareh]		 =	@Ejareh,
		[Tozihat_Price]	 =	@Tozihat_Price,
		[NamaTypeID]	 =	@NamaTypeID,
		[Metraj_Kol]	 =	@Metraj_Kol,
		[Tool_Bar]		 =	@Tool_Bar,
		[Ab]			 =	@Ab,
		[Bargh]			 =	@Bargh,
		[Gaz]			 =	@Gaz,
		[Telphone]		 =	@Telphone,
		[Anbari]		 =	@Anbari,
		[Parking]		 =	@Parking,
		[Tozihat]		 =	@Tozihat,
		[AgahiTitle]	 =	@AgahiTitle,
		[MalekiatTypeID] =	@MalekiatTypeID
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	Select @ReferenceID = @ID

	Return @ReferenceID

End

GO
