<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>

<script runat="server">

    Dim objCnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
    Dim objCmd As New SqlCommand

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Request.QueryString("UN") = Nothing Then
            Exit Sub
        End If
        Dim cmdText As String = "UPDATE tblUser SET Name=@Name, Family=@Family, @Tel1=Tel1, Tel2=@Tel2, AddressEmail=@AddressEmail, Active=@Active, Namayandeh=@Namayandeh WHERE Username='" & Request.QueryString("UN").ToString & "'"
        Try
            objCmd.CommandText = cmdText
            objCnn.Open()
            objCmd.Connection = objCnn
            objCmd.Parameters.AddWithValue("@Name", txtName.Text.Trim)
            objCmd.Parameters.AddWithValue("@Family", txtFamily.Text.Trim)
            objCmd.Parameters.AddWithValue("@Tel1", txtTel1.Text.Trim)
            objCmd.Parameters.AddWithValue("@Tel2", txtTel2.Text.Trim)
            objCmd.Parameters.AddWithValue("@AddressEmail", txtEmail.Text.Trim)
            objCmd.Parameters.AddWithValue("@Active", chkActive.Checked)
            objCmd.Parameters.AddWithValue("@Namayandeh", chkNamayandeh.Checked)
            objCmd.ExecuteNonQuery()
            lblErrorMsg.ForeColor = Drawing.Color.DarkGreen
            lblErrorMsg.Text = "اطلاعات با موفقیت ثبت گردید"
        Catch ex As SqlException
            lblErrorMsg.ForeColor = Drawing.Color.DarkRed
            lblErrorMsg.Text = "بعلت وقوع خطا اطلاعات ثبت نگردید"
            'Response.Write(ex.Message)
        End Try
    End Sub
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Request.QueryString("UN") = Nothing Then
            Exit Sub
        End If
        If Page.IsPostBack = False Then
            Dim cmdText As String = "SELECT * FROM tblUser WHERE Username='" & Request.QueryString("UN").ToString & "'"
            Dim objDR As SqlDataReader
            Try
                objCmd.CommandText = cmdText
                objCnn.Open()
                objCmd.Connection = objCnn
                objDR = objCmd.ExecuteReader
                If objDR.Read = True Then
                    txtName.Text = objDR("Name").ToString
                    txtFamily.Text = objDR("Family").ToString
                    txtTel1.Text = objDR("Tel1").ToString
                    txtTel2.Text = objDR("Tel2").ToString
                    txtEmail.Text = objDR("AddressEmail").ToString
                    chkNamayandeh.Checked = IIf(CBool(objDR("Namayandeh")) = True, True, False)
                    chkActive.Checked = IIf(CBool(objDR("Active")) = True, True, False)
                End If
            Catch ex As SqlException
            End Try
        End If
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td align="center">
                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <table>
                    <tr>
                        <td align="right">
                            نام :</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr style="color: #000000">
                        <td align="right">
                            نام خانوادگی :</td>
                        <td>
                            <asp:TextBox ID="txtFamily" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFamily"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right">
                            تلفن 1 :</td>
                        <td>
                            <asp:TextBox ID="txtTel1" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTel1"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right">
                            تلفن 2 :</td>
                        <td>
                            <asp:TextBox ID="txtTel2" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTel2"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;ادرس ایمیل :</td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right">
                            وضعیت نمایندگی :</td>
                        <td align="right">
                            <asp:CheckBox ID="chkNamayandeh" runat="server" Text="نماینده فعال" /></td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            وضعیت اکانت :</td>
                        <td align="right">
                            <asp:CheckBox ID="chkActive" runat="server" Text="فعال" /></td>
                        <td>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="ادرس ایمیل را به درستی وارد کنید" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                <br />
                <table>
                    <tr>
                        <td align="center" style="width: 100px">
                            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="ذخیره" Width="60px" /></td>
                        <td align="center" style="width: 100px">
                            <asp:Button ID="btnExit" runat="server" Text="بازگشت" ValidationGroup="Exit" Width="60px" PostBackUrl="~/CMS/User-Man.aspx" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

