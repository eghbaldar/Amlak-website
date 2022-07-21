Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel

Namespace Amlak.DAL
    'Maghazeh
    <DataObject(True)> _
    Public Class Maghazeh

        <DataObjectMethod(DataObjectMethodType.Insert)> _
        Public Shared Function Insert_Maghazeh_Foroosh(ByVal UserName As String, ByVal ConunTryID As Integer, ByVal OstanID As Integer, ByVal ShahrID As Integer, ByVal MantaghehID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Price_Kol As String, ByVal Price_Metri As String, ByVal Tozihat_Price As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("UserName", UserName), New SqlParameter("ConuntryID", ConunTryID), New SqlParameter("OstanID", OstanID), New SqlParameter("ShahrID", ShahrID), New SqlParameter("MantaghehID", MantaghehID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Price_Kol", Price_Kol), New SqlParameter("Price_Metri", Price_Metri), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Insert_Maghazeh_Foroosh", parameters, RowsAffected)
            Return Result
        End Function

        <DataObjectMethod(DataObjectMethodType.Insert)> _
        Public Shared Function Insert_Maghazeh_RahnEjareh(ByVal UserName As String, ByVal ConunTryID As Integer, ByVal OstanID As Integer, ByVal ShahrID As Integer, ByVal MantaghehID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Vadieh As String, ByVal Ejareh As String, ByVal Tozihat_Price As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("UserName", UserName), New SqlParameter("ConuntryID", ConunTryID), New SqlParameter("OstanID", OstanID), New SqlParameter("ShahrID", ShahrID), New SqlParameter("MantaghehID", MantaghehID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Vadieh", Vadieh), New SqlParameter("Ejareh", Ejareh), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Insert_Maghazeh_RahnEjareh", parameters, RowsAffected)
            Return Result
        End Function

        <DataObjectMethod(DataObjectMethodType.Insert)> _
        Public Shared Function Insert_Maghazeh_Rahn(ByVal UserName As String, ByVal ConunTryID As Integer, ByVal OstanID As Integer, ByVal ShahrID As Integer, ByVal MantaghehID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Vadieh As String, ByVal Tozihat_Price As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("UserName", UserName), New SqlParameter("ConuntryID", ConunTryID), New SqlParameter("OstanID", OstanID), New SqlParameter("ShahrID", ShahrID), New SqlParameter("MantaghehID", MantaghehID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Vadieh", Vadieh), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Insert_Maghazeh_Rahn", parameters, RowsAffected)
            Return Result
        End Function

        <DataObjectMethod(DataObjectMethodType.Insert)> _
        Public Shared Function Insert_Maghazeh_Ejareh(ByVal UserName As String, ByVal ConunTryID As Integer, ByVal OstanID As Integer, ByVal ShahrID As Integer, ByVal MantaghehID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Ejareh As String, ByVal Tozihat_Price As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("UserName", UserName), New SqlParameter("ConuntryID", ConunTryID), New SqlParameter("OstanID", OstanID), New SqlParameter("ShahrID", ShahrID), New SqlParameter("MantaghehID", MantaghehID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Ejareh", Ejareh), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Insert_Maghazeh_Ejareh", parameters, RowsAffected)
            Return Result
        End Function

        <DataObjectMethod(DataObjectMethodType.Insert)> _
        Public Shared Function Insert_Maghazeh_SarGhofli(ByVal UserName As String, ByVal ConunTryID As Integer, ByVal OstanID As Integer, ByVal ShahrID As Integer, ByVal MantaghehID As Integer, ByVal MantaghehName As String, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Tel3 As String, ByVal Address As String, ByVal Gheymat_Metri As String, ByVal Gheymat_HadBala As String, ByVal Gheymat_HadPaein As String, ByVal Tozihat_Gheymat As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Tool_Eslahi As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("UserName", UserName), New SqlParameter("ConuntryID", ConunTryID), New SqlParameter("OstanID", OstanID), New SqlParameter("ShahrID", ShahrID), New SqlParameter("MantaghehID", MantaghehID), New SqlParameter("MantaghehName", MantaghehName), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Tel3", Tel3), New SqlParameter("Address", Address), New SqlParameter("Gheymat_Metri", Gheymat_Metri), New SqlParameter("Gheymat_HadBala", Gheymat_HadBala), New SqlParameter("Gheymat_HadPaein", Gheymat_HadPaein), New SqlParameter("Tozihat_Gheymat", Tozihat_Gheymat), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Tool_Eslahi", Tool_Eslahi), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle)}

            Result = dbo.RunProcedure("sp_tblMelk_Insert_Maghazeh_SarGhofli", parameters, RowsAffected)
            Return Result
        End Function


        '==============================================================================
        '==============================================================================

        <DataObjectMethod(DataObjectMethodType.Update)> _
        Public Shared Function Update_Maghazeh_Foroosh(ByVal ID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Price_Kol As String, ByVal Price_Metri As String, ByVal Tozihat_Price As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("ID", ID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Price_Kol", Price_Kol), New SqlParameter("Price_Metri", Price_Metri), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Update_Maghazeh_Foroosh", parameters, RowsAffected)
            Return Result
        End Function

        <DataObjectMethod(DataObjectMethodType.Update)> _
        Public Shared Function Update_Maghazeh_RahnEjareh(ByVal ID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Vadieh As String, ByVal Ejareh As String, ByVal Tozihat_Price As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("ID", ID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Vadieh", Vadieh), New SqlParameter("Ejareh", Ejareh), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Update_Maghazeh_RahnEjareh", parameters, RowsAffected)
            Return Result
        End Function

        <DataObjectMethod(DataObjectMethodType.Update)> _
        Public Shared Function Update_Maghazeh_Rahn(ByVal ID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Vadieh As String, ByVal Tozihat_Price As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("ID", ID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Vadieh", Vadieh), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Update_Maghazeh_Rahn", parameters, RowsAffected)
            Return Result
        End Function

        <DataObjectMethod(DataObjectMethodType.Update)> _
        Public Shared Function Update_Maghazeh_Ejareh(ByVal ID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Ejareh As String, ByVal Tozihat_Price As String, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("ID", ID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Ejareh", Ejareh), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Update_Maghazeh_Ejareh", parameters, RowsAffected)
            Return Result
        End Function

        <DataObjectMethod(DataObjectMethodType.Update)> _
        Public Shared Function Update_Maghazeh_SarGhofli(ByVal ID As Byte, ByVal MantaghehName As String, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Tel3 As String, ByVal Address As String, ByVal Gheymat_Metri As String, ByVal Gheymat_HadBala As String, ByVal Gheymat_HadPaein As String, ByVal Tozihat_Gheymat As String, ByVal OmreBanaID As Integer, ByVal OmreBana_Year As Integer, ByVal NamaTypeID As Integer, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Tool_Eslahi As Integer, ByVal Ab As Boolean, ByVal Bargh As Boolean, ByVal Gaz As Boolean, ByVal Telphone As Boolean, ByVal Anbari As Boolean, ByVal Parking As Boolean, ByVal Tozihat As String, ByVal AgahiTitle As String) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("ID", ID), New SqlParameter("MantaghehName", MantaghehName), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Tel3", Tel3), New SqlParameter("Address", Address), New SqlParameter("Gheymat_Metri", Gheymat_Metri), New SqlParameter("Gheymat_HadBala", Gheymat_HadBala), New SqlParameter("Gheymat_HadPaein", Gheymat_HadPaein), New SqlParameter("Tozihat_Gheymat", Tozihat_Gheymat), New SqlParameter("OmreBanaID", OmreBanaID), New SqlParameter("OmreBana_Year", OmreBana_Year), New SqlParameter("NamaTypeID", NamaTypeID), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Tool_Eslahi", Tool_Eslahi), New SqlParameter("Ab", Ab), New SqlParameter("Bargh", Bargh), New SqlParameter("Gaz", Gaz), New SqlParameter("Telphone", Telphone), New SqlParameter("Anbari", Anbari), New SqlParameter("Parking", Parking), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle)}

            Result = dbo.RunProcedure("sp_tblMelk_Update_Maghazeh_SarGhofli", parameters, RowsAffected)
            Return Result
        End Function

    End Class

End Namespace