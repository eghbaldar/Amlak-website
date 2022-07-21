<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cmdText As String = "INSERT INTO tblPayam(Sender, Reciver, Name, AddressEmail, Message) VALUES (@Sender, @Reciver, @Name, @AddressEmail, @Message)"
        Dim objCnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
        Dim objCmd As SqlCommand = New SqlCommand(cmdText, objCnn)

        Dim Send As String
        If Session("UserName") = Nothing Then
            Send = "GUEST"
        Else
            Send = Session("Username").ToString
        End If
        Try
            objCnn.Open()
            objCmd.Parameters.AddWithValue("@Sender", Send)
            objCmd.Parameters.AddWithValue("@Reciver", "Admin")
            objCmd.Parameters.AddWithValue("@Name", txtName.Text.Trim)
            objCmd.Parameters.AddWithValue("@AddressEmail", txtEmail.Text.Trim)
            objCmd.Parameters.AddWithValue("@Message", txtNote.Text.Trim)
            objCmd.ExecuteNonQuery()
            objCmd.Dispose()
            objCnn.Close()
            lblMsg.ForeColor = Drawing.Color.Green
            lblMsg.Text = "پیام شما با موفقیت ارسال گردید"
            txtName.Text = ""
            txtEmail.Text = ""
            txtNote.Text = ""
        Catch ex As Exception
            lblMsg.ForeColor = Drawing.Color.Red
            lblMsg.Text = "به علت بروز خطا پیام شما ارسال نگردید"
            Response.Write(ex.Message)
        End Try
        'System.Threading.Thread.Sleep(1000)
    End Sub
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 100%">
            <tr>
                <td style="width: 100%">
                    <asp:ScriptManager id="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdateProgress id="UpdateProgress1" runat="server">
                        <progresstemplate>
                            <IMG src="images/Anim.gif" />
                            <BR />
                            <STRONG>درحال ارسال پیام....</STRONG>
                        </progresstemplate>
                    </asp:UpdateProgress>&nbsp;<asp:UpdatePanel id="UpdatePanel1" runat="server">
                        <contenttemplate>
<asp:Label id="lblMsg" runat="server" Font-Size="12pt" Font-Bold="True"></asp:Label><BR /><BR /><TABLE><TBODY><TR><TD style="TEXT-ALIGN: right">نام :</TD><TD style="TEXT-ALIGN: right"><asp:TextBox id="txtName" runat="server" Width="223px"></asp:TextBox> </TD><TD><asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator></TD></TR><TR><TD style="TEXT-ALIGN: right">ادرس ایمیل :</TD><TD style="TEXT-ALIGN: right"><asp:TextBox id="txtEmail" runat="server" Width="223px"></asp:TextBox> </TD><TD><asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></TD></TR><TR><TD style="TEXT-ALIGN: right">متن پیام :</TD><TD><asp:TextBox id="txtNote" runat="server" Width="223px" TextMode="MultiLine" Height="167px"></asp:TextBox> </TD><TD><asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtNote"></asp:RequiredFieldValidator></TD></TR></TBODY></TABLE><asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="ادرس ایمیل را به درستی وارد کنید" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><BR /><asp:Button id="btnSend" onclick="btnSend_Click" runat="server" Text="ارسال پیام"></asp:Button><BR />
</contenttemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

