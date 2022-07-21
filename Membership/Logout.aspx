<%@ Page Language="VB" MasterPageFile="~/Membership/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("UserName") = Nothing
        Response.Redirect("../Default.aspx")
    End Sub
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

