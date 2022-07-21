
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Aparteman_Foroosh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Aparteman_Foroosh]
  
GO

Create Procedure sp_tblMelk_Insert_Aparteman_Foroosh
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
	@SokounatStatusID int,
	@Tedad_Tabagheh int,
	@Tedad_Vahed int,
	@Tedad_Khab int,
	@Vahed_Foroosh int,
	@Metraj_Mofid int,
	@Metraj_Mosha int,
	@Metraj_Kol int,
	@KarbariTypeID int,
	@MalekiatTypeID int,
	@ServiceID int,
	@AshpazOpen bit,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Package bit,
	@Shoofaj bit,
	@Espilet bit,
	@Shoomineh bit,
	@Anbari bit,
	@Parking bit,
	@Asansor bit,
	@Dar_Kontroli bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50)
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Price_Metri],[Price_Kol],[Tozihat_Price], [NamaTypeID],[SokounatStatusID],[Tedad_Tabagheh],[Tedad_Vahed],[Tedad_Khab],[Vahed_Foroosh],[Metraj_Mofid],[Metraj_Mosha],[Metraj_Kol],[KarbariTypeID],[MalekiatTypeID], [ServiceID], [AshpazOpen],[Ab],[Bargh],[Gaz],[Telphone],[Package],[Shoofaj],[Espilet],[Shoomineh],[Anbari],[Parking],[Asansor],[Dar_Kontroli],[Tozihat],[AgahiTitle])
	Values
		(@UserName, @ConuntryID, @OstanID, @ShahrID, @MantaghehID, 1, 1, @Tel1, @Tel2, @Address, @Price_Metri, @Price_Kol, @Tozihat_Price, @NamaTypeID, @SokounatStatusID, @Tedad_Tabagheh, @Tedad_Vahed, @Tedad_Khab, @Vahed_Foroosh, @Metraj_Mofid, @Metraj_Mosha, @Metraj_Kol, @KarbariTypeID, @MalekiatTypeID, @ServiceID, @AshpazOpen, @Ab, @Bargh, @Gaz, @Telphone, @Package, @Shoofaj, @Espilet, @Shoomineh, @Anbari, @Parking, @Asansor, @Dar_Kontroli, @Tozihat, @AgahiTitle)
	
	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

--======================================================================================
--======================================================================================

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Aparteman_RahnEjareh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Aparteman_RahnEjareh]
  
GO

Create Procedure sp_tblMelk_Insert_Aparteman_RahnEjareh
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
	@SokounatStatusID int,
	@Tedad_Tabagheh int,
	@Tedad_Vahed int,
	@Tedad_Khab int,
	@Vahed_Foroosh int,
	@Metraj_Mofid int,
	@Metraj_Mosha int,
	@Metraj_Kol int,
	@KarbariTypeID int,
	@MalekiatTypeID int,
	@ServiceID int,
	@AshpazOpen bit,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Package bit,
	@Shoofaj bit,
	@Espilet bit,
	@Shoomineh bit,
	@Anbari bit,
	@Parking bit,
	@Asansor bit,
	@Dar_Kontroli bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50)
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Vadieh],[Ejareh],[Tozihat_Price], [NamaTypeID],[SokounatStatusID],[Tedad_Tabagheh],[Tedad_Vahed],[Tedad_Khab],[Vahed_Foroosh],[Metraj_Mofid],[Metraj_Mosha],[Metraj_Kol],[KarbariTypeID],[MalekiatTypeID], [ServiceID], [AshpazOpen],[Ab],[Bargh],[Gaz],[Telphone],[Package],[Shoofaj],[Espilet],[Shoomineh],[Anbari],[Parking],[Asansor],[Dar_Kontroli],[Tozihat],[AgahiTitle])
	Values
		(@UserName, @ConuntryID, @OstanID, @ShahrID, @MantaghehID, 1, 2, @Tel1, @Tel2, @Address, @Vadieh, @Ejareh, @Tozihat_Price, @NamaTypeID, @SokounatStatusID, @Tedad_Tabagheh, @Tedad_Vahed, @Tedad_Khab, @Vahed_Foroosh, @Metraj_Mofid, @Metraj_Mosha, @Metraj_Kol, @KarbariTypeID, @MalekiatTypeID, @ServiceID, @AshpazOpen, @Ab, @Bargh, @Gaz, @Telphone, @Package, @Shoofaj, @Espilet, @Shoomineh, @Anbari, @Parking, @Asansor, @Dar_Kontroli, @Tozihat, @AgahiTitle)
	
	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

----======================================================================================
----======================================================================================


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Aparteman_Rahn]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Aparteman_Rahn]
  
GO

Create Procedure sp_tblMelk_Insert_Aparteman_Rahn
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
	@SokounatStatusID int,
	@Tedad_Tabagheh int,
	@Tedad_Vahed int,
	@Tedad_Khab int,
	@Vahed_Foroosh int,
	@Metraj_Mofid int,
	@Metraj_Mosha int,
	@Metraj_Kol int,
	@KarbariTypeID int,
	@MalekiatTypeID int,
	@ServiceID int,
	@AshpazOpen bit,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Package bit,
	@Shoofaj bit,
	@Espilet bit,
	@Shoomineh bit,
	@Anbari bit,
	@Parking bit,
	@Asansor bit,
	@Dar_Kontroli bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50)
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Vadieh],[Tozihat_Price], [NamaTypeID],[SokounatStatusID],[Tedad_Tabagheh],[Tedad_Vahed],[Tedad_Khab],[Vahed_Foroosh],[Metraj_Mofid],[Metraj_Mosha],[Metraj_Kol],[KarbariTypeID],[MalekiatTypeID], [ServiceID], [AshpazOpen],[Ab],[Bargh],[Gaz],[Telphone],[Package],[Shoofaj],[Espilet],[Shoomineh],[Anbari],[Parking],[Asansor],[Dar_Kontroli],[Tozihat],[AgahiTitle])
	Values
		(@UserName, @ConuntryID, @OstanID, @ShahrID, @MantaghehID, 1, 3, @Tel1, @Tel2, @Address, @Vadieh, @Tozihat_Price, @NamaTypeID, @SokounatStatusID, @Tedad_Tabagheh, @Tedad_Vahed, @Tedad_Khab, @Vahed_Foroosh, @Metraj_Mofid, @Metraj_Mosha, @Metraj_Kol, @KarbariTypeID, @MalekiatTypeID, @ServiceID, @AshpazOpen, @Ab, @Bargh, @Gaz, @Telphone, @Package, @Shoofaj, @Espilet, @Shoomineh, @Anbari, @Parking, @Asansor, @Dar_Kontroli, @Tozihat, @AgahiTitle)
	
	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

----======================================================================================
----======================================================================================


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Aparteman_Ejareh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Aparteman_Ejareh]
  
GO

Create Procedure sp_tblMelk_Insert_Aparteman_Ejareh
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
	@SokounatStatusID int,
	@Tedad_Tabagheh int,
	@Tedad_Vahed int,
	@Tedad_Khab int,
	@Vahed_Foroosh int,
	@Metraj_Mofid int,
	@Metraj_Mosha int,
	@Metraj_Kol int,
	@KarbariTypeID int,
	@MalekiatTypeID int,
	@ServiceID int,
	@AshpazOpen bit,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Package bit,
	@Shoofaj bit,
	@Espilet bit,
	@Shoomineh bit,
	@Anbari bit,
	@Parking bit,
	@Asansor bit,
	@Dar_Kontroli bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50)
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Ejareh],[Tozihat_Price], [NamaTypeID],[SokounatStatusID],[Tedad_Tabagheh],[Tedad_Vahed],[Tedad_Khab],[Vahed_Foroosh],[Metraj_Mofid],[Metraj_Mosha],[Metraj_Kol],[KarbariTypeID],[MalekiatTypeID], [ServiceID], [AshpazOpen],[Ab],[Bargh],[Gaz],[Telphone],[Package],[Shoofaj],[Espilet],[Shoomineh],[Anbari],[Parking],[Asansor],[Dar_Kontroli],[Tozihat],[AgahiTitle])
	Values
		(@UserName, @ConuntryID, @OstanID, @ShahrID, @MantaghehID, 1, 4, @Tel1, @Tel2, @Address, @Ejareh, @Tozihat_Price, @NamaTypeID, @SokounatStatusID, @Tedad_Tabagheh, @Tedad_Vahed, @Tedad_Khab, @Vahed_Foroosh, @Metraj_Mofid, @Metraj_Mosha, @Metraj_Kol, @KarbariTypeID, @MalekiatTypeID, @ServiceID, @AshpazOpen, @Ab, @Bargh, @Gaz, @Telphone, @Package, @Shoofaj, @Espilet, @Shoomineh, @Anbari, @Parking, @Asansor, @Dar_Kontroli, @Tozihat, @AgahiTitle)
	
	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

----======================================================================================
----======================================================================================
--
--
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Aparteman_Foroosh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Aparteman_Foroosh]
  
GO

Create Procedure sp_tblMelk_Update_Aparteman_Foroosh
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
	@SokounatStatusID int,
	@Tedad_Tabagheh int,
	@Tedad_Vahed int,
	@Tedad_Khab int,
	@Vahed_Foroosh int,
	@Metraj_Mofid int,
	@Metraj_Mosha int,
	@Metraj_Kol int,
	@KarbariTypeID int,
	@MalekiatTypeID int,
	@ServiceID int,
	@AshpazOpen bit,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Package bit,
	@Shoofaj bit,
	@Espilet bit,
	@Shoomineh bit,
	@Anbari bit,
	@Parking bit,
	@Asansor bit,
	@Dar_Kontroli bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50)
As
Begin
	Update tblMelk
	SET
--		[ConuntryID]	   = @ConuntryID,
--		[OstanID]		   = @OstanID,
--		[ShahrID]		   = @ShahrID,
--		[MantaghehID]	   = @MantaghehID,
		[Tel1]			   = @Tel1,
		[Tel2]			   = @Tel2,
		[Address]		   = @Address,
		[Price_Kol]		   = @Price_Kol,
		[Price_Metri]	   = @Price_Metri,
		[Tozihat_Price]	   = @Tozihat_Price,
		[NamaTypeID]	   = @NamaTypeID,
		[SokounatStatusID] = @SokounatStatusID,
		[Tedad_Tabagheh]   = @Tedad_Tabagheh,
		[Tedad_Vahed]	   = @Tedad_Vahed,
		[Tedad_Khab]	   = @Tedad_Khab,
		[Vahed_Foroosh]	   = @Vahed_Foroosh,
		[Metraj_Mofid]	   = @Metraj_Mofid,
		[Metraj_Mosha]	   = @Metraj_Mosha,
		[Metraj_Kol]	   = @Metraj_Kol,
		[KarbariTypeID]	   = @KarbariTypeID,
		[MalekiatTypeID]   = @MalekiatTypeID,
		[ServiceID]		   = @ServiceID,
		[AshpazOpen]	   = @AshpazOpen,
		[Ab]			   = @Ab,
		[Bargh]			   = @Bargh,
		[Gaz]			   = @Gaz,
		[Telphone]		   = @Telphone,
		[Package]		   = @Package,
		[Shoofaj]		   = @Shoofaj,
		[Espilet]		   = @Espilet,
		[Shoomineh]		   = @Shoomineh,
		[Anbari]		   = @Anbari,
		[Parking]		   = @Parking,
		[Asansor]		   = @Asansor,
		[Dar_Kontroli]	   = @Dar_Kontroli,
		[Tozihat]		   = @Tozihat,
		[AgahiTitle]	   = @AgahiTitle
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	--Select @ReferenceID = @@IDENTITY
    Select @ReferenceID = @ID
	Return @ReferenceID


End

GO

----======================================================================================
----======================================================================================
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Aparteman_RahnEjareh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Aparteman_RahnEjareh]
  
GO

Create Procedure sp_tblMelk_Update_Aparteman_RahnEjareh
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
	@SokounatStatusID int,
	@Tedad_Tabagheh int,
	@Tedad_Vahed int,
	@Tedad_Khab int,
	@Vahed_Foroosh int,
	@Metraj_Mofid int,
	@Metraj_Mosha int,
	@Metraj_Kol int,
	@KarbariTypeID int,
	@MalekiatTypeID int,
	@ServiceID int,
	@AshpazOpen bit,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Package bit,
	@Shoofaj bit,
	@Espilet bit,
	@Shoomineh bit,
	@Anbari bit,
	@Parking bit,
	@Asansor bit,
	@Dar_Kontroli bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50)
As
Begin
	Update tblMelk
	SET
--		[ConuntryID]	   = @ConuntryID,
--		[OstanID]		   = @OstanID,
--		[ShahrID]		   = @ShahrID,
--		[MantaghehID]	   = @MantaghehID,
		[Tel1]			   = @Tel1,
		[Tel2]			   = @Tel2,
		[Address]		   = @Address,
		[Vadieh]		   = @Vadieh,
		[Ejareh]		   = @Ejareh,
		[Tozihat_Price]	   = @Tozihat_Price,
		[NamaTypeID]	   = @NamaTypeID,
		[SokounatStatusID] = @SokounatStatusID,
		[Tedad_Tabagheh]   = @Tedad_Tabagheh,
		[Tedad_Vahed]	   = @Tedad_Vahed,
		[Tedad_Khab]	   = @Tedad_Khab,
		[Vahed_Foroosh]	   = @Vahed_Foroosh,
		[Metraj_Mofid]	   = @Metraj_Mofid,
		[Metraj_Mosha]	   = @Metraj_Mosha,
		[Metraj_Kol]	   = @Metraj_Kol,
		[KarbariTypeID]	   = @KarbariTypeID,
		[MalekiatTypeID]   = @MalekiatTypeID,
		[ServiceID]		   = @ServiceID,
		[AshpazOpen]	   = @AshpazOpen,
		[Ab]			   = @Ab,
		[Bargh]			   = @Bargh,
		[Gaz]			   = @Gaz,
		[Telphone]		   = @Telphone,
		[Package]		   = @Package,
		[Shoofaj]		   = @Shoofaj,
		[Espilet]		   = @Espilet,
		[Shoomineh]		   = @Shoomineh,
		[Anbari]		   = @Anbari,
		[Parking]		   = @Parking,
		[Asansor]		   = @Asansor,
		[Dar_Kontroli]	   = @Dar_Kontroli,
		[Tozihat]		   = @Tozihat,
		[AgahiTitle]	   = @AgahiTitle
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	--Select @ReferenceID = @@IDENTITY
    Select @ReferenceID = @ID
	Return @ReferenceID


End

GO

----======================================================================================
----======================================================================================
--
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Aparteman_Rahn]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Aparteman_Rahn]
  
GO

Create Procedure sp_tblMelk_Update_Aparteman_Rahn
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
	@SokounatStatusID int,
	@Tedad_Tabagheh int,
	@Tedad_Vahed int,
	@Tedad_Khab int,
	@Vahed_Foroosh int,
	@Metraj_Mofid int,
	@Metraj_Mosha int,
	@Metraj_Kol int,
	@KarbariTypeID int,
	@MalekiatTypeID int,
	@ServiceID int,
	@AshpazOpen bit,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Package bit,
	@Shoofaj bit,
	@Espilet bit,
	@Shoomineh bit,
	@Anbari bit,
	@Parking bit,
	@Asansor bit,
	@Dar_Kontroli bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50)
As
Begin
	Update tblMelk
	SET
--		[ConuntryID]	   = @ConuntryID,
--		[OstanID]		   = @OstanID,
--		[ShahrID]		   = @ShahrID,
--		[MantaghehID]	   = @MantaghehID,
		[Tel1]			   = @Tel1,
		[Tel2]			   = @Tel2,
		[Address]		   = @Address,
		[Vadieh]		   = @Vadieh,
		[Tozihat_Price]	   = @Tozihat_Price,
		[NamaTypeID]	   = @NamaTypeID,
		[SokounatStatusID] = @SokounatStatusID,
		[Tedad_Tabagheh]   = @Tedad_Tabagheh,
		[Tedad_Vahed]	   = @Tedad_Vahed,
		[Tedad_Khab]	   = @Tedad_Khab,
		[Vahed_Foroosh]	   = @Vahed_Foroosh,
		[Metraj_Mofid]	   = @Metraj_Mofid,
		[Metraj_Mosha]	   = @Metraj_Mosha,
		[Metraj_Kol]	   = @Metraj_Kol,
		[KarbariTypeID]	   = @KarbariTypeID,
		[MalekiatTypeID]   = @MalekiatTypeID,
		[ServiceID]		   = @ServiceID,
		[AshpazOpen]	   = @AshpazOpen,
		[Ab]			   = @Ab,
		[Bargh]			   = @Bargh,
		[Gaz]			   = @Gaz,
		[Telphone]		   = @Telphone,
		[Package]		   = @Package,
		[Shoofaj]		   = @Shoofaj,
		[Espilet]		   = @Espilet,
		[Shoomineh]		   = @Shoomineh,
		[Anbari]		   = @Anbari,
		[Parking]		   = @Parking,
		[Asansor]		   = @Asansor,
		[Dar_Kontroli]	   = @Dar_Kontroli,
		[Tozihat]		   = @Tozihat,
		[AgahiTitle]	   = @AgahiTitle
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	--Select @ReferenceID = @@IDENTITY
    Select @ReferenceID = @ID
	Return @ReferenceID

End

GO
----======================================================================================
----======================================================================================
--
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Aparteman_Ejareh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Aparteman_Ejareh]
  
GO

Create Procedure sp_tblMelk_Update_Aparteman_Ejareh
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
	@SokounatStatusID int,
	@Tedad_Tabagheh int,
	@Tedad_Vahed int,
	@Tedad_Khab int,
	@Vahed_Foroosh int,
	@Metraj_Mofid int,
	@Metraj_Mosha int,
	@Metraj_Kol int,
	@KarbariTypeID int,
	@MalekiatTypeID int,
	@ServiceID int,
	@AshpazOpen bit,
	@Ab bit,
	@Bargh bit,
	@Gaz bit,
	@Telphone bit,
	@Package bit,
	@Shoofaj bit,
	@Espilet bit,
	@Shoomineh bit,
	@Anbari bit,
	@Parking bit,
	@Asansor bit,
	@Dar_Kontroli bit,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50)
As
Begin
	Update tblMelk
	SET
--		[ConuntryID]	   = @ConuntryID,
--		[OstanID]		   = @OstanID,
--		[ShahrID]		   = @ShahrID,
--		[MantaghehID]	   = @MantaghehID,
		[Tel1]			   = @Tel1,
		[Tel2]			   = @Tel2,
		[Address]		   = @Address,
		[Ejareh]		   = @Ejareh,
		[Tozihat_Price]	   = @Tozihat_Price,
		[NamaTypeID]	   = @NamaTypeID,
		[SokounatStatusID] = @SokounatStatusID,
		[Tedad_Tabagheh]   = @Tedad_Tabagheh,
		[Tedad_Vahed]	   = @Tedad_Vahed,
		[Tedad_Khab]	   = @Tedad_Khab,
		[Vahed_Foroosh]	   = @Vahed_Foroosh,
		[Metraj_Mofid]	   = @Metraj_Mofid,
		[Metraj_Mosha]	   = @Metraj_Mosha,
		[Metraj_Kol]	   = @Metraj_Kol,
		[KarbariTypeID]	   = @KarbariTypeID,
		[MalekiatTypeID]   = @MalekiatTypeID,
		[ServiceID]		   = @ServiceID,
		[AshpazOpen]	   = @AshpazOpen,
		[Ab]			   = @Ab,
		[Bargh]			   = @Bargh,
		[Gaz]			   = @Gaz,
		[Telphone]		   = @Telphone,
		[Package]		   = @Package,
		[Shoofaj]		   = @Shoofaj,
		[Espilet]		   = @Espilet,
		[Shoomineh]		   = @Shoomineh,
		[Anbari]		   = @Anbari,
		[Parking]		   = @Parking,
		[Asansor]		   = @Asansor,
		[Dar_Kontroli]	   = @Dar_Kontroli,
		[Tozihat]		   = @Tozihat,
		[AgahiTitle]	   = @AgahiTitle
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	----Select @ReferenceID = @@IDENTITY
    Select @ReferenceID = @ID
	Return @ReferenceID

End

GO

----======================================================================================
----======================================================================================
--
