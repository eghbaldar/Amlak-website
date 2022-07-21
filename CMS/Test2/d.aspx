<%@ Page Language="VB" AutoEventWireup="false" CodeFile="d.aspx.vb" Inherits="CMS_Test_b" %>

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
<table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            نوع ملک : </span>
                        </td>
                        <td style="width:120px">
                            <asp:Label ID="lblMelkType_4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0000cc">
                            نوع معامله :&nbsp; </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMoameleh_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            استان : </span>
                        </td>
                        <td  style="width:120px">
                            <asp:Label ID="lblOstan_4" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            شهر : &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span>
                        </td>
                        <td>
                            <asp:Label ID="lblShahr_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            آدرس کامل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblAddress_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            تلفن تابت ملک : </span>
                        </td>
                        <td  style="width:120px">
                            <asp:Label ID="lblTel1_4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0000cc">
                            تلفن همراه :</span></td>
                        <td>
                            <asp:Label ID="lblTel2_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                                نوع مالکیت :
                            </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMalekiat_4" runat="server"></asp:Label>
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
                            <span style="color: #0000cc">قیمت کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPrice_4" runat="server"></asp:Label>
                            <asp:Label ID="Label19" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            قیمت هر متر مربع : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceMetri_4" runat="server"></asp:Label>
                            <asp:Label ID="Label20" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">توضیحات قیمت : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat1_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">مساحت زمین : </span>
                        </td>
                        <td  style="width:120px">
                            <asp:Label ID="lblZirBana_4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0000cc">
                            طول بر : &nbsp;&nbsp; &nbsp; </span>
                        </td>
                        <td>
                            <asp:Label ID="lblToolBar_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">توضیحات : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat2_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>    
    </div>
    </form>
</body>
</html>
