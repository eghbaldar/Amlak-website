Imports System
Imports System.Data
Imports System.Data.SqlClient

Namespace Amlak.DAL
    Public Class DbObject
        Protected Connection As SqlConnection
        Private connectionString As String

        Public Sub New(ByVal NewConnectionString As String)
            connectionString = NewConnectionString
            Connection = New SqlConnection(connectionString)
        End Sub
        Public Sub New()
            connectionString = StrConnection
            Connection = New SqlConnection(connectionString)
        End Sub

        Private Function BuildIntCommand(ByVal storedProcName As String, ByVal parameters() As IDataParameter) As SqlCommand
            Dim command As SqlCommand = BuildQueryCommand(storedProcName, parameters)

            command.Parameters.Add(New SqlParameter("ReturnValue", _
             SqlDbType.Int, _
             4, _
             ParameterDirection.ReturnValue, _
             False, _
             0, _
             0, _
             String.Empty, _
             DataRowVersion.Default, _
             DBNull.Value))


            Return command
        End Function

        Private Function BuildQueryCommand(ByVal storedProcName As String, ByVal parameters() As IDataParameter) As SqlCommand
            Dim command As SqlCommand = New SqlCommand(storedProcName, Connection)
            command.CommandType = CommandType.StoredProcedure

            Dim parameter As SqlParameter
            For Each parameter In parameters
                command.Parameters.Add(parameter)
            Next

            Return command

        End Function

        Public Function RunProcedure(ByVal storedProcName As String, ByVal parameters() As IDataParameter, ByRef rowsAffected As Integer) As Integer
            Dim result As Integer

            Connection.Open()
            Dim command As SqlCommand = BuildIntCommand(storedProcName, parameters)
            rowsAffected = command.ExecuteNonQuery()
            result = CType(command.Parameters("ReturnValue").Value, Integer)
            Connection.Close()
            Return result
        End Function

        Public Function RunProcedure(ByVal storedProcName As String, ByVal parameters() As IDataParameter) As SqlDataReader
            Dim ReturnReader As SqlDataReader

            Connection.Open()
            Dim command As SqlCommand = BuildQueryCommand(storedProcName, parameters)
            command.CommandType = CommandType.StoredProcedure

            ReturnReader = command.ExecuteReader()
            'Connection.Close();
            Return ReturnReader
        End Function

        Public Function RunProcedure(ByVal storedProcName As String, ByVal parameters() As IDataParameter, ByVal tableName As String) As DataSet
            Dim dataSet As DataSet = New DataSet()
            Connection.Open()
            Dim sqlDA As SqlDataAdapter = New SqlDataAdapter()
            sqlDA.SelectCommand = BuildQueryCommand(storedProcName, parameters)
            sqlDA.Fill(dataSet, tableName)
            Connection.Close()

            Return dataSet
        End Function

        Public Sub RunProcedure(ByVal storedProcName As String, ByVal parameters() As IDataParameter, ByVal dataSet As DataSet, ByVal tableName As String)
            Connection.Open()
            Dim sqlDA As SqlDataAdapter = New SqlDataAdapter()
            sqlDA.SelectCommand = BuildIntCommand(storedProcName, parameters)
            sqlDA.Fill(dataSet, tableName)
            Connection.Close()
        End Sub

    End Class

End Namespace