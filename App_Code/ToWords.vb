Public Class ToWords

    Const strHezar = " åÒÇÑ"
    Const strMilion = " ãíáíæä"
    Const strMiliyard = " ãíáíÇÑÏ"
    Const strTrilion = " ÊÑíáíæä"
    Const strTriliyard = " ÊÑíáíÇÑÏ"
    Const strBilion = " Èíáíæä"
    Const strBiliyard = " ÈíáíÇÑÏ"
    Const va = " æ "

    Public Function Horoof(ByVal strAdad As String) As String
        Dim strHoroofAshar As String() = {"", " Ïåã", " ÕÏã", " åÒÇã", " Ïå åÒÇÑã", " ÕÏ åÒÇÑã", " ãíáíæäã", " Ïå ãíáíæäã", " ÕÏ ãíáíæäã", " ãíáíÇÑÏã", " Ïå ãíáíÇÑÏã", " ÕÏ ãíáíÇÑÏã", " ÊÑíáíæäã", " Ïå ÊÑíáíæäã", " ÕÏ ÊÑíáíæäã", " ÊÑíáíÇÑÏã", " Ïå ÊÑíáíÇÑÏã", " ÕÏ ÊÑíáíÇÑÏã", " Èíáíæäã", " Ïå Èíáíæäã", " ÕÏ Èíáíæäã", " ÈíáíÇÑÏã", " Ïå ÈíáíÇÑÏã", " ÕÏ ÈíáíÇÑÏã"}
        Dim intAshar As Integer = InStr(strAdad, ".")
        Dim intTedadAshar As Integer = Len(strAdad) - intAshar
        Dim strAns As String, strLeft As String, strRight As String
        If intAshar > 0 Then
            strLeft = Tabdil(Left(strAdad, intAshar - 1))
            strRight = Tabdil(Right(strAdad, Len(strAdad) - intAshar))
            strAns = IIf(Val(Left(strAdad, intAshar - 1)) = 0, "", strLeft & " ããíÒ ") & strRight
            If intTedadAshar < 22 Then strAns = strAns & strHoroofAshar(intTedadAshar)
        Else
            strAns = Tabdil(strAdad)
        End If
        Horoof = strAns
    End Function

    Private Function Tabdil(ByVal strAadad As String) As String
        Dim intS As Integer, intH As Integer, intM1 As Integer, intM2 As Integer, intT1 As Integer, intT2 As Integer, intB1 As Integer, intB2 As Integer
        Dim intLen As Integer = Len(strAadad)
        If intLen >= 4 Then
            intS = Val(Right(strAadad, 3))  ' sadgan
            intH = Val(Left(Right(strAadad, 6), Len(Right(strAadad, 6)) - 3))  ' hezargan
        End If
        If intLen >= 7 Then intM1 = Val(Left(Right(strAadad, 9), Len(Right(strAadad, 9)) - 6)) ' miliongan
        If intLen >= 10 Then intM2 = Val(Left(Right(strAadad, 12), Len(Right(strAadad, 12)) - 9)) ' miliyardgan
        If intLen >= 13 Then intT1 = Val(Left(Right(strAadad, 15), Len(Right(strAadad, 15)) - 12)) ' triliongan
        If intLen >= 16 Then intT2 = Val(Left(Right(strAadad, 18), Len(Right(strAadad, 18)) - 15)) ' triliyardgan
        If intLen >= 19 Then intB1 = Val(Left(Right(strAadad, 21), Len(Right(strAadad, 21)) - 18)) ' bilion
        If intLen >= 22 Then intB2 = Val(Left(Right(strAadad, 24), Len(Right(strAadad, 24)) - 21)) ' biliyard
        Dim strHoroof As String = ""
        Select Case intLen
            Case 1 To 3 'Sadgan
                strHoroof = Tabdil_3Ragham(strAadad)
            Case 4 To 6 ' Hezargn
                strHoroof = Tabdil_3Ragham(intH) & strHezar & IIf(strAadad Mod 1000 = 0, "", va & (Tabdil_3Ragham(strAadad Mod 1000)))
            Case 7 To 9 ' Miliongan
                strHoroof = Tabdil_3Ragham(intM1) & strMilion & IIf(intH = 0, "", va & Tabdil_3Ragham(intH) & strHezar) & IIf(intS = 0, "", va & Tabdil_3Ragham(intS))
            Case 10 To 12 ' Miliyardgan
                strHoroof = Tabdil_3Ragham(intM2) & strMiliyard & IIf(intM1 = 0, "", va & Tabdil_3Ragham(intM1) & strMilion) & IIf(intH = 0, "", va & Tabdil_3Ragham(intH) & strHezar) & IIf(intS = 0, "", va & Tabdil_3Ragham(intS))
            Case 13 To 15 '  Triliongan
                strHoroof = Tabdil_3Ragham(intT1) & strTrilion & IIf(intM2 = 0, "", va & Tabdil_3Ragham(intM2) & strMiliyard) & IIf(intM1 = 0, "", va & Tabdil_3Ragham(intM1) & strMilion) & IIf(intH = 0, "", va & Tabdil_3Ragham(intH) & strHezar) & IIf(intS = 0, "", va & Tabdil_3Ragham(intS))
            Case 16 To 18 '  Triliyardgan
                strHoroof = Tabdil_3Ragham(intT2) & strTriliyard & IIf(intT1 = 0, "", va & Tabdil_3Ragham(intT1) & strTrilion) & IIf(intM2 = 0, "", va & Tabdil_3Ragham(intM2) & strMiliyard) & IIf(intM1 = 0, "", va & Tabdil_3Ragham(intM1) & strMilion) & IIf(intH = 0, "", va & Tabdil_3Ragham(intH) & strHezar) & IIf(intS = 0, "", va & Tabdil_3Ragham(intS))
            Case 19 To 21 '  Bilion
                strHoroof = Tabdil_3Ragham(intB1) & strBilion & IIf(intT2 = 0, "", va & Tabdil_3Ragham(intT2) & strTriliyard) & IIf(intT1 = 0, "", va & Tabdil_3Ragham(intT1) & strTrilion) & IIf(intM2 = 0, "", va & Tabdil_3Ragham(intM2) & strMiliyard) & IIf(intM1 = 0, "", va & Tabdil_3Ragham(intM1) & strMilion) & IIf(intH = 0, "", va & Tabdil_3Ragham(intH) & strHezar) & IIf(intS = 0, "", va & Tabdil_3Ragham(intS))
            Case 22 To 24 '  Biliyard
                strHoroof = Tabdil_3Ragham(intB2) & strBiliyard & IIf(intB1 = 0, "", va & Tabdil_3Ragham(intB1) & strBilion) & IIf(intT2 = 0, "", va & Tabdil_3Ragham(intT2) & strTriliyard) & IIf(intT1 = 0, "", va & Tabdil_3Ragham(intT1) & strTrilion) & IIf(intM2 = 0, "", va & Tabdil_3Ragham(intM2) & strMiliyard) & IIf(intM1 = 0, "", va & Tabdil_3Ragham(intM1) & strMilion) & IIf(intH = 0, "", va & Tabdil_3Ragham(intH) & strHezar) & IIf(intS = 0, "", va & Tabdil_3Ragham(intS))
            Case Is > 24
                strHoroof = "ÚÏÏ ÈÒÑÊÑ ÇÒ ãÍÏæÏå ÈíáíÇÑÏ ÇÓÊ"
        End Select
        Tabdil = strHoroof
    End Function

    Private Function Tabdil_3Ragham(ByVal intAdad As Integer) As String
        Dim strYekan As String() = {"ÕİÑ", "í˜", "Ïæ", "Óå", "åÇÑ", "äÌ", "ÔÔ", "åİÊ", "åÔÊ", "äå", "Ïå", "íÇÒÏå", "ÏæÇÒÏå", "ÓíÒÏå", "åÇÑÏå", "ÇäÒÏå", "ÔÇäÒÏå", "åİÏå", "åÌÏå", "äæÒÏå"}
        Dim strDahgan As String() = {"", "Ïå", "ÈíÓÊ", "Óí", "åá", "äÌÇå", "ÔÕÊ", "åİÊÇÏ", "åÔÊÇÏ", "äæÏ"}
        Dim strSadgan As String() = {"", "í˜ÕÏ", "ÏæíÓÊ", "ÓíÕÏ", "åÇÑÕÏ", "ÇäÕÏ", "ÔÔÕÏ", "åİÊÕÏ", "åÔÊÕÏ", "äåÕÏ"}

        Dim intY As Integer = intAdad Mod 10
        Dim intD As Integer = (intAdad Mod 100) \ 10
        Dim intS As Integer = intAdad \ 100
        Dim strHoroof As String
        If intD < 2 Then
            strHoroof = IIf(intS = 0, "", strSadgan(intS) & va) & strYekan(intAdad Mod 100)
            If (intS > 0 And intD = 0 And intY = 0) Then strHoroof = strSadgan(intS)
        Else
            strHoroof = IIf(intS = 0, "", strSadgan(intS) & va) & strDahgan(intD) & IIf(intY = 0, "", va & strYekan(intY))
        End If
        Tabdil_3Ragham = strHoroof
    End Function

End Class
