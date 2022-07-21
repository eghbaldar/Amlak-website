Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel

Namespace Amlak.DAL
    <DataObject(True)> _
    Public Class Zamin

        <DataObjectMethod(DataObjectMethodType.Insert)> _
        Public Shared Function Insert_Zamin_Foroosh(ByVal UserName As String, ByVal ConunTryID As Integer, ByVal OstanID As Integer, ByVal ShahrID As Integer, ByVal MantaghehID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Price_Kol As String, ByVal Price_Metri As String, ByVal Tozihat_Price As String, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("UserName", UserName), New SqlParameter("ConuntryID", ConunTryID), New SqlParameter("OstanID", OstanID), New SqlParameter("ShahrID", ShahrID), New SqlParameter("MantaghehID", MantaghehID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Price_Kol", Price_Kol), New SqlParameter("Price_Metri", Price_Metri), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Insert_Zamin_Foroosh", parameters, RowsAffected)
            Return Result
        End Function

        '===========================================================================
        '===========================================================================

        <DataObjectMethod(DataObjectMethodType.Update)> _
        Public Shared Function Update_Zamin_Foroosh(ByVal ID As Integer, ByVal Tel1 As String, ByVal Tel2 As String, ByVal Address As String, ByVal Price_Kol As String, ByVal Price_Metri As String, ByVal Tozihat_Price As String, ByVal Metraj_Kol As Integer, ByVal Tool_Bar As Integer, ByVal Tozihat As String, ByVal AgahiTitle As String, ByVal MalekiatTypeID As Integer) As Integer
            Dim RowsAffected As Integer = 0
            Dim Result As Integer = 0
            Dim dbo As DbObject = New DbObject()
            Dim parameters() As SqlParameter = New SqlParameter() {New SqlParameter("ID", ID), New SqlParameter("Tel1", Tel1), New SqlParameter("Tel2", Tel2), New SqlParameter("Address", Address), New SqlParameter("Price_Kol", Price_Kol), New SqlParameter("Price_Metri", Price_Metri), New SqlParameter("Tozihat_Price", Tozihat_Price), New SqlParameter("Metraj_Kol", Metraj_Kol), New SqlParameter("Tool_Bar", Tool_Bar), New SqlParameter("Tozihat", Tozihat), New SqlParameter("AgahiTitle", AgahiTitle), New SqlParameter("MalekiatTypeID", MalekiatTypeID)}

            Result = dbo.RunProcedure("sp_tblMelk_Update_Zamin_Foroosh", parameters, RowsAffected)
            Return Result
        End Function

    End Class

End Namespace