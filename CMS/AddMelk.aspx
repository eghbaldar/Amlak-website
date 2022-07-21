<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table  style="width:50%; height: 300px">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Admin/TN_psd1201.JPG" /><br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CMS/AddApar.aspx">آپارتمان</asp:HyperLink>
            </td>
            <td>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/Admin/TN_psd1203.JPG" /><br />
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CMS/AddVila.aspx">ویلا</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/Admin/TN_psd1209.JPG" /><br />
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/CMS/AddMagh.aspx">مغازه</asp:HyperLink>
            </td>
            <td>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Admin/TN_psd1210.JPG" /><br />
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/CMS/AddZamin.aspx">زمین</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

