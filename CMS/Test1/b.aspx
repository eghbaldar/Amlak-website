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
<table dir="rtl">
            <tr>
                <td>
                    <asp:Label ID="lblTozihat" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="#3300CC"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="height: 48px">    
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
                                نوع کاربری :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlKarbari" runat="server" Width="111px">
                                    <asp:ListItem>مسکونی</asp:ListItem>
                                    <asp:ListItem>تجاری</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                &nbsp; &nbsp; &nbsp; &nbsp; وضعیت سکونت :</td>
                            <td>
                                <asp:DropDownList ID="ddlSokunat" runat="server" Width="111px">
                                    <asp:ListItem>مالک</asp:ListItem>
                                    <asp:ListItem>مستاجر</asp:ListItem>
                                    <asp:ListItem>تخلیه</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
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
                            <td>
                            </td>
                            <td>
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
                                تلفن ثابت ملک :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel1" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTel1"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                تلفن همراه :
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
                                تعداد خواب :
                            </td>
                            <td>
                                <asp:TextBox ID="txtKhab" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtKhab"
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
                                نما :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlNama" runat="server" Width="111px" DataSourceID="SqlDS_Nama" DataTextField="NamaType" DataValueField="ID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDS_Nama" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                                    SelectCommand="SELECT * FROM [tblNamaType] ORDER BY [ID]"></asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp; &nbsp;
                                سرویس بهداشتی :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlWC" runat="server" Width="111px">
                                    <asp:ListItem>ایرانی</asp:ListItem>
                                    <asp:ListItem>ایرانی فرنگی</asp:ListItem>
                                    <asp:ListItem>فرنگی</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td style="width:100px">
                                قیمت متری :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceMetri" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label><span
                                    style="color: #cc0033"></span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPriceMetri"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; قیمت کل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceKol" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPriceKol"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                    
                    
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel2" runat="server">
                    <table>
                <tr>
                    <td style="width:100px">
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh1" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtVadieh1"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>
                        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh1" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtEjareh1"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>           
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel3" runat="server">
                    <table>
                <tr>
                    <td style="width:100px">
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtVadieh2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>                    
                    </asp:Panel>         
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel4" runat="server">
                    <table>
                <tr>
                    <td style="width:100px">
                        اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="txtEjareh2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>             
                </td>
            </tr>
    <tr>
        <td>
            <table>
                        <tr>
                            <td style="width:100px">
                                توضیحات قیمت :
                            </td>
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
                                <span style="color: #0000cc">متراژ &nbsp; &nbsp; &nbsp; </span></td>
                            <td>
                                &nbsp;&nbsp;
                                مفید :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMofid" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtMofid"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                                مشاء :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMosha" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtMosha"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                کل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtKol" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtKol"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="color: #3300cc"><span style="color: #0000cc">
                        <br />
                    امکانات</span><br />
                    </span>
                    <br />
                        <asp:CheckBoxList ID="EmkanatList" runat="server" Height="31px" RepeatColumns="6"
                            RepeatDirection="Horizontal" Width="527px">
                            <asp:ListItem>اشپزخانه Open</asp:ListItem>
                            <asp:ListItem>آب</asp:ListItem>
                            <asp:ListItem>برق</asp:ListItem>
                            <asp:ListItem>گاز</asp:ListItem>
                            <asp:ListItem>تلفن</asp:ListItem>
                            <asp:ListItem>پکیج</asp:ListItem>
                            <asp:ListItem>شوفاژ</asp:ListItem>
                            <asp:ListItem>اسپیلت</asp:ListItem>
                            <asp:ListItem>شومینه</asp:ListItem>
                            <asp:ListItem>انباری</asp:ListItem>
                            <asp:ListItem>پارکینگ</asp:ListItem>
                            <asp:ListItem>آسانسور</asp:ListItem>
                            <asp:ListItem>در کنترلی</asp:ListItem>
                        </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td>
                    <br />
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
