<%@ Page Language="VB" MasterPageFile="~/Membership/MasterPage.master"%>

<script runat="server">

    Dim ObjCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
    Dim ObjDataRow As DataRow

    Dim MoamelehID As Byte
    Dim MelkID As Byte
    
    Dim Num2Str As New ToWords
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Call GetRecord()
        
        If MoamelehID <> 0 And MelkID <> 0 Then
            Select Case MelkID
                Case 1
                    MultiView1.ActiveViewIndex = 0
                Case 2
                    MultiView1.ActiveViewIndex = 1
                Case 3
                    MultiView1.ActiveViewIndex = 2
                Case 4
                    MultiView1.ActiveViewIndex = 3
            End Select
            Call WriteData()
        End If
    End Sub
    '========================================================
    Private Sub GetRecord()
        '
        Dim StrSql As String = "SELECT dbo.tblMelk.*, dbo.tblMelkType.MelkType, dbo.tblNamaType.NamaType, dbo.tblCountry.CountryName, dbo.tblOstan.OstanName, " & _
                                    "dbo.tblShahr.ShahrName, dbo.tblManategh.MantaghehName AS Expr1 " & _
                               "FROM " & _
                                    "dbo.tblCountry INNER JOIN " & _
                                    "dbo.tblMelk     ON dbo.tblCountry.ID         = dbo.tblMelk.ConuntryID INNER JOIN " & _
                                    "dbo.tblOstan    ON dbo.tblMelk.OstanID       = dbo.tblOstan.ID        INNER JOIN " & _
                                    "dbo.tblShahr    ON dbo.tblMelk.ShahrID       = dbo.tblShahr.ID        INNER JOIN " & _
                                    "dbo.tblMelkType ON dbo.tblMelk.MelkTypeID    = dbo.tblMelkType.ID     INNER JOIN " & _
                                    "dbo.tblManategh ON dbo.tblMelk.MantaghehID   = dbo.tblManategh.ID     INNER JOIN " & _
                                    "dbo.tblNamaType ON dbo.tblMelk.NamaTypeID    = dbo.tblNamaType.ID " & _
                               "WHERE (dbo.tblMelk.ID = " & Request.QueryString("ID").ToString & ")"

        
        Dim Objdat As SqlDataAdapter = New SqlDataAdapter(StrSql, ObjCon)
        Dim objdst As DataSet = New DataSet()
        
        Try
            Objdat.SelectCommand.CommandType = CommandType.Text
            Objdat.Fill(objdst, "tblMelk")
            ObjDataRow = objdst.Tables("tblMelk").Rows(0)
            MoamelehID = Int(ObjDataRow("MoamelehID").ToString)
            MelkID = Int(ObjDataRow("MelkTypeID").ToString)
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        '
    End Sub
    '========================================================
    Private Sub WriteData()
        Dim Tabdil As New UtilityFunction
        'lblTozihat.Text = "استان " + ObjDataRow("OstanName") + " - " + "شهر " + ObjDataRow("ShahrName") + " - " + Tabdil.MoamelehType(Int(ObjDataRow("MoamelehID").ToString)) + " " + Tabdil.MelkType(Int(ObjDataRow("MelkTypeID").ToString))
        Select Case MelkID
            Case 1
                lblMelkType.Text = ObjDataRow("MelkType")
                lblMoameleh.Text = Tabdil.MoamelehType(ObjDataRow("MoamelehID"))
                lblOstan.Text = ObjDataRow("OstanName")
                lblShahr.Text = ObjDataRow("ShahrName")
                lblAddress.Text = ObjDataRow("Address")
                lblTel1.Text = ObjDataRow("Tel1").ToString
                lblTel2.Text = ObjDataRow("Tel2").ToString
                lblSanad.Text = Tabdil.SanadType(ObjDataRow("KarbariTypeID"))
                lblMalekiat.Text = Tabdil.MalekiatType(ObjDataRow("MalekiatTypeID"))
                lblSokounat.Text = Tabdil.SokunatType(ObjDataRow("SokounatStatusID"))
                lblTabagheh.Text = ObjDataRow("Tedad_Tabagheh")
                lblVahed.Text = ObjDataRow("Tedad_Vahed")
                lblkhab.Text = ObjDataRow("Tedad_Khab")
                lblVahedForoosh.Text = ObjDataRow("Vahed_Foroosh")
                lblNama.Text = ObjDataRow("NamaType").ToString
                lblWC.Text = Tabdil.WCType(ObjDataRow("ServiceID").ToString)
                '----------------
                lblPriceMetri.Text = Num2Str.Horoof(ObjDataRow("Price_Metri").ToString)
                lblPriceKol.Text = Num2Str.Horoof(ObjDataRow("Price_Kol").ToString)
                '----------------
                lblVadieh1.Text = Num2Str.Horoof(ObjDataRow("Vadieh").ToString)
                lblVadieh2.Text = Num2Str.Horoof(ObjDataRow("Vadieh").ToString)
                '----------------
                lblEjareh1.Text = Num2Str.Horoof(ObjDataRow("Ejareh").ToString)
                lblEjareh2.Text = Num2Str.Horoof(ObjDataRow("Ejareh").ToString)
                ''----------------
                lblTozihat1.Text = ObjDataRow("Tozihat_Price").ToString
                ''----------------
                lblMofid.Text = ObjDataRow("Metraj_Mofid").ToString
                lblMosha.Text = ObjDataRow("Metraj_Mosha").ToString
                lblKol.Text = ObjDataRow("Metraj_Kol").ToString
                '----------------
                lblEmkanat.Text = ""
                If CBool(ObjDataRow("AshpazOpen")) = True Then lblEmkanat.Text += "آشپزخانه Open" & "<br />"
                If CBool(ObjDataRow("Ab")) = True Then lblEmkanat.Text += "آب" & "<br />"
                If CBool(ObjDataRow("Bargh")) = True Then lblEmkanat.Text += "برق" & "<br />"
                If CBool(ObjDataRow("Telphone")) = True Then lblEmkanat_2.Text += "تلفن" & "<br />"
                If CBool(ObjDataRow("Gaz")) = True Then lblEmkanat.Text += "گاز" & "<br />"
                If CBool(ObjDataRow("Package")) = True Then lblEmkanat.Text += "پکیج" & "<br />"
                If CBool(ObjDataRow("Shoofaj")) = True Then lblEmkanat.Text += "شوفاژ" & "<br />"
                If CBool(ObjDataRow("Espilet")) = True Then lblEmkanat.Text += "اسپیلت" & "<br />"
                If CBool(ObjDataRow("Shoomineh")) = True Then lblEmkanat.Text += "شومینه" & "<br />"
                If CBool(ObjDataRow("Anbari")) = True Then lblEmkanat.Text += "انباری" & "<br />"
                If CBool(ObjDataRow("Parking")) = True Then lblEmkanat.Text += "پارکینگ" & "<br />"
                If CBool(ObjDataRow("Asansor")) = True Then lblEmkanat.Text += "آسانسور" & "<br />"
                If CBool(ObjDataRow("Dar_Kontroli")) = True Then lblEmkanat.Text += "در کنترلی" & "<br />"
                '----------------
                lblTozihat1.Text = ObjDataRow("Tozihat_Price")
                lblTozihat2.Text = ObjDataRow("Tozihat")
                '=================================================================
            Case 2
                lblMelkType_2.Text = ObjDataRow("MelkType")
                lblMoameleh_2.Text = Tabdil.MoamelehType(ObjDataRow("MoamelehID"))
                lblOstan_2.Text = ObjDataRow("OstanName")
                lblShahr_2.Text = ObjDataRow("ShahrName")
                lblAddress_2.Text = ObjDataRow("Address")
                lblTel1_2.Text = ObjDataRow("Tel1").ToString
                lblTel2_2.Text = ObjDataRow("Tel2").ToString
                lblSanad_2.Text = Tabdil.SanadType(ObjDataRow("KarbariTypeID"))
                lblMalekiat_2.Text = Tabdil.MalekiatType(ObjDataRow("MalekiatTypeID"))
                lblSokounat_2.Text = Tabdil.SokunatType(ObjDataRow("SokounatStatusID"))

                lblNama_2.Text = ObjDataRow("NamaType").ToString
                lblWC_2.Text = Tabdil.WCType(ObjDataRow("ServiceID").ToString)
                '----------------
                lblPriceMetri_2.Text = Num2Str.Horoof(ObjDataRow("Price_Metri").ToString)
                lblPriceKol_2.Text = Num2Str.Horoof(ObjDataRow("Price_Kol").ToString)
                '----------------
                lblVadieh1_2.Text = Num2Str.Horoof(ObjDataRow("Vadieh").ToString)
                lblVadieh2_2.Text = Num2Str.Horoof(ObjDataRow("Vadieh").ToString)
                '----------------
                lblEjareh1_2.Text = Num2Str.Horoof(ObjDataRow("Ejareh").ToString)
                lblEjareh2_2.Text = Num2Str.Horoof(ObjDataRow("Ejareh").ToString)
                ''----------------
                lblMofid_2.Text = ObjDataRow("Metraj_Mofid").ToString
                lblMosha_2.Text = ObjDataRow("Metraj_Mosha").ToString
                lblKol_2.Text = ObjDataRow("Metraj_Kol").ToString
                '----------------
                lblEmkanat_2.Text = ""
                If CBool(ObjDataRow("AshpazOpen")) = True Then lblEmkanat_2.Text += "آشپزخانه Open" & "<br />"
                If CBool(ObjDataRow("Ab")) = True Then lblEmkanat_2.Text += "آب" & "<br />"
                If CBool(ObjDataRow("Bargh")) = True Then lblEmkanat_2.Text += "برق" & "<br />"
                If CBool(ObjDataRow("Telphone")) = True Then lblEmkanat_2.Text += "تلفن" & "<br />"
                If CBool(ObjDataRow("Gaz")) = True Then lblEmkanat_2.Text += "گاز" & "<br />"
                If CBool(ObjDataRow("Package")) = True Then lblEmkanat_2.Text += "پکیج" & "<br />"
                If CBool(ObjDataRow("Shoofaj")) = True Then lblEmkanat_2.Text += "شوفاژ" & "<br />"
                If CBool(ObjDataRow("Espilet")) = True Then lblEmkanat_2.Text += "اسپیلت" & "<br />"
                If CBool(ObjDataRow("Shoomineh")) = True Then lblEmkanat_2.Text += "شومینه" & "<br />"
                If CBool(ObjDataRow("Anbari")) = True Then lblEmkanat_2.Text += "انباری" & "<br />"
                If CBool(ObjDataRow("Parking")) = True Then lblEmkanat_2.Text += "پارکینگ" & "<br />"
                If CBool(ObjDataRow("Asansor")) = True Then lblEmkanat_2.Text += "آسانسور" & "<br />"
                If CBool(ObjDataRow("Dar_Kontroli")) = True Then lblEmkanat_2.Text += "در کنترلی" & "<br />"
                '----------------
                lblTozihat1_2.Text = ObjDataRow("Tozihat_Price").ToString
                lblTozihat2_2.Text = ObjDataRow("Tozihat")
                '=================================================================
            Case 3
                lblMelkType_3.Text = ObjDataRow("MelkType")
                lblMoameleh_3.Text = Tabdil.MoamelehType(ObjDataRow("MoamelehID"))
                lblOstan_3.Text = ObjDataRow("OstanName")
                lblShahr_3.Text = ObjDataRow("ShahrName")
                lblMalekiat_3.Text = Tabdil.MalekiatType(ObjDataRow("MalekiatTypeID"))
                lblAddress_3.Text = ObjDataRow("Address")
                lblTel1_3.Text = ObjDataRow("Tel1").ToString
                lblTel2_3.Text = ObjDataRow("Tel2").ToString
                lblNama_3.Text = ObjDataRow("NamaType").ToString
                '----------------
                lblPriceMetri_3.Text = Num2Str.Horoof(ObjDataRow("Price_Metri").ToString)
                lblPriceKol_3.Text = Num2Str.Horoof(ObjDataRow("Price_Kol").ToString)
                '----------------
                lblVadieh1_3.Text = Num2Str.Horoof(ObjDataRow("Vadieh").ToString)
                lblVadieh2_3.Text = Num2Str.Horoof(ObjDataRow("Vadieh").ToString)
                '----------------
                lblEjareh1_3.Text = Num2Str.Horoof(ObjDataRow("Ejareh").ToString)
                lblEjareh2_3.Text = Num2Str.Horoof(ObjDataRow("Ejareh").ToString)
                ''----------------
                lblZirBana_3.Text = ObjDataRow("Metraj_Kol").ToString
                lblToolBar_3.Text = ObjDataRow("Tool_Bar").ToString
                '----------------
                lblEmkanat_3.Text = ""
                If CBool(ObjDataRow("Anbari")) = True Then lblEmkanat_3.Text += "انباری" & "<br />"
                If CBool(ObjDataRow("Telphone")) = True Then lblEmkanat_3.Text += "تلفن" & "<br />"
                If CBool(ObjDataRow("Parking")) = True Then lblEmkanat_3.Text += "پارکینگ" & "<br />"
                If CBool(ObjDataRow("Bargh")) = True Then lblEmkanat_3.Text += "برق سه فاز" & "<br />"
                If CBool(ObjDataRow("Ab")) = True Then lblEmkanat_3.Text += "آب" & "<br />"
                If CBool(ObjDataRow("Gaz")) = True Then lblEmkanat_3.Text += "گاز" & "<br />"
                '----------------
                lblTozihat1_3.Text = ObjDataRow("Tozihat_Price").ToString
                lblTozihat2_3.Text = ObjDataRow("Tozihat")
                '=================================================================
            Case 4
                lblMelkType_4.Text = ObjDataRow("MelkType")
                lblMoameleh_4.Text = Tabdil.MoamelehType(ObjDataRow("MoamelehID"))
                lblMalekiat_4.Text = Tabdil.MalekiatType(ObjDataRow("MalekiatTypeID"))
                lblOstan_4.Text = ObjDataRow("OstanName")
                lblShahr_4.Text = ObjDataRow("ShahrName")
                lblAddress_4.Text = ObjDataRow("Address")
                lblTel1_4.Text = ObjDataRow("Tel1").ToString
                lblTel2_4.Text = ObjDataRow("Tel2").ToString
                '----------------
                lblPrice_4.Text = Num2Str.Horoof(ObjDataRow("Price_Kol").ToString)
                lblPriceMetri_4.Text = Num2Str.Horoof(ObjDataRow("Price_Metri").ToString)
                lblTozihat1_4.Text = ObjDataRow("Tozihat_Price").ToString
                '----------------
                lblZirBana_4.Text = ObjDataRow("Metraj_Kol").ToString
                lblToolBar_4.Text = ObjDataRow("Tool_Bar").ToString
                '----------------
                lblTozihat2_4.Text = ObjDataRow("Tozihat")
                '=================================================================
        End Select
        lblStatus.Text = IIf(CBool(ObjDataRow("Visable")) = True, "ثبت شده", "ثبت نشده")
        lblMoamelehStatus.Text = IIf(CBool(ObjDataRow("DarJaryan")) = True, "در جریان", "راکد")
        Dim FarsiDate As New ShamsiDate
        lblTarikhSabt.Text = FarsiDate.Miladi2Shamsi(ObjDataRow("TarikhSabt"), ShamsiDate.ShowType.ShortDate)
    End Sub
    
    '========================================================
    
    Protected Sub btnActive_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cmdText As String = "SELECT DarJaryan FROM tblMelk WHERE ID=" + Request("ID")
        Dim objCmd As SqlCommand = New SqlCommand(cmdText, ObjCon)
        Dim result As Object
        Try
            ObjCon.Open()
            result = objCmd.ExecuteScalar
            ObjCon.Close()
            objCmd.Dispose()
        Catch ex As Exception
        End Try
        '-----------------------------------------------
        'If CBool(result) = True Then
        'cmdText = "UPDATE tblMelk SET DarJaryan=0 WHERE ID=" + Request("ID")
        'Else
        'cmdText = "UPDATE tblMelk SET DarJaryan=1 WHERE ID=" + Request("ID")
        cmdText = "UPDATE tblMelk SET DarJaryan=DarJaryan^1 WHERE ID=" + Request("ID")
        'End If
        objCmd = New SqlCommand(cmdText, ObjCon)
        Try
            ObjCon.Open()
            objCmd.ExecuteNonQuery()
            ObjCon.Close()
            Call Page_Load(Me, e)
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="text-align: right">
        <table style="width: 100%">
            <tr>
                <td style="width: 100%">
                    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View_Apar" runat="server">
<table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع ملک : </span>
                        </td>
                        <td style="width:137px">
                            <asp:Label ID="lblMelkType" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            نوع معامله : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMoameleh" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            استان : </span>
                        </td>
                        <td style="width:170px">
                            <asp:Label ID="lblOstan" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            شهر : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblShahr" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            آدرس کامل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            تلفن تابت ملک : </span>
                        </td>
                        <td style="width:135px">
                            <asp:Label ID="lblTel1" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            تلفن همراه :
                            </span>
                            </td>
                        <td>
                            <asp:Label ID="lblTel2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع کاربری : </span>
                        </td>
                        <td style="width:111px">
                            <asp:Label ID="lblSanad" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            وضعیت سکونت :</span></td>
                        <td>
                            <asp:Label ID="lblSokounat" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                                نوع مالکیت :
                            </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMalekiat" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            تعداد طبقات : </span>
                        </td>
                        <td style="width:140px">
                            <asp:Label ID="lblTabagheh" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            تعداد واحد : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVahed" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                                واحد مورد نظر :
                            </span>
                        </td>
                        <td style="width:134px">
                            <asp:Label ID="lblVahedForoosh" runat="server"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0000cc">
                            تعداد خواب : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblKhab" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع نما : </span>
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="lblNama" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            &nbsp;&nbsp; سرویس بهداشتی : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblWC" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%If MelkID = 1 And MoamelehID = 1 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">قیمت متری :&nbsp;</span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceMetri" runat="server"></asp:Label>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            قیمت کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceKol" runat="server"></asp:Label>
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 1 And MoamelehID = 2 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh1" runat="server"></asp:Label>
                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc"> اجاره ماهانه :</span></td>
                        <td>
                            <asp:Label ID="lblEjareh1" runat="server"></asp:Label>
                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        
        <%If MelkID = 1 And MoamelehID = 3 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh2" runat="server"></asp:Label>
                            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 1 And MoamelehID = 4 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">اجاره ماهانه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblEjareh2" runat="server"></asp:Label>
                            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">توضیحات قیمت :</span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat1" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            متراژ &nbsp; &nbsp; &nbsp;&nbsp; مفید : </span>
                        </td>
                        <td style="width:60px">
                            <asp:Label ID="lblMofid" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            مشاء : </span>
                        </td>
                        <td style="width:70px">
                            <asp:Label ID="lblMosha" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblKol" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            امکانات :</span></td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                        </td>
                        <td>
                            <asp:Label ID="lblEmkanat" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">توضیحات : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>        
        </asp:View>
<!--====================================================================================-->        
<!--====================================================================================-->        
<!--====================================================================================-->        
        <asp:View ID="View_Vila" runat="server">
<table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع ملک : </span>
                        </td>
                        <td style="width:137px">
                            <asp:Label ID="lblMelkType_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            نوع معامله : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMoameleh_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            استان : </span>
                        </td>
                        <td style="width:170px">
                            <asp:Label ID="lblOstan_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            شهر : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblShahr_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            آدرس کامل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblAddress_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            تلفن تابت ملک : </span>
                        </td>
                        <td style="width:135px">
                            <asp:Label ID="lblTel1_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            تلفن همراه :
                            </span>
                            </td>
                        <td>
                            <asp:Label ID="lblTel2_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع کاربری : </span>
                        </td>
                        <td style="width:111px">
                            <asp:Label ID="lblSanad_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            وضعیت سکونت :</span></td>
                        <td>
                            <asp:Label ID="lblSokounat_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                                نوع مالکیت :
                            </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMalekiat_2" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            تعداد خواب : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblKhab_2" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع نما : </span>
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="lblNama_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            &nbsp;&nbsp; سرویس بهداشتی : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblWC_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%If MelkID = 2 And MoamelehID = 1 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">قیمت متری :&nbsp;</span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceMetri_2" runat="server"></asp:Label>&nbsp;
                            <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            قیمت کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceKol_2" runat="server"></asp:Label>&nbsp;
                            <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 2 And MoamelehID = 2 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh1_2" runat="server"></asp:Label>
                            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc"> اجاره ماهانه :</span></td>
                        <td>
                            <asp:Label ID="lblEjareh1_2" runat="server"></asp:Label>
                            <asp:Label ID="Label10" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        
        <%If MelkID = 2 And MoamelehID = 3 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh2_2" runat="server"></asp:Label>
                            <asp:Label ID="Label11" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 2 And MoamelehID = 4 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">اجاره ماهانه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblEjareh2_2" runat="server"></asp:Label>
                            <asp:Label ID="Label12" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">توضیحات قیمت :</span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat1_2" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            متراژ &nbsp; &nbsp; &nbsp;&nbsp; مفید : </span>
                        </td>
                        <td style="width:60px">
                            <asp:Label ID="lblMofid_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            مشاء : </span>
                        </td>
                        <td style="width:70px">
                            <asp:Label ID="lblMosha_2" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblKol_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            امکانات :</span></td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                        </td>
                        <td>
                            <asp:Label ID="lblEmkanat_2" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">توضیحات : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat2_2" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>        
        </asp:View>
<!--====================================================================================-->        
<!--====================================================================================-->        
<!--====================================================================================-->        
        <asp:View ID="View_Magh" runat="server">
<table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع ملک : </span>
                        </td>
                        <td style="width:130px">
                            <asp:Label ID="lblMelkType_3" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            نوع معامله : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMoameleh_3" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            استان : </span>
                        </td>
                        <td style="width:130px">
                            <asp:Label ID="lblOstan_3" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            شهر : &nbsp; &nbsp; &nbsp; &nbsp; </span>
                        </td>
                        <td>
                            <asp:Label ID="lblShahr_3" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            آدرس کامل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblAddress_3" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            تلفن تابت ملک : </span>
                        </td>
                        <td style="width:130px">
                            <asp:Label ID="lblTel1_3" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            تلفن همراه :
                            </span>
                            </td>
                        <td>
                            <asp:Label ID="lblTel2_3" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                                نوع مالکیت :
                            </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMalekiat_3" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">
                            نوع نما : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblNama_3" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%If MelkID = 3 And MoamelehID = 1 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">قیمت متری : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceMetri_3" runat="server"></asp:Label>
                            <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: #0000cc">
                            قیمت کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceKol_3" runat="server"></asp:Label>
                            <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 3 And MoamelehID = 2 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh1_3" runat="server"></asp:Label>
                            <asp:Label ID="Label15" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: #0000cc"> اجاره ماهانه :</span>
                        </td>
                        <td>
                            <asp:Label ID="lblEjareh1_3" runat="server"></asp:Label>
                            <asp:Label ID="Label16" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        
        <%If MelkID = 3 And MoamelehID = 3 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">ودیعه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblVadieh2_3" runat="server"></asp:Label>
                            <asp:Label ID="Label17" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <%If MelkID = 3 And MoamelehID = 4 Then%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">اجاره ماهانه : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblEjareh2_3" runat="server"></asp:Label>
                            <asp:Label ID="Label18" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%End If%>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">توضیحات قیمت :</span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat1_3" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">زیر بنا : </span>
                        </td>
                        <td style="width:130px">
                            <asp:Label ID="lblZirBana_3" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            طول بر : &nbsp; &nbsp;</span></td>
                        <td>
                            <asp:Label ID="lblToolBar_3" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <span style="color: #0000cc">
                            امکانات :</span></td>
                    </tr>
                    <tr>
                        <td style="width:100px">
                        </td>
                        <td>
                            <asp:Label ID="lblEmkanat_3" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:100px">
                            <span style="color: #0000cc">توضیحات : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat2_3" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>        
        </asp:View>
<!--====================================================================================-->        
<!--====================================================================================-->        
<!--====================================================================================-->        
        <asp:View ID="View_Zamin" runat="server">
<table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            نوع ملک : </span>
                        </td>
                        <td style="width:120px">
                            <asp:Label ID="lblMelkType_4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0000cc">
                            نوع معامله :&nbsp; </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMoameleh_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            استان : </span>
                        </td>
                        <td  style="width:120px">
                            <asp:Label ID="lblOstan_4" runat="server"></asp:Label></td>
                        <td>
                            <span style="color: #0000cc">
                            شهر : &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span>
                        </td>
                        <td>
                            <asp:Label ID="lblShahr_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            آدرس کامل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblAddress_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            تلفن تابت ملک : </span>
                        </td>
                        <td  style="width:120px">
                            <asp:Label ID="lblTel1_4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0000cc">
                            تلفن همراه :</span></td>
                        <td>
                            <asp:Label ID="lblTel2_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                                نوع مالکیت :
                            </span>
                        </td>
                        <td>
                            <asp:Label ID="lblMalekiat_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <span style="color: #0000cc">قیمت کل : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPrice_4" runat="server"></asp:Label>
                            <asp:Label ID="Label19" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">
                            قیمت هر متر مربع : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblPriceMetri_4" runat="server"></asp:Label>
                            <asp:Label ID="Label20" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">توضیحات قیمت : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat1_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">مساحت زمین : </span>
                        </td>
                        <td  style="width:120px">
                            <asp:Label ID="lblZirBana_4" runat="server"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0000cc">
                            طول بر : &nbsp;&nbsp; &nbsp; </span>
                        </td>
                        <td>
                            <asp:Label ID="lblToolBar_4" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="width:115px">
                            <span style="color: #0000cc">توضیحات : </span>
                        </td>
                        <td>
                            <asp:Label ID="lblTozihat2_4" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>        
        </asp:View>
<!--====================================================================================-->        
<!--====================================================================================-->        
<!--====================================================================================-->        
    </asp:MultiView>
    <hr />
                    <table>
                        <tr>
                            <td>
                                <span style="color: #0000cc">وضعیت ملک : </span>
                            </td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color: #0000cc">وضعیت معامله : </span>
                            </td>
                            <td>
                                <asp:Label ID="lblMoamelehStatus" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color: #0000cc">
                                تاریخ ثبت : </span>
                            </td>
                            <td>
                                <asp:Label ID="lblTarikhSabt" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <br />
<div style="text-align: center">
        <br />
        <table  style="width: 40%">
            <tr>
                <td>
                    <asp:Button ID="btnActive" runat="server" Text="تغییر وضعیت معامله" Width="110px" OnClick="btnActive_Click"/>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" PostBackUrl="~/Membership/AmlakList.aspx" Text="بازگشت به لیست" Width="110px" /></td>
            </tr>
        </table>
    </div>
    <br />
    <br />
</asp:Content>