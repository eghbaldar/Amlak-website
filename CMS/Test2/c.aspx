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
<table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع ملک : </span>
                        </td>
                        <td style="width:130px">
                            <asp:Label ID="lblMelkType_3" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            نوع معامله : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMoameleh_3" runat="server"></asp:Label></td>
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
                        <td style="width:130px">
                            <asp:Label ID="lblOstan_3" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            شهر : &nbsp; &nbsp; &nbsp; &nbsp; </span>
                        </td>
                        <td>
                            <asp:Label ID="lblShahr_3" runat="server"></asp:Label></td>
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
                            <asp:Label ID="lblAddress_3" runat="server"></asp:Label></td>
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
                        <td style="width:130px">
                            <asp:Label ID="lblTel1_3" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            تلفن همراه :
                            </span>
                            </td>
                        <td>
                            <asp:Label ID="lblTel2_3" runat="server"></asp:Label></td>
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
                                نوع مالکیت :
                            </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMalekiat_3" runat="server"></asp:Label>
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
                        <td>
                            <asp:Label ID="lblNama_3" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%If MelkID = 3 And MoamelehID = 1 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">قیمت متری : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceMetri_3" runat="server"></asp:Label>
                            <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: #0000cc">
                            قیمت کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceKol_3" runat="server"></asp:Label>
                            <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 3 And MoamelehID = 2 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh1_3" runat="server"></asp:Label>
                            <asp:Label ID="Label15" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: #0000cc"> اجاره ماهانه :</span>
                        </td>
                        <td>
                            <asp:Label ID="lblEjareh1_3" runat="server"></asp:Label>
                            <asp:Label ID="Label16" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        
        <%If MelkID = 3 And MoamelehID = 3 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh2_3" runat="server"></asp:Label>
                            <asp:Label ID="Label17" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 3 And MoamelehID = 4 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">اجاره ماهانه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblEjareh2_3" runat="server"></asp:Label>
                            <asp:Label ID="Label18" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
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
                            <asp:Label ID="lblTozihat1_3" runat="server"></asp:Label>
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
                            <span style="color: #0000cc">زیر بنا : </span>
                        </td>
                        <td style="width:130px">
                            <asp:Label ID="lblZirBana_3" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            طول بر : &nbsp; &nbsp;</span></td>
                        <td>
                            <asp:Label ID="lblToolBar_3" runat="server"></asp:Label>
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
                            <span style="color: #0000cc">
                            امکانات :</span></td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                        </td>
                        <td>
                            <asp:Label ID="lblEmkanat_3" runat="server"></asp:Label>
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
                            <asp:Label ID="lblTozihat2_3" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>    
    </div>
    </form>
</body>
</html>
