<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
<style type="text/css">
        <!--
            a:link {
	            text-decoration: none;
            }
            a:visited {
	            text-decoration: none;
            }
            a:hover {
	            text-decoration: none;
				color:#0033CC;
            }
            a:active {
	            text-decoration: none;
            }
        -->
body {
        font-family: Tahoma;
        margin: 0;
        font-size: 10pt;
        background: #FFF;
        }                     
    </style>    
</head>
<body>
    <SCRIPT language=javascript src="../Script/Farsi.js"></SCRIPT>    
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
            SelectCommand="SELECT * FROM [tblManategh]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />&nbsp;<br />
        <br />
        <INPUT lang=Fa onkeypress="return CheckUnicode();" 
            dir=rtl onkeydown="return KeyDown();" onblur="ClearStatus();"
            onkeyup="return KeyUp();" onfocus="return ShowLangStatus();"
        >
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></div>
    </form>
</body>
</html>
