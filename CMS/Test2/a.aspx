<%@ Page Language="VB" AutoEventWireup="false" CodeFile="a.aspx.vb" Inherits="CMS_Test_a" %>

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
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع ملک : </span>
                        </td>
                        <td style="width:137px">
                            <asp:Label ID="lblMelkType" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            نوع معامله : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMoameleh" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            استان : </span>
                        </td>
                        <td style="width:170px">
                            <asp:Label ID="lblOstan" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            شهر : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblShahr" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            آدرس کامل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            تلفن تابت ملک : </span>
                        </td>
                        <td style="width:135px">
                            <asp:Label ID="lblTel1" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            تلفن همراه :
                            </span>
                            </td>
                        <td>
                            <asp:Label ID="lblTel2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع کاربری : </span>
                        </td>
                        <td style="width:111px">
                            <asp:Label ID="lblSanad" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            وضعیت سکونت :</span></td>
                        <td>
                            <asp:Label ID="lblSokounat" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                                نوع مالکیت :
                            </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMalekiat" runat="server"></asp:Label>
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
                            <span style="color: #0000cc">
                            تعداد طبقات : </span>
                        </td>
                        <td style="width:140px">
                            <asp:Label ID="lblTabagheh" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            تعداد واحد : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVahed" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                                واحد مورد نظر :
                            </span>
                        </td>
                        <td style="width:134px">
                            <asp:Label ID="lblVahedForoosh" runat="server"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0000cc">
                            تعداد خواب : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblKhab" runat="server"></asp:Label>
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
                            <span style="color: #0000cc">
                            نوع نما : </span>
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="lblNama" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            &nbsp;&nbsp; سرویس بهداشتی : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblWC" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%If MelkID = 1 And MoamelehID = 1 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">قیمت متری :&nbsp;</span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceMetri" runat="server"></asp:Label>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            قیمت کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceKol" runat="server"></asp:Label>
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 1 And MoamelehID = 2 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh1" runat="server"></asp:Label>
                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc"> اجاره ماهانه :</span></td>
                        <td>
                            <asp:Label ID="lblEjareh1" runat="server"></asp:Label>
                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        
        <%If MelkID = 1 And MoamelehID = 3 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh2" runat="server"></asp:Label>
                            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 1 And MoamelehID = 4 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">اجاره ماهانه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblEjareh2" runat="server"></asp:Label>
                            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">توضیحات قیمت :</span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat1" runat="server"></asp:Label>
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
                            <span style="color: #0000cc">
                            متراژ &nbsp; &nbsp; &nbsp;&nbsp; مفید : </span>
                        </td>
                        <td style="width:60px">
                            <asp:Label ID="lblMofid" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            مشاء : </span>
                        </td>
                        <td style="width:70px">
                            <asp:Label ID="lblMosha" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblKol" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            امکانات :</span></td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                        </td>
                        <td>
                            <asp:Label ID="lblEmkanat" runat="server"></asp:Label>
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
                            <span style="color: #0000cc">توضیحات : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>    
    </div>
    </form>
</body>
</html>
