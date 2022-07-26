<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>

<script runat="server">

    Dim objCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
    Dim objCmd As New SqlCommand
    Dim objDataReader As SqlDataReader
    
    Dim IsGuest As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cmdText As String = "SELECT * FROM tblPayam WHERE ID=" & Request.QueryString("ID")
        Dim FD As New ShamsiDate
        
        Try
            Call UpdateMsgStatus()
            '
            objCon.Open()
            objCmd.Connection = objCon
            objCmd.CommandText = cmdText
            objDataReader = objCmd.ExecuteReader()
            If objDataReader.Read Then
                If objDataReader("Sender").ToString = "GUEST" Then
                    lblSender.Text = "کاربر مهمان"
                    IsGuest = True
                Else
                    lblSender.Text = objDataReader("Sender").ToString
                    IsGuest = False
                End If
                lblName.Text = objDataReader("Name").ToString
                lblEmail.Text = objDataReader("AddressEmail").ToString
                lblTarikh.Text = FD.Miladi2Shamsi(objDataReader("Tarikh").ToString, ShamsiDate.ShowType.ShortDate)
                lblMelkID.Text = objDataReader("MelkID").ToString
                txtNote.Text = objDataReader("Message").ToString
            End If
            objCon.Close()
            objCmd.Clone()
            '
        Catch ex As Exception
            Response.Write(ex.Message)

        End Try
    End Sub
    
    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cmdText As String = "INSERT INTO tblPayam(Sender, Reciver, Message, Name, AddressEmail, MelkID) VALUES(@Sender, @Reciver, @Message, @Name, @AddressEmail, @MelkID)"
        Dim objcmd As New SqlCommand(cmdText, objCon)
        Try
            objCon.Open()
            objcmd.Parameters.AddWithValue("@Sender", "Admin")
            objcmd.Parameters.AddWithValue("@Reciver", lblSender.Text)
            objcmd.Parameters.AddWithValue("@Message", Replace(txtPayam.Text.Trim, vbCrLf, "<br />"))
            objcmd.Parameters.AddWithValue("@Name", "")
            objcmd.Parameters.AddWithValue("@AddressEmail", "")
            objcmd.Parameters.AddWithValue("@MelkID", lblMelkID.Text)
            objcmd.ExecuteNonQuery()
            objCon.Close()
            '
            txtPayam.Text = ""
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    
    Private Sub UpdateMsgStatus()
        Dim objCon2 As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
        Dim objCmd2 As New SqlCommand
        
        Try
            objCon2.Open()
            objCmd2.Connection = objCon2
            objCmd2.CommandText = "UPDATE tblPayam SET STATUS=1 WHERE ID=" & Request.QueryString("ID")
            objCmd2.ExecuteNonQuery()
            objCon2.Close()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table>
        <tr>
            <td align="right">
                ارسال کننده :</td>
            <td style="text-align: right">
                &nbsp; &nbsp;
                <asp:Label ID="lblSender" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right">
                نام :</td>
            <td style="text-align: right">
                &nbsp; &nbsp;
                <asp:Label ID="lblName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right">
                ادرس ایمیل :</td>
            <td style="text-align: right">
                &nbsp; &nbsp;
                <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right">
                تاریخ ارسال :</td>
            <td style="text-align: right">
                &nbsp; &nbsp;
                <asp:Label ID="lblTarikh" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right">
                شماره ملک :</td>
            <td style="text-align: right">
                &nbsp; &nbsp;
                <a href=showDetails.aspx?ID=<%=lblmelkid.text %>>
                    <asp:Label ID="lblMelkID" runat="server"></asp:Label>
                </a>
                </td>
        </tr>
        <tr>
            <td align="right">
                متن پیام :</td>
            <td style="text-align: right">
                <asp:TextBox ID="txtNote" runat="server" Height="167px" ReadOnly="True" TextMode="MultiLine"
                    Width="223px"></asp:TextBox></td>
        </tr>
    </table>
    <br />
    <%If IsGuest = False Then%>
    <hr />
    <br />
    <table>
        <tr>
            <td>
                ارسال پاسخ</td>
            <td>
                <asp:TextBox ID="txtPayam" runat="server" Height="167px" TextMode="MultiLine" Width="229px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPayam"
                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td style="width: 100px">
                <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="ارسال" Width="60px" /></td>
        </tr>
    </table>
    <%End If%>
</asp:Content>

