<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master" %>

<script runat="server">

    Dim a As New UtilityFunction
    
    Private Function ConvertDate(ByVal d As DateTime)
        Dim FarsiDate As New ShamsiDate
        Return FarsiDate.Miladi2Shamsi(d, ShamsiDate.ShowType.ShortDate)
    End Function
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table style="width: 100%">
        <tr>
            <td align="right">
                <span style="font-size: 11pt"><a href="namayandeh.aspx">
                بازگشت به صفحه مدیریت اعضا </a>
                </span>
            </td>
        </tr>
    </table>
    
    <br />
    <center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1"
            ForeColor="#333333">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="کد ملک" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="MelkType" HeaderText="نوع ملک" SortExpression="MelkType" />
                <asp:TemplateField HeaderText="نوع معامله" SortExpression="MoamelehID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"><%#a.MoamelehType(Eval("MoamelehID"))%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ ثبت" SortExpression="TarikhSabt">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"><%#ConvertDate(Eval("TarikhSabt"))%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ActiveMelk.aspx?ID={0}"
                    DataTextField="Visable" HeaderText="وضعیت ملک" />
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="DeleteRecord.aspx?ID={0}"
                    HeaderText="حذف رکورد" Text="حذف..." Visible="False" />
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ShowDetails.aspx?ID={0}"
                    HeaderText="مشاهده جزئیات" Text="مشاهده..." />
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ImagesManager.aspx?ID={0}"
                    HeaderText="ویرایش عکس ها" Text="عکس..." />
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="mStatus.aspx?ID={0}"
                    DataTextField="Moameleh_Status" HeaderText="وضعیت معامله" />
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="EditData.aspx?ID={0}"
                    HeaderText="ویرایش اطلاعات" Text="ویرایش..." />
                <asp:CommandField ButtonType="Button" DeleteText="حذف..." HeaderText="حذف رکورد"
                    ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EmptyDataTemplate>
                <span style="font-size: 14pt; color: #ff0033">هیچ ملکی در سایت ثبت نشده است</span>
            </EmptyDataTemplate>
        </asp:GridView>
        &nbsp;&nbsp;</center>
    <center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
        SelectCommand="SELECT * FROM [V_AllMelk] WHERE ([Username] = @Username) ORDER BY [ID] DESC" DeleteCommand="delete from tblmelk where id=@id; delete from tblpic where melkid=@id">
        <SelectParameters>
            <asp:QueryStringParameter Name="Username" QueryStringField="us" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
        </DeleteParameters>
    </asp:SqlDataSource>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <center>
    </center>
</asp:Content>

