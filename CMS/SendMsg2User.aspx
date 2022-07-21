<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>

<script runat="server">

    Dim ObjCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cmdText As String = "INSERT INTO tblPayam(Sender, Reciver, Message, Name, AddressEmail, MelkID) VALUES(@Sender, @Reciver, @Message, @Name, @AddressEmail, @MelkID)"
        Dim objcmd As New SqlCommand(cmdText, ObjCon)
        Try
            ObjCon.Open()
            objcmd.Parameters.AddWithValue("@Sender", "Admin")
            objcmd.Parameters.AddWithValue("@Reciver", Request.QueryString("ID"))
            objcmd.Parameters.AddWithValue("@Message", txtPayam.Text.Trim)
            objcmd.Parameters.AddWithValue("@Name", "")
            objcmd.Parameters.AddWithValue("@AddressEmail", "")
            objcmd.Parameters.AddWithValue("@MelkID", "")
            objcmd.ExecuteNonQuery()
            ObjCon.Close()
            '
            txtPayam.Text = ""
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table  style="text-align:right">
            <tr>
                <td>
                    متن پیام</td>
                <td>
                    <asp:TextBox ID="txtPayam" runat="server" Height="131px" TextMode="MultiLine" Width="298px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPayam"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
    </table>    
    <div style="text-align: center">
                <br />
                <table>
                    <tr>
                        <td style="width: 100px; height: 26px">
                            <asp:Button ID="btnSend" runat="server" Text="ارسال پیام" Width="70px" OnClick="btnSend_Click" /></td>
                        <td style="width: 100px; height: 26px">
                            <asp:Button ID="Button1" runat="server" PostBackUrl="~/CMS/User-Man.aspx" Text="بازگشت"
                                ValidationGroup="Return" Width="70px" /></td>
                    </tr>
                </table>
    </div>    
</asp:Content>

