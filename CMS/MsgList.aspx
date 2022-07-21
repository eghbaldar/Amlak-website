<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>

<script runat="server">

    Dim FarsiDate As New ShamsiDate

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        GridView1.DataBind()
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" Width="612px">
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
            <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
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
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
        SelectCommand="SELECT * FROM [tblPayam] WHERE ([Reciver] = @Reciver) ORDER BY [Status] DESC" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tblPayam] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [tblPayam] ([Sender], [Reciver], [Name], [AddressEmail], [Message], [Status], [MelkID], [Tarikh]) VALUES (@Sender, @Reciver, @Name, @AddressEmail, @Message, @Status, @MelkID, @Tarikh)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tblPayam] SET [Sender] = @Sender, [Reciver] = @Reciver, [Name] = @Name, [AddressEmail] = @AddressEmail, [Message] = @Message, [Status] = @Status, [MelkID] = @MelkID, [Tarikh] = @Tarikh WHERE [ID] = @original_ID AND [Sender] = @original_Sender AND [Reciver] = @original_Reciver AND [Name] = @original_Name AND [AddressEmail] = @original_AddressEmail AND [Message] = @original_Message AND [Status] = @original_Status AND [MelkID] = @original_MelkID AND [Tarikh] = @original_Tarikh">
        <SelectParameters>
            <asp:SessionParameter Name="Reciver" SessionField="UserName" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Sender" Type="String" />
            <asp:Parameter Name="Reciver" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="AddressEmail" Type="String" />
            <asp:Parameter Name="Message" Type="String" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="MelkID" Type="Int32" />
            <asp:Parameter Name="Tarikh" Type="DateTime" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Sender" Type="String" />
            <asp:Parameter Name="original_Reciver" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_AddressEmail" Type="String" />
            <asp:Parameter Name="original_Message" Type="String" />
            <asp:Parameter Name="original_Status" Type="Boolean" />
            <asp:Parameter Name="original_MelkID" Type="Int32" />
            <asp:Parameter Name="original_Tarikh" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Sender" Type="String" />
            <asp:Parameter Name="Reciver" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="AddressEmail" Type="String" />
            <asp:Parameter Name="Message" Type="String" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="MelkID" Type="Int32" />
            <asp:Parameter Name="Tarikh" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

