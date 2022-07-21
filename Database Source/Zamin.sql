
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Insert_Zamin_Foroosh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Insert_Zamin_Foroosh]
  
GO

Create Procedure sp_tblMelk_Insert_Zamin_Foroosh
	@UserName nvarchar(20),
	@ConuntryID int,
	@OstanID int,
	@ShahrID int,
	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Price_Kol nvarchar(12),
	@Price_Metri nvarchar(12),
	@Tozihat_Price nvarchar(200),
	@Metraj_Kol int,
	@Tool_Bar int,
	@Tozihat nvarchar(1000),
	@AgahiTitle nvarchar(50),
	@MalekiatTypeID int
As
Begin
	Insert Into tblMelk
		([UserName],[ConuntryID],[OstanID],[ShahrID],[MantaghehID],[MelkTypeID],[MoamelehID],[Tel1],[Tel2],[Address],[Price_Kol],[Price_Metri],[Tozihat_Price],[Metraj_Kol],[Tool_Bar],[Tozihat],[Visable],[AgahiTitle],[NamaTypeID],[MalekiatTypeID])
	Values
		(@UserName,@ConuntryID,@OstanID,@ShahrID,@MantaghehID,4,1,@Tel1,@Tel2,@Address,@Price_Kol,@Price_Metri,@Tozihat_Price,@Metraj_Kol,@Tool_Bar,@Tozihat,0,@AgahiTitle,1,@MalekiatTypeID)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO

--======================================================================================
--======================================================================================

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblMelk_Update_Zamin_Foroosh]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblMelk_Update_Zamin_Foroosh]
  
GO

Create Procedure sp_tblMelk_Update_Zamin_Foroosh
	@ID int,
--	@ConuntryID int,
--	@OstanID int,
--	@ShahrID int,
--	@MantaghehID int,
	@Tel1 nvarchar(15),
	@Tel2 nvarchar(15),
	@Address nvarchar(200),
	@Price_Kol nvarchar(12),
	@Price_Metri nvarchar(12),
	@Tozihat_Price nvarchar(200),
	@Metraj_Kol int,
	@Tool_Bar int,
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
		[Tel2]			 =	@Tel2,
		[Address]		 =	@Address,
		[Price_Kol]		 =	@Price_Kol,
		[Price_Metri]	 =	@Price_Metri,
		[Tozihat_Price]	 =	@Tozihat_Price,
		[Metraj_Kol]	 =	@Metraj_Kol,
		[Tool_Bar]		 =	@Tool_Bar,
		[Tozihat]	     =	@Tozihat,
		[AgahiTitle]	 =	@AgahiTitle,
		[MalekiatTypeID] =	@MalekiatTypeID
	Where		
		[ID] = @ID

	Declare @ReferenceID int
	Select @ReferenceID = @ID

	Return @ReferenceID

End

GO
