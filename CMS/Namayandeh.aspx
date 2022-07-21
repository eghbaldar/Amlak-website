<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>

<script runat="server">

    Private Function Convert2Str(ByVal Value As Boolean, ByVal Param As Byte) As String
        Dim Result As String = ""
        
        Select Case Param
            Case 1
                Result = IIf(Value = True, "نماینده فعال", "------")
            Case 2
                Result = IIf(Value = True, "فعال", "غیر فعال")
            Case 3
        End Select
        
        Return Result
    End Function
    
    Private Function ConvDate(ByVal d As DateTime) As String
        Dim a As New ShamsiDate
        Return a.Miladi2Shamsi(d, ShamsiDate.ShowType.ShortDate)
    End Function
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username"
        DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333">
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="نام کاربری" ReadOnly="True" SortExpression="Username" />
            <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="Family">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("Name") & " " & Eval("Family")%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AddressEmail" HeaderText="ادرس ایمیل" SortExpression="AddressEmail" Visible="False" />
            <asp:TemplateField HeaderText="وضعیت اکانت" SortExpression="Active">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Convert2Str(Eval("Active"), 2)%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="وضعیت نمایندگی" SortExpression="Namayandeh">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Convert2Str(Eval("Namayandeh"), 1)%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="تاریخ عضویت" SortExpression="OzviatDate">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#ConvDate(Eval("OzviatDate"))%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" DeleteText="حذف" HeaderText="حذف رکورد" ShowDeleteButton="True">
                <ControlStyle Width="60px" />
            </asp:CommandField>
            <asp:HyperLinkField DataNavigateUrlFields="Username" DataNavigateUrlFormatString="EditUser.aspx?un={0}"
                HeaderText="اصلاح مشخصات" Text="اصلاح..." />
            <asp:HyperLinkField DataNavigateUrlFields="Username" DataNavigateUrlFormatString="SendMsg2User.aspx?ID={0}"
                HeaderText="ارسال پیام" Text="پیام..." />
            <asp:HyperLinkField DataNavigateUrlFields="Username" DataNavigateUrlFormatString="MelkByNUser.aspx?us={0}"
                HeaderText="مشاهده املاک" Text="مشاهده..." />

        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
        DeleteCommand="DELETE FROM [tblUser] WHERE [Username] = @Username"
        SelectCommand="SELECT Username, Name, Family, AddressEmail, Namayandeh, OzviatDate, Active FROM tblUser WHERE (Namayandeh = 1) ORDER BY OzviatDate DESC"
        UpdateCommand="UPDATE [tblUser] SET [Name] = @Name, [Family] = @Family, [AddressEmail] = @AddressEmail, [Namayandeh] = @Namayandeh, [OzviatDate] = @OzviatDate, [Active] = @Active WHERE [Username] = @Username">
        <DeleteParameters>
            <asp:Parameter Name="Username" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Family" Type="String" />
            <asp:Parameter Name="AddressEmail" Type="String" />
            <asp:Parameter Name="Namayandeh" Type="Boolean" />
            <asp:Parameter Name="OzviatDate" Type="DateTime" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Username" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

