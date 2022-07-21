<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
    Dim objCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
    Dim dst As DataSet = New DataSet()
    Dim Username As String = ""

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '
        Dim dat As SqlDataAdapter = New SqlDataAdapter("SELECT * FROM tblUser WHERE UserName=@UserName AND Password=@Password", objCon)
        dat.SelectCommand.CommandType = CommandType.Text
        dat.SelectCommand.Parameters.AddWithValue("@UserName", txtUsername.Text)
        dat.SelectCommand.Parameters.AddWithValue("@Password", txtPassword.Text)
        dat.Fill(dst, "tblUser")
        
        If dst.Tables("tblUser").Rows.Count <> 0 Then
            Dim dr As DataRow = dst.Tables("tblUser").Rows(0)
            Session.Add("IsAdmin", True)
            Session.Add("UserName", dr("Username"))
            lblErrorMsg.Text = ""
            Response.Redirect("Default.aspx")
        Else
            lblErrorMsg.Text = "نام كاربري و رمز عبور صحيح نيست"
        End If
        '
    End Sub

    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>نرم افزار مدیریت سایت</title>
</head>

<body>
<form id="form1" runat="server" defaultbutton="btnok">
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="674" height="351" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/login.jpg" style="background-image: url(../Images/loback.jpg)">
  <tr>
    <td width="292" id="TD1">&nbsp;</td>
    <td width="269" align="center"><table width="269" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="width: 239px; height: 33px" align="right">
            <asp:TextBox ID="txtUsername" runat="server" Width="136px"></asp:TextBox>
        </td>
        <td width="118" align="center" dir="rtl" style="height: 33px">
            نام کاربری :</td>
      </tr>
      <tr>
        <td style="width: 239px" align="right">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="136px"></asp:TextBox></td>
        <td align="center" dir="rtl">
            کلمه عبور :</td>
      </tr>
      <tr>
        <td style="width: 239px">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td style="width: 239px" align="center">&nbsp;<asp:Button ID="btnCancel" runat="server" Text="انصراف" Width="60px" PostBackUrl="~/Default.aspx"/></td>
        <td align="left">&nbsp;<asp:Button ID="btnOK" runat="server" Text="تایید" Width="60px" OnClick="btnOK_Click" /></td>
      </tr>
      <tr>
        <td style="width: 239px">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></td>
    <td style="width: 113px">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
