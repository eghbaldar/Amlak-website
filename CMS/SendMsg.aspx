<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>

<script runat="server">

    Dim ObjCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cmdText As String = "INSERT INTO tblPayam(Sender, Reciver, Message, Name, AddressEmail, MelkID) VALUES(@Sender, @Reciver, @Message, @Name, @AddressEmail, @MelkID)"
        Dim objcmd As New SqlCommand(cmdText, ObjCon)
        Try
            ObjCon.Open()
            objcmd.Parameters.AddWithValue("@Sender", "Admin")
            objcmd.Parameters.AddWithValue("@Reciver", ddlUserList.SelectedItem.Text)
            objcmd.Parameters.AddWithValue("@Message", txtPayam.Text.Trim)
            objcmd.Parameters.AddWithValue("@Name", "")
            objcmd.Parameters.AddWithValue("@AddressEmail", "")
            objcmd.Parameters.AddWithValue("@MelkID", "")
            objcmd.ExecuteNonQuery()
            ObjCon.Close()
            '
            txtPayam.Text = ""
        Catch ex As Exception
            'Response.Write(ex.Message)
        End Try
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub ddlUserList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        lblName.Text = ddlUserList.SelectedItem.Value
    End Sub

    Protected Sub ddlUserList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        lblName.Text = ddlUserList.SelectedItem.Value
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table  style="text-align:right">
        <tr>
            <td>
                نام کاربری&nbsp; :</td>
            <td>
                <asp:DropDownList ID="ddlUserList" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="Username" DataValueField="FullName" Width="234px" AutoPostBack="True" OnSelectedIndexChanged="ddlUserList_SelectedIndexChanged" OnDataBound="ddlUserList_DataBound">
                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                    SelectCommand="SELECT Username, Name + ' ' + Family AS FullName FROM tblUser WHERE (Username <> 'Admin') AND (Active = 1)">
                </asp:SqlDataSource>
                &nbsp;
                &nbsp;&nbsp;
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                نام و نام خانوادگی :
            </td>
            <td>
                <asp:Label ID="lblName" runat="server"></asp:Label></td>
            <td>
            </td>
        </tr>
            <tr>
                <td>
                    متن پیام</td>
                <td>
                    <asp:TextBox ID="txtPayam" runat="server" Height="131px" TextMode="MultiLine" Width="298px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPayam"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
    </table>    
    <div style="text-align: center">
                <br />
                <table>
                    <tr>
                        <td style="width: 100px; height: 26px">
                            <asp:Button ID="btnSend" runat="server" Text="ارسال پیام" Width="70px" OnClick="btnSend_Click" />
                        </td>
                        <td style="width: 100px; height: 26px">
                            <asp:Button ID="btnCancel" runat="server" Text="بازگشت" Width="70px" OnClick="btnCancel_Click" ValidationGroup="Exit"/></td>
                    </tr>
                </table>
    </div>    
</asp:Content>

