<%@ Page Language="VB" AutoEventWireup="false" CodeFile="b.aspx.vb" Inherits="CMS_Test_b" %>

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
                            <asp:Label ID="lblMelkType_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            نوع معامله : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMoameleh_2" runat="server"></asp:Label></td>
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
                            <asp:Label ID="lblOstan_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            شهر : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblShahr_2" runat="server"></asp:Label></td>
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
                            <asp:Label ID="lblAddress_2" runat="server"></asp:Label></td>
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
                            <asp:Label ID="lblTel1_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            تلفن همراه :
                            </span>
                            </td>
                        <td>
                            <asp:Label ID="lblTel2_2" runat="server"></asp:Label></td>
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
                            <asp:Label ID="lblSanad_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            وضعیت سکونت :</span></td>
                        <td>
                            <asp:Label ID="lblSokounat_2" runat="server"></asp:Label></td>
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
                            <asp:Label ID="lblMalekiat_2" runat="server"></asp:Label>
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
                            تعداد خواب : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblKhab_2" runat="server"></asp:Label>
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
                            <asp:Label ID="lblNama_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            &nbsp;&nbsp; سرویس بهداشتی : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblWC_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%If MelkID = 2 And MoamelehID = 1 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">قیمت متری :&nbsp;</span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceMetri_2" runat="server"></asp:Label>&nbsp;
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            قیمت کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceKol_2" runat="server"></asp:Label>&nbsp;
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 2 And MoamelehID = 2 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh1_2" runat="server"></asp:Label>
                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc"> اجاره ماهانه :</span></td>
                        <td>
                            <asp:Label ID="lblEjareh1_2" runat="server"></asp:Label>
                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        
        <%If MelkID = 2 And MoamelehID = 3 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh2_2" runat="server"></asp:Label>
                            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 2 And MoamelehID = 4 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">اجاره ماهانه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblEjareh2_2" runat="server"></asp:Label>
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
                            <asp:Label ID="lblTozihat1_2" runat="server"></asp:Label>
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
                            <asp:Label ID="lblMofid_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            مشاء : </span>
                        </td>
                        <td style="width:70px">
                            <asp:Label ID="lblMosha_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblKol_2" runat="server"></asp:Label></td>
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
                            <asp:Label ID="lblEmkanat_2" runat="server"></asp:Label>
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
                            <asp:Label ID="lblTozihat2_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>    
    </div>
    </form>
</body>
</html>
