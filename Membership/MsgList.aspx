<%@ Page Language="VB" MasterPageFile="~/Membership/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    Dim FarsiDate As New ShamsiDate

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        SqlDataSource1.DataBind()
        GridView1.DataBind()
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <br />
    &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" Width="542px">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="#" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" />
            <asp:BoundField DataField="Sender" HeaderText="Sender" SortExpression="Sender" Visible="False" />
            <asp:TemplateField HeaderText="ارسال کننده" SortExpression="Sender">
                <ItemTemplate>
                    <asp:Label ID="lblSender" runat="server" Text='<%# iif(Eval("Sender")="Guest","کاربر مهمان" ,Eval("Sender"))%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Reciver" HeaderText="Reciver" SortExpression="Reciver"
                Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" Visible="False" />
            <asp:BoundField DataField="AddressEmail" HeaderText="AddressEmail" SortExpression="AddressEmail"
                Visible="False" />
            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message"
                Visible="False" />
            <asp:TemplateField HeaderText="وضعیت" SortExpression="Status">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# iif(Eval("Status")="False","خوانده نشده" ,"خوانده شده") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" Visible="False" />
            <asp:BoundField DataField="MelkID" HeaderText="MelkID" SortExpression="MelkID" Visible="False" />

            <asp:TemplateField HeaderText="تاریخ ارسال" SortExpression="Tarikh">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#FarsiDate.Miladi2Shamsi(Eval("Tarikh"),ShamsiDate.ShowType.ShortDate )%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ShowMsg.aspx?ID={0}"
                HeaderText="مشاهده پیام" Text="مشاهده..." />
            <asp:CommandField ButtonType="Button" DeleteText="حذف..." HeaderText="حذف رکورد"
                ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <EditRowStyle BackColor="#7C6F57" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        <EmptyDataTemplate>
            <span style="font-size: 16pt; color: #ff0033"><strong>پیغامی برای شما وجود ندارد</strong></span>
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
        SelectCommand="SELECT * FROM [tblPayam] WHERE ([Reciver] = @Reciver) ORDER BY [Status]" DeleteCommand="DELETE FROM [tblPayam] WHERE [ID] = @ID">
        <SelectParameters>
            <asp:SessionParameter Name="Reciver" SessionField="UserName" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
        </DeleteParameters>
    </asp:SqlDataSource>
    </center>
    <br /><br /><br />

        
</asp:Content>

