﻿<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master"%>
 
<script runat="server">

    Dim Amar
    'تعداد بازدید کنندگان امروز
    Dim StrSql1 As String = "SELECT COUNT(ID) AS Expr1 FROM tblCounter WHERE Tarikh='" & Today.ToShortDateString & "'"
    'تعداد بازدید کنندگان 3 روز اخیر
    Dim StrSql2 As String = "SELECT COUNT(ID) AS Expr1 FROM tblCounter WHERE Tarikh BETWEEN '" & Today.AddDays(-3).ToShortDateString & "' AND '" & Today.ToShortDateString & "'"
    'تعداد بازدیدکنندگان ماه جاری
    Dim StrSql3 As String = "SELECT COUNT(ID) AS Expr1 FROM tblCounter WHERE Tarikh BETWEEN '" & Today.Year & "/" & Today.Month & "/01" & "' AND '" & Today.ToShortDateString & "'"
    'تعداد بازدیدکنندگان 3 ماه اخیر
    Dim StrSql4 As String = "SELECT COUNT(ID) AS Expr1 FROM tblCounter WHERE Tarikh BETWEEN '" & Today.AddMonths(-3).ToShortDateString & "' AND '" & Today.ToShortDateString & "'"
    'تعداد بازدیدکنندگان سال جاری
    Dim StrSql5 As String = "SELECT COUNT(ID) AS Expr1 FROM tblCounter WHERE Tarikh BETWEEN '" & Today.Year & "/01/01' AND '" & Today.ToShortDateString & "'"
    'تعداد کل بازدیدکنندگان
    Dim StrSql6 As String = "SELECT COUNT(ID) AS Expr1 FROM tblCounter"
    
    Private Function Conv(ByVal d As Date) As String
        Dim FarsiDate As New ShamsiDate
        Return FarsiDate.Miladi2Shamsi(d, ShamsiDate.ShowType.LongDate)
    End Function

    Private Function ExcuteQ(ByVal Sql As String) As Object
        Dim Result
        Try
            Dim objConnection As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString())
            objConnection.Open()
            Dim objSqlCmd As SqlCommand = New SqlCommand()
            objSqlCmd.Connection = objConnection
            objSqlCmd.CommandText = Sql
            Result = objSqlCmd.ExecuteScalar
            Return Result
            objConnection.Close()
            objConnection = Nothing
            objSqlCmd.Dispose()
            objSqlCmd = Nothing
        Catch ex As Exception
            Response.Write(ex.Message)
            Return -1
        End Try
    End Function
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div style="text-align: center">
        <table dir="rtl" style="border-right: black thin ridge; table-layout: fixed; border-top: black thin ridge;
            font-size: 11pt; border-left: black thin ridge; width: 100%; border-bottom: black thin ridge;
            border-collapse: separate; height: 104px">
            <tr>
                <td align="left" style="width: 100px; font-weight: bold; color: black;">
                    <span style="font-size: 10pt">
                    بازدید امروز :</span></td>
                <td style="width: 100px; font-weight: bold; color: black;">
                    <%=ExcuteQ(StrSql1)%>
                </td>
                <td align="left" style="width: 113px">
                    <span style="font-size: 10pt">
                    بازدید 3 روز گذشته :</span></td>
                <td style="width: 100px">
                    <%=ExcuteQ(StrSql2)%>
                </td>
                <td align="left" style="width: 127px">
                    <span style="font-size: 10pt">بازدید ماه جاری :</span></td>
                <td style="width: 100px">
                    <%=ExcuteQ(StrSql3)%>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 100px">
                    <span style="font-size: 10pt">
                    بازدید 3 ماه اخیر :</span></td>
                <td style="width: 100px">
                    <%=ExcuteQ(StrSql4)%>
                </td>
                <td align="left" style="width: 113px">
                    <span style="font-size: 10pt">
                    بازدید سال جاری :</span></td>
                <td style="width: 100px">
                    <%=ExcuteQ(StrSql5)%>
                </td>
                <td align="left" style="width: 127px; font-weight: bold; color: #ff0066;">
                    <span style="font-size: 8pt">
                    کل تعداد بازدید کنندگان :</span></td>
                <td style="width: 100px; font-weight: bold; color: #ff0066;">
                    <%=ExcuteQ(StrSql6)%>
                </td>
            </tr>
        </table>
    </div>
    <br />

    <div style="text-align: center">
        <table dir="rtl" style="font-size: 9pt; vertical-align: top; width: 100%; text-align: center">
            <tr>
                <td style="vertical-align: top; width: 100px; text-align: center;">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Tarikh" DataSourceID="SqlDataSource1"
                        CssClass="tablecloth-theme"
                        PageSize="20" Width="344px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle CssClass="alt-data-row" BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="تاریخ">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text=""><%#Conv(Eval("Tarikh"))%></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>                        
                            <asp:BoundField DataField="Expr1" HeaderText="تعداد بازدیدکنندگان" ReadOnly="True" SortExpression="Expr1" />
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" HeaderText="مشاهده جزئیات" SelectText="جزئیات..." />
                        </Columns>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#E3EAEB" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                        SelectCommand="SELECT Tarikh, COUNT(ID) AS Expr1 FROM tblCounter GROUP BY Tarikh ORDER BY Tarikh DESC" ProviderName="<%$ ConnectionStrings:AmlakConnectionString.ProviderName %>"></asp:SqlDataSource>
                </td>
                <td style="vertical-align: top; width: 100px">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="tablecloth-theme"
                        DataSourceID="SqlDataSource2" Width="320px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle CssClass="alt-data-row" BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IP" HeaderText="شماره IP" SortExpression="IP" />
                            <asp:BoundField DataField="URL" HeaderText="نشانی اینترنتی" SortExpression="URL" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                        SelectCommand="SELECT IP, URL FROM tblCounter WHERE (Tarikh = @Tarikh) ORDER BY ID DESC" ProviderName="<%$ ConnectionStrings:AmlakConnectionString.ProviderName %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="Tarikh" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>         
    <br />
    &nbsp;
</asp:Content>

