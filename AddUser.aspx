<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim objCnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
        Dim objCmd As New SqlCommand
        Dim cmdText As String = "INSERT INTO tblUser(Name, Family, Tel1, Tel2, AddressEmail, Username, Password, Role, Namayandeh, OzviatDate) VALUES(@Name, @Family, @Tel1, @Tel2, @AddressEmail, @Username, @Password, @Role, @Namayandeh, @OzviatDate)"

        Try
            lblErrorMsg.Visible = False
            objCmd.CommandText = cmdText
            objCnn.Open()
            objCmd.Connection = objCnn
            objCmd.Parameters.AddWithValue("@Name", txtName.Text.Trim)
            objCmd.Parameters.AddWithValue("@Family", txtFamily.Text.Trim)
            objCmd.Parameters.AddWithValue("@Tel1", txtTel1.Text.Trim)
            objCmd.Parameters.AddWithValue("@Tel2", txtTel2.Text.Trim)
            objCmd.Parameters.AddWithValue("@AddressEmail", txtEmail.Text.Trim)
            objCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim)
            objCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim)
            objCmd.Parameters.AddWithValue("@Role", 0)
            objCmd.Parameters.AddWithValue("Namayandeh", 0)
            objCmd.Parameters.AddWithValue("@OzviatDate", Today.ToShortDateString)
            
            objCmd.ExecuteNonQuery()
            Call ClearForm()
            MultiView1.ActiveViewIndex = 1
        Catch ex As SqlException
            If ex.Number = 2627 Then
                lblErrorMsg.Visible = True
            End If
            'Response.Write(ex.Message)
        End Try
    End Sub
    
    Private Sub ClearForm()
        txtName.Text = ""
        txtFamily.Text = ""
        txtTel1.Text = ""
        txtTel2.Text = ""
        txtEmail.Text = ""
        txtUsername.Text = ""
        txtPassword.Text = ""
        txtConfirm.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        MultiView1.ActiveViewIndex = 0
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
    <center>
    <table>
        <tr>
            <td align="center">
                <asp:Label ID="lblErrorMsg" runat="server" Text="نام کاربری تکراری می باشد. دوباره تکرار کنید" ForeColor="Red" Visible="False"></asp:Label>
                <br />
                <br />
<table>
        <tr>
            <td align="right">
                نام :</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                نام خانوادگی :</td>
            <td>
                <asp:TextBox ID="txtFamily" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtFamily"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                تلفن 1 :</td>
            <td>
                <asp:TextBox ID="txtTel1" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtTel1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                تلفن 2 :</td>
            <td>
                <asp:TextBox ID="txtTel2" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtTel2"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;ادرس ایمیل :</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                نام کاربری :</td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtUsername"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                کلمه عبور :</td>
            <td align="right">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="149px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                تکرار کلمه عبور :</td>
            <td align="right">
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="149px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtConfirm"></asp:RequiredFieldValidator></td>
        </tr>
    </table>          
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="ادرس ایمیل را به درستی وارد کنید" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtConfirm"
                    ControlToValidate="txtPassword" ErrorMessage="کلمه عبور و تکرار ان یکی نیست"></asp:CompareValidator><br />
    <table>
        <tr>
            <td align="center" style="width: 100px">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="ذخیره" Width="60px" /></td>
            <td align="center" style="width: 100px">
                <asp:Button ID="btnExit" runat="server" Text="بازگشت" Width="60px" ValidationGroup="Exit" /></td>
        </tr>
    </table>  
            </td>
        </tr>
    </table>
    </center>
            <br />
        </asp:View>
        <asp:View ID="View2" runat="server">
        
            <span style="font-family: Tahoma; font-size: 11pt;">
                <div style="text-align: center">
                    <table style="width: 100%; height: 100%">
                        <tr>
                            <td>
                                <br />
                                <br />
                                <span style="color: #006600">
                                اکانت شما با موفقیت ساخته شد اما غیر فعال
                می باشد<br />
                &nbsp;پس از 24 ساعت می توانید از امکانات سایت استفاده کنید<br />
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
            </span></asp:View>
    </asp:MultiView>
</asp:Content>

