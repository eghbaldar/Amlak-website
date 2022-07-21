<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">
    
    Dim Util As New UtilityFunction
    
    Private Sub UpdateAmar()
        '
        Dim objCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString())
        Dim objCmd As New SqlCommand
        
        Dim Url As String = ""
        If Not Request.UrlReferrer = Nothing Then
            Url = Request.UrlReferrer.AbsoluteUri
        End If
        '        
        Dim objSqlCmd As New SqlCommand
        Try
            objCon.Open()
            objSqlCmd.Connection = objCon
            objSqlCmd.CommandText = "INSERT INTO tblCounter(Tarikh, IP, URL) VALUES (@Tarikh, @IP, @URL)"
            objSqlCmd.Parameters.AddWithValue("@Tarikh", Today.Date)
            objSqlCmd.Parameters.AddWithValue("@IP", CStr(Request.UserHostAddress))
            objSqlCmd.Parameters.AddWithValue("@URL", Url)
            objSqlCmd.ExecuteNonQuery()
            '-------            
            objCon.Close()
            'objConnection = Nothing
            objSqlCmd.Dispose()
            objSqlCmd = Nothing
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        '
    End Sub
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Call UpdateAmar()
        DataList1.DataBind()
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <center>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" RepeatColumns="2">
        <ItemTemplate>
            <table align="right" width="280">
                <tr align="right">
                    <td align="right" valign="top" Height="110" Width="125">
                        <img Height="110" Width="125" src=<%#eval("LittlePic").ToString.Replace("\", "/").Remove(0, 1) %> />    
                    </td>
                    <td align="right" valign="top">
                        <a href=showMelk.aspx?ID=<%# Eval("ID")%>>
                            <asp:Label ID="MoamelehIDLabel" runat="server" Text='<%# util.MoamelehType(Eval("MoamelehID"))  %>' ForeColor="#0000FF"></asp:Label>  <asp:Label ID="MelkTypeLabel" runat="server" Text='  <%# Eval("MelkType") %>  ' ForeColor="#0000FF"></asp:Label><br />
                        </a>
                        <br />
                        <asp:Label ID="OstanLabel" runat="server" Text='<%# Eval("OstanName") %>'></asp:Label>-<asp:Label ID="ShahrLabel" runat="server" Text='<%# Eval("ShahrName") %>'></asp:Label>
                        <br />
<%--                        <asp:Label ID="MantaghehLabel" runat="server" Text='<%# Eval("MantaghehName") %>'></asp:Label>
--%>                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
        SelectCommand="SELECT * FROM [V_DefaultPage] ORDER BY [ID] DESC">
    </asp:SqlDataSource>
    </center>
<!--    style="BORDER-RIGHT: #f47d20 1px solid; BORDER-TOP: #f47d20 1px solid; BORDER-LEFT: #f47d20 1px solid; BORDER-BOTTOM: #f47d20 1px solid"  -->
</asp:Content>

