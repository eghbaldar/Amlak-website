
Partial Class Default2
    Inherits System.Web.UI.Page

    Private Sub SetAttributes(ByVal Sender As Object)
        Sender.Attributes("Lang") = "Fa"
        Sender.Attributes("onkeypress") = "return CheckUnicode();"
        Sender.Attributes("dir") = "rtl"
        Sender.Attributes("onkeydown") = "return KeyDown();"
        Sender.Attributes("onblur") = "ClearStatus();"
        Sender.Attributes("onkeyup") = "return KeyUp();"
        Sender.Attributes("onfocus") = "return ShowLangStatus();"
    End Sub

    'Private Sub GetControls(ByVal parentControl As Control)
    '    For Each ctl As Control In parentControl.Controls
    '        If (ctl.HasControls) Then
    '            GetControls(ctl)
    '        ElseIf (ctl.GetType Is GetType(TextBox)) Then
    '            'DirectCast(ctl, TextBox).BackColor = Drawing.Color.Yellow
    '            CType(ctl, TextBox).BackColor = Drawing.Color.Yellow
    '        End If
    '    Next
    'End Sub

    Private Sub FarsiSaz(ByVal parentControl As Control)
        For Each ctl As Control In parentControl.Controls
            If (ctl.HasControls) Then
                FarsiSaz(ctl)
            ElseIf (ctl.GetType Is GetType(TextBox)) Then
                SetAttributes(CType(ctl, TextBox))
                'CType(ctl, TextBox).BackColor = Drawing.Color.Yellow
            End If
        Next
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FarsiSaz(Me)
    End Sub
End Class
