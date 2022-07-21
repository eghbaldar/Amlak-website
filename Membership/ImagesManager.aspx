<%@ Page Language="VB" MasterPageFile="~/Membership/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs)
    End Sub
    
    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs)
        Dim ObjCnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
        Dim cmdText As String = "SELECT *  FROM tblPic WHERE ID=" + e.Keys(0).ToString
        Dim objCmd As New SqlCommand(cmdText, ObjCnn)
        Dim objDR As SqlDataReader
        Dim FileName1 As String
        Dim FileName2 As String
        
        ObjCnn.Open()
        objDR = objCmd.ExecuteReader
        While objDR.Read
            FileName1 = Request.PhysicalApplicationPath + Right(objDR(2).ToString, objDR(2).ToString.Length - 1)
            FileName2 = Request.PhysicalApplicationPath + Right(objDR(3).ToString, objDR(3).ToString.Length - 1)
        End While
        objCmd.Dispose()
        ObjCnn.Close()

        Dim f As System.IO.File
        f.Delete(FileName1)
        f.Delete(FileName2)
        
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>" DeleteCommand="DELETE FROM [tblPic] WHERE [ID] = @original_ID"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tblPic] WHERE ([MelkID] = @MelkID) ORDER BY [ID]">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_MelkID" Type="Int32" />
            <asp:Parameter Name="original_OrginalPic" Type="String" />
            <asp:Parameter Name="original_LittlePic" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MelkID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div style="text-align: center">
        <table style="width: 100%">
            <tr align="center">
                <td style="width: 100%" align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="#" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" />
            <asp:BoundField DataField="MelkID" HeaderText="MelkID" SortExpression="MelkID" Visible="False" />
            <asp:BoundField DataField="OrginalPic" HeaderText="OrginalPic" SortExpression="OrginalPic"
                Visible="False" />
            <asp:BoundField DataField="LittlePic" HeaderText="LittlePic" SortExpression="LittlePic" Visible="False" />
            <asp:TemplateField HeaderText="تصویر">
                <ItemTemplate>
                    <a href=..<%#eval("OrginalPic").ToString.Replace("\", "/")%>>
                        <img  src=..<%#eval("LittlePic").ToString.Replace("\", "/")%>/>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" HeaderText="حذف تصویر" ShowDeleteButton="True"
                ShowHeader="True" DeleteText="حذف..." >
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        <EmptyDataTemplate>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="#FF0033"
                Text="عکسی برای این ملک ثبت نشده است"></asp:Label>
        </EmptyDataTemplate>
    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <br />
</asp:Content>

