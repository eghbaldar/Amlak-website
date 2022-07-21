<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>

<script runat="server">

</script>

<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table border="0" cellpadding="0" cellspacing="0" height="156" width="635">
        <tr>
            <td>
                <div align="center">
                    <p>
                        <a href="AddUser.aspx">
                        <img height="48" src="images/CMS-Icon/AdminsManagement.gif" width="48" /></a></p>
                    <p>
                        <a href="AddUser.aspx">افزودن عضو جدید</a></p>
                </div>
            </td>
            <td>
                <div align="center">
                    <p>
                        <a href="User-Man.aspx">
                        <img height="48" src="images/CMS-Icon/ArticleManagement.gif" width="48" /></a></p>
                    <p>
                        <a href="User-Man.aspx">مدیریت اعضا</a></p>
                </div>
            </td>
            <td>
                <div align="center">
                    <p>
                        <a href="SendMsg.aspx">
                        <img height="48" src="images/CMS-Icon/DBManagement.gif" width="48" /></a></p>
                    <p>
                        <a href="SendMsg.aspx">ارسال پیام</a></p>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div align="center">
                    <p>
                        <a href="AddMelk.aspx">
                        <img height="60" src="images/CMS-Icon/Dns.gif" width="58" /></a></p>
                    <p>
                        <a href="AddMelk.aspx">افزودن ملک</a></p>
                </div>
            </td>
            <td>
                <div align="center">
                    <p>
                        <a href="MsgList.aspx">
                        <img height="48" src="images/CMS-Icon/FormManagement.gif" width="48" /></a></p>
                    <p>
                        <a href="MsgList.aspx">لیست پیامها</a></p>
                </div>
            </td>
            <td>
                <div align="center">
                    <p>
                        <a href="AmlakList.aspx">
                        <img height="48" src="images/CMS-Icon/FAQManagement.gif" width="48" />
                        </a>
                    </p>
                    <p>
                        <a href="AmlakList.aspx">مدیریت املاک</a></p>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div align="center">
                    <p>
                        <a href="Counter.aspx">
                            <img height="48" src="images/CMS-Icon/Counter.gif" width="48" />
                        </a>
                    </p>
                    <p>
                        <a href="Counter.aspx">آمار بازدیدکنندگان</a></p>
                </div>
            </td>
            <td>
                <div align="center">
                    <p>
                        <a href="ChangePass.aspx">
                            <img height="48" src="images/CMS-Icon/ChangePass.gif" width="48" />
                        </a>
                    </p>
                    <p>
                        <a href="ChangePass.aspx">تغییر رمز</a></p>
                </div>
            </td>
            <td>
                <div align="center">
                    <p>
                        <a href="Namayandeh.aspx">
                            <img height="48" src="images/CMS-Icon/GroupsManagement.gif" width="48" />
                        </a>
                    </p>
                    <p>
                        <a href="Namayandeh.aspx">مدیریت نمایندگان</a></p>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
