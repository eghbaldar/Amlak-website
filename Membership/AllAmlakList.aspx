<%@ Page Language="VB" MasterPageFile="~/Membership/MasterPage.master"%>

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
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" DataKeyNames="ID">
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
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ShowDetails.aspx?ID={0}"
                HeaderText="مشاهده جزئیات" Text="مشاهده..." />
            
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
        SelectCommand="SELECT * FROM V_SabtShodeh ORDER BY TarikhSabt DESC" DeleteCommand="delete from tblmelk where id=@id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
        </DeleteParameters>
    </asp:SqlDataSource>
    </center>
    <br />
</asp:Content>

