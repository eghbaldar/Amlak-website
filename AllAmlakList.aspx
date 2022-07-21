<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    Dim a As New UtilityFunction
    
    Private Function ConvertDate(ByVal d As DateTime)
        Dim FarsiDate As New ShamsiDate
        Return FarsiDate.Miladi2Shamsi(d, ShamsiDate.ShowType.ShortDate)
    End Function
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
        DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" Width="441px">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="کد ملک" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="نوع ملک" SortExpression="MelkTypeID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#a.MelkType((Eval("MelkTypeID")))%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
            
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ShowMelk.aspx?ID={0}"
                HeaderText="مشاهده جزئیات" Text="مشاهده..." />
            
        </Columns>
        <EmptyDataTemplate>
            <span style="font-size: 14pt; color: #ff0000"><strong>مشخصات هیچ نوع ملکی ثبت نشده است</strong></span>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
        SelectCommand="SELECT * FROM V_SabtShodeh ORDER BY TarikhSabt DESC">
    </asp:SqlDataSource>
    </center>
</asp:Content>

