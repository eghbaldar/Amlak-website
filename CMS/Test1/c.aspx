<%@ Page Language="VB" AutoEventWireup="false" CodeFile="c.aspx.vb" Inherits="CMS_Test_b" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
    <form id="form1" runat="server">
    <div dir="rtl">
<table dir="rtl">
            <tr>
                <td>
                    <asp:Label ID="lblTozihat" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="#3300CC"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>    
                    <table>
                        <tr>
                            <td style="width:100px">
                                آدرس کامل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" Width="373px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
    <tr>
        <td>
                    <table>
                        <tr>
                            <td style="width:100px">
                                نوع مالکیت :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMalekiat" runat="server" Width="111px">
                                    <asp:ListItem>سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی نسق</asp:ListItem>
                                    <asp:ListItem>نسق</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
        </td>
    </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                        </tr>
                        <tr>
                            <td style="width:100px">
                                تلفن ثابت ملک :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel1" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTel1"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td style="color: #000000">
                                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; تلفن همراه :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel2" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTel2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td style="width:100px">
                        قیمت متری :</td>
                    <td>
                        <asp:TextBox ID="txtPriceMetri" runat="server" Width="60px"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPriceMetri"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>
                        &nbsp; &nbsp; &nbsp;&nbsp;
                        قیمت کل :</td>
                    <td>
                        <asp:TextBox ID="txtPriceKol" runat="server" Width="60px"></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPriceKol"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                            
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td style="width:100px">
                        توضیحات :</td>
                    <td>
                        <asp:TextBox ID="txtTozihat1" runat="server" Width="390px"></asp:TextBox>
                        </td>
                </tr>
            </table>
        
        </td>
    </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <span style="color: #0000cc">متراژ &nbsp; : &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; </span></td>
                            <td>
                                مساحت زمین :
                            </td>
                            <td>
                                <asp:TextBox ID="txtzirBana" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtzirBana"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</td>
                            <td style="color: #000000">
                                &nbsp;&nbsp; طول بر :
                            </td>
                            <td>
                                <asp:TextBox ID="txtToolBar" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtToolBar"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td style="width:100px">
                                توضیحات :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTozihat2" runat="server" Width="390px"></asp:TextBox>
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>    
    </div>
    </form>
</body>
</html>
