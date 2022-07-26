Imports Microsoft.VisualBasic

Public Class UtilityFunction

    Public Function MelkType(ByVal ID As Byte) As String
        Dim Temp As String = ""
        Select Case ID
            Case 1
                Temp = "آپارتمان"
            Case 2
                Temp = "ویلا"
            Case 3
                Temp = "مغازه"
            Case 4
                Temp = "زمین"
        End Select
        '
        Return Temp
    End Function

    Public Function MoamelehType(ByVal ID As Byte) As String
        Dim Temp As String = ""
        Select Case ID
            Case 1
                Temp = "فروش"
            Case 2
                Temp = "رهن و اجاره"
            Case 3
                Temp = "رهن"
            Case 4
                Temp = "اجاره"
        End Select
        '
        Return Temp
    End Function

    Public Function SanadType(ByVal ID As Byte) As String
        Dim Temp As String = ""
        Select Case ID
            Case 0
                Temp = "مسکونی"
            Case 1
                Temp = "اداری"
            Case 2
                Temp = "تجاری"
            Case 3
                Temp = "موقعیت اداری"
        End Select
        '
        Return Temp
    End Function

    Public Function SokunatType(ByVal ID As Byte) As String
        Dim Temp As String = ""
        Select Case ID
            Case 0
                Temp = "مالک"
            Case 1
                Temp = "مستاجر"
            Case 2
                Temp = "تخلیه"
        End Select
        '
        Return Temp
    End Function

    Public Function WCType(ByVal ID As Byte) As String
        Dim Temp As String = ""
        Select Case ID
            Case 0
                Temp = "ایرانی"
            Case 1
                Temp = "ایرانی فرنگی"
            Case 2
                Temp = "فرنگی"
        End Select
        '
        Return Temp
    End Function

    Public Function NamaType(ByVal ID As Byte) As String
        Dim Temp As String = ""
        Select Case ID
            Case 0
                Temp = "-"
            Case 1
                Temp = "آجر"
            Case 2
                Temp = "رفلکس"
            Case 3
                Temp = "سنگ"
            Case 4
                Temp = "سنگ و شیشه"
            Case 5
                Temp = "سیمان"
            Case 6
                Temp = "سرامیک"
            Case 7
                Temp = "سرامیک و شیشه"
            Case 8
                Temp = "شیشه"
            Case 9
                Temp = "کنیتکس"
            Case 10
                Temp = "گرانیت"
            Case 11
                Temp = "آلومینیوم"
        End Select
        '
        Return Temp
    End Function

    Public Function MalekiatType(ByVal ID As Byte) As String
        Dim Temp As String = ""
        Select Case ID
            Case 0
                Temp = "سنددار"
            Case 1
                Temp = "اوقافی سنددار"
            Case 2
                Temp = "اوقافی نسق"
            Case 3
                Temp = "نسق"
        End Select
        '
        Return Temp
    End Function

    Private Sub SetAttributes(ByVal Sender As Object)
        Sender.Attributes("Lang") = "Fa"
        Sender.Attributes("onkeypress") = "return CheckUnicode();"
        Sender.Attributes("dir") = "rtl"
        Sender.Attributes("onkeydown") = "return KeyDown();"
        Sender.Attributes("onblur") = "ClearStatus();"
        Sender.Attributes("onkeyup") = "return KeyUp();"
        Sender.Attributes("onfocus") = "return ShowLangStatus();"
    End Sub

    Public Sub FarsiSaz(ByVal parentControl As Control)
        For Each ctl As Control In parentControl.Controls
            If (ctl.HasControls) Then
                FarsiSaz(ctl)
            ElseIf (ctl.GetType Is GetType(TextBox)) Then
                SetAttributes(CType(ctl, TextBox))
            End If
        Next
    End Sub

End Class
