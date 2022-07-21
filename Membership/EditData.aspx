<%@ Page Language="VB" MasterPageFile="~/Membership/MasterPage.master"%>


<script runat="server">

    Dim ObjCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
    Dim ObjDataRow As DataRow

    Dim MoamelehID As Byte
    Dim MelkID As Byte
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Call GetRecord()
        If Page.IsPostBack = False Then
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
        'Dim Tabdil As New UtilityFunction
        lblTozihat.Text = "استان " + ObjDataRow("OstanName") + " - " + "شهر " + ObjDataRow("ShahrName") + " - " + Tabdil.MoamelehType(Int(ObjDataRow("MoamelehID").ToString)) + " " + Tabdil.MelkType(Int(ObjDataRow("MelkTypeID").ToString))
        Select Case MelkID
            Case 1
                txtAgahi.Text = ObjDataRow("AgahiTitle")
                txtAddress.Text = ObjDataRow("Address")
                txtTel1.Text = ObjDataRow("Tel1").ToString
                txtTel2.Text = ObjDataRow("Tel2").ToString
                ddlKarbari.SelectedIndex = Int(ObjDataRow("KarbariTypeID"))
                ddlSokunat.SelectedIndex = Int(ObjDataRow("SokounatStatusID"))
                ddlMalekiat.SelectedIndex = Int(ObjDataRow("MalekiatTypeID"))
                txtTabagheh.Text = ObjDataRow("Tedad_Tabagheh")
                txtVahed.Text = ObjDataRow("Tedad_Vahed")
                txtKhab.Text = ObjDataRow("Tedad_Khab")
                txtVahedForoosh.Text = ObjDataRow("Vahed_Foroosh")
                ddlNama.SelectedIndex = Int(ObjDataRow("NamaTypeID")) - 1
                ddlWC.SelectedIndex = Int(ObjDataRow("ServiceID"))
                '----------------
                txtPriceKol.Text = ObjDataRow("Price_Kol").ToString
                txtPriceMetri.Text = ObjDataRow("Price_Metri").ToString
                '----------------
                txtVadieh1.Text = ObjDataRow("Vadieh").ToString
                txtVadieh2.Text = ObjDataRow("Vadieh").ToString
                '----------------
                txtEjareh1.Text = ObjDataRow("Ejareh").ToString
                txtEjareh2.Text = ObjDataRow("Ejareh").ToString
                ''----------------
                txtMofid.Text = ObjDataRow("Metraj_Mofid").ToString
                txtMosha.Text = ObjDataRow("Metraj_Mosha").ToString
                txtKol.Text = ObjDataRow("Metraj_Kol").ToString
                '----------------
                EmkanatList.Items(0).Selected = Convert.ToBoolean(ObjDataRow("AshpazOpen"))
                EmkanatList.Items(1).Selected = Convert.ToBoolean(ObjDataRow("Ab"))
                EmkanatList.Items(2).Selected = Convert.ToBoolean(ObjDataRow("Bargh"))
                EmkanatList.Items(3).Selected = Convert.ToBoolean(ObjDataRow("Gaz"))
                EmkanatList.Items(4).Selected = Convert.ToBoolean(ObjDataRow("Telphone"))
                EmkanatList.Items(5).Selected = Convert.ToBoolean(ObjDataRow("Package"))
                EmkanatList.Items(6).Selected = Convert.ToBoolean(ObjDataRow("Shoofaj"))
                EmkanatList.Items(7).Selected = Convert.ToBoolean(ObjDataRow("Espilet"))
                EmkanatList.Items(8).Selected = Convert.ToBoolean(ObjDataRow("Shoomineh"))
                EmkanatList.Items(9).Selected = Convert.ToBoolean(ObjDataRow("Anbari"))
                EmkanatList.Items(10).Selected = Convert.ToBoolean(ObjDataRow("Parking"))
                EmkanatList.Items(11).Selected = Convert.ToBoolean(ObjDataRow("Asansor"))
                EmkanatList.Items(12).Selected = Convert.ToBoolean(ObjDataRow("Dar_Kontroli"))
                'convert.ToBoolean( 
                '----------------
                txtTozihat1.Text = ObjDataRow("Tozihat_Price").ToString
                txtTozihat2.Text = ObjDataRow("Tozihat")
                '=================================================================
            Case 2
                txtAgahi.Text = ObjDataRow("AgahiTitle")
                txtAddress_2.Text = ObjDataRow("Address")
                txtTel1_2.Text = ObjDataRow("Tel1").ToString
                txtTel2_2.Text = ObjDataRow("Tel2").ToString
                ddlSokunat_2.SelectedIndex = Int(ObjDataRow("SokounatStatusID"))
                txtKhab_2.Text = ObjDataRow("Tedad_Khab")
                ddlNama_2.SelectedIndex = Int(ObjDataRow("NamaTypeID")) - 1
                ddlWC_2.SelectedIndex = Int(ObjDataRow("ServiceID"))
                ddlMalekiat_2.SelectedIndex = Int(ObjDataRow("MalekiatTypeID"))
                ddlSokunat_2.SelectedIndex = Int(ObjDataRow("SokounatStatusID"))
                '----------------
                txtPriceMetri_2.Text = ObjDataRow("Price_Metri").ToString
                txtPriceKol_2.Text = ObjDataRow("Price_Kol").ToString
                '----------------
                txtVadieh1_2.Text = ObjDataRow("Vadieh").ToString
                txtVadieh2_2.Text = ObjDataRow("Vadieh").ToString
                '----------------
                txtEjareh1_2.Text = ObjDataRow("Ejareh").ToString
                txtEjareh2_2.Text = ObjDataRow("Ejareh").ToString
                ''----------------
                txtMofid_2.Text = ObjDataRow("Metraj_Mofid").ToString
                txtMosha_2.Text = ObjDataRow("Metraj_Mosha").ToString
                txtKol_2.Text = ObjDataRow("Metraj_Kol").ToString
                '----------------
                EmkanatList_2.Items(0).Selected = Convert.ToBoolean(ObjDataRow("AshpazOpen"))
                EmkanatList_2.Items(1).Selected = Convert.ToBoolean(ObjDataRow("Ab"))
                EmkanatList_2.Items(2).Selected = Convert.ToBoolean(ObjDataRow("Bargh"))
                EmkanatList_2.Items(3).Selected = Convert.ToBoolean(ObjDataRow("Gaz"))
                EmkanatList_2.Items(4).Selected = Convert.ToBoolean(ObjDataRow("Telphone"))
                EmkanatList_2.Items(5).Selected = Convert.ToBoolean(ObjDataRow("Package"))
                EmkanatList_2.Items(6).Selected = Convert.ToBoolean(ObjDataRow("Shoofaj"))
                EmkanatList_2.Items(7).Selected = Convert.ToBoolean(ObjDataRow("Espilet"))
                EmkanatList_2.Items(8).Selected = Convert.ToBoolean(ObjDataRow("Shoomineh"))
                EmkanatList_2.Items(9).Selected = Convert.ToBoolean(ObjDataRow("Anbari"))
                EmkanatList_2.Items(10).Selected = Convert.ToBoolean(ObjDataRow("Parking"))
                EmkanatList_2.Items(11).Selected = Convert.ToBoolean(ObjDataRow("Asansor"))
                EmkanatList_2.Items(12).Selected = Convert.ToBoolean(ObjDataRow("Dar_Kontroli"))
                '----------------
                txtTozihat1_2.Text = ObjDataRow("Tozihat_Price").ToString
                txtTozihat2_2.Text = ObjDataRow("Tozihat")
                '=================================================================
            Case 3
                txtAgahi.Text = ObjDataRow("AgahiTitle")
                txtAddress_3.Text = ObjDataRow("Address")
                txtTel1_3.Text = ObjDataRow("Tel1").ToString
                txtTel2_3.Text = ObjDataRow("Tel2").ToString
                ddlNama_3.SelectedIndex = Int(ObjDataRow("NamaTypeID")) - 1
                ddlMalekiat_3.SelectedIndex = Int(ObjDataRow("MalekiatTypeID"))
                ''----------------
                txtPriceMetri_3.Text = ObjDataRow("Price_Metri").ToString
                txtPriceKol_3.Text = ObjDataRow("Price_Kol").ToString
                ''----------------
                txtVadieh1_3.Text = ObjDataRow("Vadieh").ToString
                txtVadieh2_3.Text = ObjDataRow("Vadieh").ToString
                ''----------------
                txtEjareh1_3.Text = ObjDataRow("Ejareh").ToString
                txtEjareh2_3.Text = ObjDataRow("Ejareh").ToString
                ' ''----------------
                txtzirBana_3.Text = ObjDataRow("Metraj_Kol").ToString
                txtToolBar_3.Text = ObjDataRow("Tool_Bar").ToString
                ''----------------
                EmkanatList_3.Items(0).Selected = Convert.ToBoolean(ObjDataRow("Anbari"))
                EmkanatList_3.Items(1).Selected = Convert.ToBoolean(ObjDataRow("Telphone"))
                EmkanatList_3.Items(2).Selected = Convert.ToBoolean(ObjDataRow("Parking"))
                EmkanatList_3.Items(3).Selected = Convert.ToBoolean(ObjDataRow("Bargh"))
                EmkanatList_3.Items(4).Selected = Convert.ToBoolean(ObjDataRow("Ab"))
                EmkanatList_3.Items(5).Selected = Convert.ToBoolean(ObjDataRow("Gaz"))
                ''----------------
                txtTozihat1_3.Text = ObjDataRow("Tozihat_Price").ToString
                txtTozihat2_3.Text = ObjDataRow("Tozihat")
                '=================================================================
            Case 4
                txtAgahi.Text = ObjDataRow("AgahiTitle")
                txtAddress_4.Text = ObjDataRow("Address")
                txtTel1_4.Text = ObjDataRow("Tel1").ToString
                txtTel2_4.Text = ObjDataRow("Tel2").ToString
                ddlMalekiat_3.SelectedIndex = Int(ObjDataRow("MalekiatTypeID"))
                '----------------
                txtPriceKol_4.Text = ObjDataRow("Price_Kol").ToString
                txtPriceMetri_4.Text = ObjDataRow("Price_Metri").ToString
                '----------------
                txtzirBana_4.Text = ObjDataRow("Metraj_Kol").ToString
                txtToolBar_4.Text = ObjDataRow("Tool_Bar").ToString
                '----------------
                txtTozihat1_4.Text = ObjDataRow("Tozihat_Price").ToString
                txtTozihat2_4.Text = ObjDataRow("Tozihat")
                '=================================================================
        End Select
    End Sub
    
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Page.IsPostBack = True Then
            Select Case MelkID
                Case 1
                    Select Case MoamelehID
                        Case 1
                            Call SaveData(1)   '  فروش اپارتمان
                        Case 2
                            Call SaveData(2)   '   رهن و اجاره اپارتمان
                        Case 3
                            Call SaveData(3)   '  رهن اپارتمان
                        Case 4
                            Call SaveData(4)   '  اجاره اپارتمان
                    End Select
                Case 2
                    Select Case MoamelehID
                        Case 1
                            Call SaveData(5)   '   فروش ویلا
                        Case 2
                            Call SaveData(6)   '  رهن و اجاره ویلا
                        Case 3
                            Call SaveData(7)   '   رهن ویلا
                        Case 4
                            Call SaveData(8)   '   اجاره ویلا
                    End Select
                Case 3
                    Select Case MoamelehID
                        Case 1
                            Call SaveData(9)   '   فروش مغازه
                        Case 2
                            Call SaveData(10)  '   رهن و اجاره مغازه
                        Case 3
                            Call SaveData(11)  '   رهن مغازه
                        Case 4
                            Call SaveData(12)  '   اجاره مغازه
                    End Select
                Case 4
                    Call SaveData(13)          '  فروش زمین
                
            End Select
            Response.Redirect("AmlakList.aspx")
        End If
    End Sub
    
    Private Sub SaveData(ByVal ItemID As Byte)
        '
        Dim Apar As Amlak.DAL.Aparteman
        Dim Vila As Amlak.DAL.Vila
        Dim Magh As Amlak.DAL.Maghazeh
        Dim Zamin As Amlak.DAL.Zamin
        Dim i As Integer

        Select Case ItemID
            Case 1
                Apar.Update_Aparteman_Foroosh(Int(Request.QueryString("ID")), txtTel1.Text.Trim, txtTel2.Text.Trim, txtAddress.Text.Trim, _
                                              txtPriceKol.Text.Trim, txtPriceMetri.Text.Trim, txtTozihat1.Text.Trim, Int(ddlNama.SelectedItem.Value), _
                                              ddlSokunat.SelectedIndex, txtTabagheh.Text.Trim, txtVahed.Text.Trim, txtKhab.Text.Trim, txtVahedForoosh.Text.Trim, txtMofid.Text.Trim, txtMosha.Text.Trim, txtKol.Text.Trim, _
                                              ddlKarbari.SelectedIndex, ddlMalekiat.SelectedIndex, ddlWC.SelectedIndex, EmkanatList.Items(0).Selected, EmkanatList.Items(1).Selected, EmkanatList.Items(2).Selected, EmkanatList.Items(3).Selected, EmkanatList.Items(4).Selected, _
                                              EmkanatList.Items(5).Selected, EmkanatList.Items(6).Selected, EmkanatList.Items(7).Selected, EmkanatList.Items(8).Selected, EmkanatList.Items(9).Selected, EmkanatList.Items(10).Selected, EmkanatList.Items(11).Selected, _
                                              EmkanatList.Items(12).Selected, txtTozihat2.Text.Trim, txtAgahi.Text.Trim)
            Case 2
                Apar.Update_Aparteman_RahnEjareh(Int(Request.QueryString("ID")), txtTel1.Text.Trim, txtTel2.Text.Trim, txtAddress.Text.Trim, _
                                                 txtVadieh1.Text.Trim, txtEjareh1.Text.Trim, txtTozihat1.Text.Trim, _
                                                 Int(ddlNama.SelectedItem.Value), ddlSokunat.SelectedIndex, txtTabagheh.Text.Trim, txtVahed.Text.Trim, txtKhab.Text.Trim, txtVahedForoosh.Text.Trim, txtMofid.Text.Trim, txtMosha.Text.Trim, txtKol.Text.Trim, _
                                                 ddlKarbari.SelectedIndex, ddlMalekiat.SelectedIndex, ddlWC.SelectedIndex, EmkanatList.Items(0).Selected, EmkanatList.Items(1).Selected, EmkanatList.Items(2).Selected, EmkanatList.Items(3).Selected, EmkanatList.Items(4).Selected, _
                                                 EmkanatList.Items(5).Selected, EmkanatList.Items(6).Selected, EmkanatList.Items(7).Selected, EmkanatList.Items(8).Selected, EmkanatList.Items(9).Selected, EmkanatList.Items(10).Selected, EmkanatList.Items(11).Selected, _
                                                 EmkanatList.Items(12).Selected, txtTozihat2.Text.Trim, txtAgahi.Text.Trim)
            Case 3
                Apar.Update_Aparteman_Rahn(Int(Request.QueryString("ID")), txtTel1.Text.Trim, txtTel2.Text.Trim, txtAddress.Text.Trim, _
                                           txtVadieh2.Text.Trim, txtTozihat2.Text.Trim, Int(ddlNama.SelectedItem.Value), _
                                           ddlSokunat.SelectedIndex, txtTabagheh.Text.Trim, txtVahed.Text.Trim, txtKhab.Text.Trim, txtVahedForoosh.Text.Trim, txtMofid.Text.Trim, txtMosha.Text.Trim, txtKol.Text.Trim, _
                                           ddlKarbari.SelectedIndex, ddlMalekiat.SelectedIndex, ddlWC.SelectedIndex, EmkanatList.Items(0).Selected, EmkanatList.Items(1).Selected, EmkanatList.Items(2).Selected, EmkanatList.Items(3).Selected, EmkanatList.Items(4).Selected, _
                                           EmkanatList.Items(5).Selected, EmkanatList.Items(6).Selected, EmkanatList.Items(7).Selected, EmkanatList.Items(8).Selected, EmkanatList.Items(9).Selected, EmkanatList.Items(10).Selected, EmkanatList.Items(11).Selected, _
                                           EmkanatList.Items(12).Selected, txtTozihat2.Text.Trim, txtAgahi.Text.Trim)
            Case 4
                Apar.Update_Aparteman_Ejareh(Int(Request.QueryString("ID")), txtTel1.Text.Trim, txtTel2.Text.Trim, txtAddress.Text.Trim, _
                                             txtEjareh2.Text.Trim, txtTozihat2.Text.Trim, Int(ddlNama.SelectedItem.Value), _
                                             ddlSokunat.SelectedIndex, txtTabagheh.Text.Trim, txtVahed.Text.Trim, txtKhab.Text.Trim, txtVahedForoosh.Text.Trim, txtMofid.Text.Trim, txtMosha.Text.Trim, txtKol.Text.Trim, _
                                             ddlKarbari.SelectedIndex, ddlMalekiat.SelectedIndex, ddlWC.SelectedIndex, EmkanatList.Items(0).Selected, EmkanatList.Items(1).Selected, EmkanatList.Items(2).Selected, EmkanatList.Items(3).Selected, EmkanatList.Items(4).Selected, _
                                             EmkanatList.Items(5).Selected, EmkanatList.Items(6).Selected, EmkanatList.Items(7).Selected, EmkanatList.Items(8).Selected, EmkanatList.Items(9).Selected, EmkanatList.Items(10).Selected, EmkanatList.Items(11).Selected, _
                                             EmkanatList.Items(12).Selected, txtTozihat2.Text.Trim, txtAgahi.Text.Trim)
                '==========================================================================================================================
            Case 5
                'Response.Write("ali")
                Vila.Update_Vila_Foroosh(Int(Request.QueryString("ID").ToString), txtTel1_2.Text.Trim, txtTel2_2.Text.Trim, txtAddress_2.Text.Trim, _
                                         txtPriceKol_2.Text.Trim, txtPriceMetri_2.Text.Trim, txtTozihat1_2.Text.Trim, Int(ddlNama_2.SelectedItem.Value), _
                                         ddlSokunat_2.SelectedIndex, txtKhab_2.Text.Trim, txtMofid_2.Text.Trim, txtMosha_2.Text.Trim, txtKol_2.Text.Trim, _
                                         ddlKarbari_2.SelectedIndex, ddlMalekiat_2.SelectedIndex, ddlWC_2.SelectedIndex, EmkanatList_2.Items(0).Selected, EmkanatList_2.Items(1).Selected, EmkanatList_2.Items(2).Selected, EmkanatList_2.Items(3).Selected, EmkanatList_2.Items(4).Selected, _
                                         EmkanatList_2.Items(5).Selected, EmkanatList_2.Items(6).Selected, EmkanatList_2.Items(7).Selected, EmkanatList_2.Items(8).Selected, EmkanatList_2.Items(9).Selected, EmkanatList_2.Items(10).Selected, EmkanatList_2.Items(11).Selected, _
                                         EmkanatList_2.Items(12).Selected, txtTozihat2_2.Text.Trim, txtAgahi.Text.Trim)
            Case 6
                Vila.Update_Vila_RahnEjareh(Int(Request.QueryString("ID").ToString), txtTel1_2.Text.Trim, txtTel2_2.Text.Trim, txtAddress_2.Text.Trim, _
                                            txtVadieh1_2.Text.Trim, txtEjareh1_2.Text, txtTozihat1_2.Text.Trim, Int(ddlNama_2.SelectedItem.Value), _
                                            ddlSokunat_2.SelectedIndex, txtKhab_2.Text.Trim, txtMofid_2.Text.Trim, txtMosha_2.Text.Trim, txtKol_2.Text.Trim, _
                                            ddlKarbari_2.SelectedIndex, ddlMalekiat_2.SelectedIndex, ddlWC_2.SelectedIndex, EmkanatList_2.Items(0).Selected, EmkanatList_2.Items(1).Selected, EmkanatList_2.Items(2).Selected, EmkanatList_2.Items(3).Selected, EmkanatList_2.Items(4).Selected, _
                                            EmkanatList_2.Items(5).Selected, EmkanatList_2.Items(6).Selected, EmkanatList_2.Items(7).Selected, EmkanatList_2.Items(8).Selected, EmkanatList_2.Items(9).Selected, EmkanatList_2.Items(10).Selected, EmkanatList_2.Items(11).Selected, _
                                            EmkanatList_2.Items(12).Selected, txtTozihat2_2.Text.Trim, txtAgahi.Text.Trim)
            Case 7
                Vila.Update_Vila_Rahn(Int(Request.QueryString("ID").ToString), txtTel1_2.Text.Trim, txtTel2_2.Text.Trim, txtAddress_2.Text.Trim, _
                                      txtVadieh2_2.Text.Trim, txtTozihat1_2.Text.Trim, Int(ddlNama_2.SelectedItem.Value), _
                                      ddlSokunat_2.SelectedIndex, txtKhab_2.Text.Trim, txtMofid_2.Text.Trim, txtMosha_2.Text.Trim, txtKol_2.Text.Trim, _
                                      ddlKarbari_2.SelectedIndex, ddlMalekiat_2.SelectedIndex, ddlWC_2.SelectedIndex, EmkanatList_2.Items(0).Selected, EmkanatList_2.Items(1).Selected, EmkanatList_2.Items(2).Selected, EmkanatList_2.Items(3).Selected, EmkanatList_2.Items(4).Selected, _
                                      EmkanatList_2.Items(5).Selected, EmkanatList_2.Items(6).Selected, EmkanatList_2.Items(7).Selected, EmkanatList_2.Items(8).Selected, EmkanatList_2.Items(9).Selected, EmkanatList_2.Items(10).Selected, EmkanatList_2.Items(11).Selected, _
                                      EmkanatList_2.Items(12).Selected, txtTozihat2_2.Text.Trim, txtAgahi.Text.Trim)
            Case 8
                Vila.Update_Vila_Ejareh(Int(Request.QueryString("ID").ToString), txtTel1_2.Text.Trim, txtTel2_2.Text.Trim, txtAddress_2.Text.Trim, _
                                        txtEjareh2_2.Text.Trim, txtTozihat1_2.Text.Trim, Int(ddlNama_2.SelectedItem.Value), _
                                        ddlSokunat_2.SelectedIndex, txtKhab_2.Text.Trim, txtMofid_2.Text.Trim, txtMosha_2.Text.Trim, txtKol_2.Text.Trim, _
                                        ddlKarbari_2.SelectedIndex, ddlMalekiat_2.SelectedIndex, ddlWC_2.SelectedIndex, EmkanatList_2.Items(0).Selected, EmkanatList_2.Items(1).Selected, EmkanatList_2.Items(2).Selected, EmkanatList_2.Items(3).Selected, EmkanatList_2.Items(4).Selected, _
                                        EmkanatList_2.Items(5).Selected, EmkanatList_2.Items(6).Selected, EmkanatList_2.Items(7).Selected, EmkanatList_2.Items(8).Selected, EmkanatList_2.Items(9).Selected, EmkanatList_2.Items(10).Selected, EmkanatList_2.Items(11).Selected, _
                                        EmkanatList_2.Items(12).Selected, txtTozihat2_2.Text.Trim, txtAgahi.Text.Trim)
                '==========================================================================================================================
            Case 9
                Magh.Update_Maghazeh_Foroosh(Int(Request.QueryString("ID")), txtTel1_3.Text.Trim, txtTel2_3.Text.Trim, txtAddress_3.Text.Trim, _
                                             txtPriceKol_3.Text.Trim, txtPriceMetri_3.Text.Trim, txtTozihat1_3.Text.Trim, Int(ddlNama_3.SelectedItem.Value), _
                                             txtzirBana_3.Text.Trim, txtToolBar_3.Text.Trim, EmkanatList_3.Items(0).Selected, EmkanatList_3.Items(1).Selected, EmkanatList_3.Items(2).Selected, EmkanatList_3.Items(3).Selected, _
                                             EmkanatList_3.Items(4).Selected, EmkanatList_3.Items(5).Selected, txtTozihat2_3.Text.Trim, txtAgahi.Text.Trim, ddlMalekiat_3.SelectedIndex)
            Case 10
                Magh.Update_Maghazeh_RahnEjareh(Int(Request.QueryString("ID")), txtTel1_3.Text.Trim, txtTel2_3.Text.Trim, txtAddress_3.Text.Trim, _
                                                txtVadieh1_3.Text.Trim, txtEjareh1_3.Text.Trim, txtTozihat1_3.Text.Trim, Int(ddlNama_3.SelectedItem.Value), _
                                                txtzirBana_3.Text.Trim, txtToolBar_3.Text.Trim, EmkanatList_3.Items(0).Selected, EmkanatList_3.Items(1).Selected, EmkanatList_3.Items(2).Selected, EmkanatList_3.Items(3).Selected, _
                                                EmkanatList_3.Items(4).Selected, EmkanatList_3.Items(5).Selected, txtTozihat2_3.Text.Trim, txtAgahi.Text.Trim, ddlMalekiat_3.SelectedIndex)
            Case 11
                Magh.Update_Maghazeh_Rahn(Int(Request.QueryString("ID")), txtTel1_3.Text.Trim, txtTel2_3.Text.Trim, txtAddress_3.Text.Trim, _
                                          txtVadieh2_3.Text.Trim, txtTozihat1_3.Text.Trim, Int(ddlNama_3.SelectedItem.Value), _
                                          txtzirBana_3.Text.Trim, txtToolBar_3.Text.Trim, EmkanatList_3.Items(0).Selected, EmkanatList_3.Items(1).Selected, EmkanatList_3.Items(2).Selected, EmkanatList_3.Items(3).Selected, _
                                          EmkanatList_3.Items(4).Selected, EmkanatList_3.Items(5).Selected, txtTozihat2_3.Text.Trim, txtAgahi.Text.Trim, ddlMalekiat_3.SelectedIndex)
            Case 12
                Magh.Update_Maghazeh_Ejareh(Int(Request.QueryString("ID")), txtTel1_3.Text.Trim, txtTel2_3.Text.Trim, txtAddress_3.Text.Trim, _
                                            txtEjareh2_3.Text.Trim, txtTozihat1_3.Text.Trim, Int(ddlNama_3.SelectedItem.Value), _
                                            txtzirBana_3.Text.Trim, txtToolBar_3.Text.Trim, EmkanatList_3.Items(0).Selected, EmkanatList_3.Items(1).Selected, EmkanatList_3.Items(2).Selected, EmkanatList_3.Items(3).Selected, _
                                            EmkanatList_3.Items(4).Selected, EmkanatList_3.Items(5).Selected, txtTozihat2_3.Text.Trim, txtAgahi.Text.Trim, ddlMalekiat_3.SelectedIndex)
                '==========================================================================================================================
            Case 13
                Zamin.Update_Zamin_Foroosh(Int(Request.QueryString("ID")), txtTel1_4.Text.Trim, txtTel2_4.Text.Trim, txtAddress_4.Text.Trim, _
                                           txtPriceKol_4.Text.Trim, txtPriceMetri_4.Text.Trim, txtTozihat1_4.Text.Trim, txtzirBana_4.Text.Trim, _
                                           txtToolBar_4.Text.Trim, txtTozihat2_4.Text.Trim, txtAgahi.Text.Trim, ddlMalekiat_4.SelectedIndex)
                
        End Select
        '
    End Sub
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="text-align: right">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblTozihat" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="#3300CC"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    &nbsp;
                    عنوان اگهی :
                </td>
                <td>
                    <asp:TextBox ID="txtAgahi" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align: right">
        <table style="width: 100%">
            <tr>
                <td style="width: 100%">
    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="view_Apar" runat="server">
            <table dir="rtl">
            <tr>
                <td>    
                    <table>
                        <tr>
                            <td>
                                آدرس کامل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" Width="373px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                نوع کاربری :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlKarbari" runat="server" Width="111px">
                                    <asp:ListItem>مسکونی</asp:ListItem>
                                    <asp:ListItem>تجاری</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                &nbsp; &nbsp; وضعیت سکونت :</td>
                            <td>
                                <asp:DropDownList ID="ddlSokunat" runat="server" Width="111px">
                                    <asp:ListItem>مالک</asp:ListItem>
                                    <asp:ListItem>مستاجر</asp:ListItem>
                                    <asp:ListItem>تخلیه</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                نوع مالکیت :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMalekiat" runat="server" Width="111px">
                                    <asp:ListItem>سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی نسق</asp:ListItem>
                                    <asp:ListItem>نسق</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                            </td>
                            <td>
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
                                  تلفن ثابت ملک :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel1" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTel1"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;
                                تلفن همراه :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel2" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTel2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                تعداد طبقات :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTabagheh" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTabagheh"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;
                                تعداد واحد :
                            </td>
                            <td>
                                <asp:TextBox ID="txtVahed" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtVahed"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;&nbsp; واحد مورد نظر :</td>
                            <td>
                                <asp:TextBox ID="txtVahedForoosh" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVahedForoosh"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                تعداد خواب :
                            </td>
                            <td>
                                <asp:TextBox ID="txtKhab" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtKhab"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
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
                                نما :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlNama" runat="server" Width="111px" DataSourceID="SqlDS_Nama" DataTextField="NamaType" DataValueField="ID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDS_Nama" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                                    SelectCommand="SELECT * FROM [tblNamaType] ORDER BY [ID]"></asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp; &nbsp;
                                سرویس بهداشتی :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlWC" runat="server" Width="111px">
                                    <asp:ListItem>ایرانی</asp:ListItem>
                                    <asp:ListItem>ایرانی فرنگی</asp:ListItem>
                                    <asp:ListItem>فرنگی</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
            </tr>
        <%If MoamelehID = 1 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td>
                                قیمت متری :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceMetri" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label><span
                                    style="color: #cc0033"></span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPriceMetri"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp; قیمت کل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceKol" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPriceKol"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                    
                    
                    </asp:Panel>
                </td>
            </tr>
            <%End If%>
        <%If MoamelehID = 2 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel2" runat="server">
                    <table>
                <tr>
                    <td>
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh1" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtVadieh1"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>
                        &nbsp; &nbsp; &nbsp;&nbsp; اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh1" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtEjareh1"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>           
                </td>
            </tr>
            <%End If%>
        <%If MoamelehID = 3 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel3" runat="server">
                    <table>
                <tr>
                    <td>
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtVadieh2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>                    
                    </asp:Panel>         
                </td>
            </tr>
            <%end if%>
            <%If MoamelehID = 4 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel4" runat="server">
                    <table>
                <tr>
                    <td>
                        اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="txtEjareh2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>             
                </td>
            </tr>
            <%End If%>
    <tr>
        <td>
            <table>
                        <tr>
                            <td>
                                توضیحات قیمت :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTozihat1" runat="server" Width="390px"></asp:TextBox>
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
                                <span style="color: #0000cc">متراژ &nbsp; &nbsp; &nbsp; </span></td>
                            <td>
                                مفید :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMofid" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtMofid"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;
                                مشاء :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMosha" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtMosha"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;
                                کل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtKol" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtKol"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="color: #3300cc"><span style="color: #0000cc">
                        <br />
                    امکانات</span><br />
                    </span>
                    <br />
                        <asp:CheckBoxList ID="EmkanatList" runat="server" Height="31px" RepeatColumns="6"
                            RepeatDirection="Horizontal" Width="527px">
                            <asp:ListItem>اشپزخانه Open</asp:ListItem>
                            <asp:ListItem>آب</asp:ListItem>
                            <asp:ListItem>برق</asp:ListItem>
                            <asp:ListItem>گاز</asp:ListItem>
                            <asp:ListItem>تلفن</asp:ListItem>
                            <asp:ListItem>پکیج</asp:ListItem>
                            <asp:ListItem>شوفاژ</asp:ListItem>
                            <asp:ListItem>اسپیلت</asp:ListItem>
                            <asp:ListItem>شومینه</asp:ListItem>
                            <asp:ListItem>انباری</asp:ListItem>
                            <asp:ListItem>پارکینگ</asp:ListItem>
                            <asp:ListItem>آسانسور</asp:ListItem>
                            <asp:ListItem>در کنترلی</asp:ListItem>
                        </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td>
                    <br />
                    <table>
                        <tr>
                            <td>
                                توضیحات :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTozihat2" runat="server" Width="390px"></asp:TextBox>
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>        
        </asp:View>
<!--====================================================================================-->        
<!--====================================================================================-->        
<!--====================================================================================-->        
        <asp:View ID="view_Vila" runat="server">
            <table dir="rtl">
            <tr>
                <td style="height: 48px">    
                    <table>
                        <tr>
                            <td>
                                آدرس کامل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress_2" runat="server" Width="373px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                نوع کاربری :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlKarbari_2" runat="server" Width="111px">
                                    <asp:ListItem>مسکونی</asp:ListItem>
                                    <asp:ListItem>تجاری</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                &nbsp; &nbsp; وضعیت سکونت :</td>
                            <td>
                                <asp:DropDownList ID="ddlSokunat_2" runat="server" Width="111px">
                                    <asp:ListItem>مالک</asp:ListItem>
                                    <asp:ListItem>مستاجر</asp:ListItem>
                                    <asp:ListItem>تخلیه</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                نوع مالکیت :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMalekiat_2" runat="server" Width="111px">
                                    <asp:ListItem>سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی نسق</asp:ListItem>
                                    <asp:ListItem>نسق</asp:ListItem>
                                </asp:DropDownList>
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
                                تلفن ثابت ملک :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel1_2" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtTel1_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;
                                تلفن همراه :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel2_2" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtTel2_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                تعداد خواب :
                            </td>
                            <td>
                                <asp:TextBox ID="txtKhab_2" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtKhab_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                نما :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlNama_2" runat="server" Width="111px" DataSourceID="SqlDS_Nama_2" DataTextField="NamaType" DataValueField="ID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDS_Nama_2" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                                    SelectCommand="SELECT * FROM [tblNamaType] ORDER BY [ID]"></asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp; &nbsp;
                                سرویس بهداشتی :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlWC_2" runat="server" Width="111px">
                                    <asp:ListItem>ایرانی</asp:ListItem>
                                    <asp:ListItem>ایرانی فرنگی</asp:ListItem>
                                    <asp:ListItem>فرنگی</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%If MoamelehID = 1 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel5" runat="server">
                    <table>
                        <tr>
                            <td>
                                قیمت متری :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceMetri_2" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label><span
                                    style="color: #cc0033"></span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtPriceMetri_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp; قیمت کل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceKol_2" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtPriceKol_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                    
                    
                    </asp:Panel>
                </td>
            </tr>
            <%End If%>
            <%If MoamelehID = 2 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel6" runat="server">
                    <table>
                <tr>
                    <td>
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh1_2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label10" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtVadieh1_2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>
                        &nbsp; &nbsp; &nbsp;&nbsp; اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh1_2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label11" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtEjareh1_2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>           
                </td>
            </tr>
            <%End If%>
            <%If MoamelehID = 3 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel7" runat="server">
                    <table>
                <tr>
                    <td>
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh2_2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label12" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtVadieh2_2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>                    
                    </asp:Panel>         
                </td>
            </tr>
            <%end if %>
            <%If MoamelehID = 4 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel8" runat="server">
                    <table>
                <tr>
                    <td>
                        اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh2_2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label13" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtEjareh2_2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>             
                </td>
            </tr>
            <%End If%>
    <tr>
        <td>
            <table>
                        <tr>
                            <td>
                                توضیحات قیمت :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTozihat1_2" runat="server" Width="390px"></asp:TextBox>
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
                                <span style="color: #0000cc">متراژ &nbsp; &nbsp; &nbsp; </span></td>
                            <td>
                                مفید :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMofid_2" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtMofid_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;
                                مشاء :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMosha_2" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtMosha_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp;
                                کل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtKol_2" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtKol_2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="color: #3300cc"><span style="color: #0000cc">
                        <br />
                    امکانات</span><br />
                    </span>
                    <br />
                        <asp:CheckBoxList ID="EmkanatList_2" runat="server" Height="31px" RepeatColumns="6"
                            RepeatDirection="Horizontal" Width="527px">
                            <asp:ListItem>اشپزخانه Open</asp:ListItem>
                            <asp:ListItem>آب</asp:ListItem>
                            <asp:ListItem>برق</asp:ListItem>
                            <asp:ListItem>گاز</asp:ListItem>
                            <asp:ListItem>تلفن</asp:ListItem>
                            <asp:ListItem>پکیج</asp:ListItem>
                            <asp:ListItem>شوفاژ</asp:ListItem>
                            <asp:ListItem>اسپیلت</asp:ListItem>
                            <asp:ListItem>شومینه</asp:ListItem>
                            <asp:ListItem>انباری</asp:ListItem>
                            <asp:ListItem>پارکینگ</asp:ListItem>
                            <asp:ListItem>آسانسور</asp:ListItem>
                            <asp:ListItem>در کنترلی</asp:ListItem>
                        </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td>
                    <br />
                    <table>
                        <tr>
                            <td>
                                توضیحات :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTozihat2_2" runat="server" Width="390px"></asp:TextBox>
                                </td>
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
            <table dir="rtl">
            <tr>
                <td>    
                    <table>
                        <tr>
                            <td>
                                آدرس کامل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress_3" runat="server" Width="373px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtAddress_3"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                تلفن ثابت ملک :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel1_3" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtTel1_3"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td style="color: #000000">
                                &nbsp; &nbsp;&nbsp; تلفن همراه :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel2_3" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtTel2_3"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                نوع مالکیت :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMalekiat_3" runat="server" Width="111px">
                                    <asp:ListItem>سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی نسق</asp:ListItem>
                                    <asp:ListItem>نسق</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                            </td>
                            <td>
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
                                نما :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlNama_3" runat="server" Width="111px" DataSourceID="SqlDS_Nama_3" DataTextField="NamaType" DataValueField="ID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDS_Nama_3" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                                    SelectCommand="SELECT * FROM [tblNamaType] ORDER BY [ID]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%If MoamelehID = 1 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel9" runat="server">
                    <table>
                        <tr>
                            <td>
                                قیمت متری :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceMetri_3" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label><span
                                    style="color: #cc0033"></span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtPriceMetri_3"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp; قیمت کل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceKol_3" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtPriceKol_3"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                    
                    
                    </asp:Panel>
                </td>
            </tr>
            <%end if %>
            <%If MoamelehID = 2 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel10" runat="server">
                    <table>
                <tr>
                    <td>
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh1_3" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label15" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtVadieh1_3"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>
                        &nbsp; &nbsp; &nbsp;&nbsp; اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh1_3" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label16" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtEjareh1_3"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>           
                </td>
            </tr>
            <%End If%>
            <%If MoamelehID = 3 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel11" runat="server">
                    <table>
                <tr>
                    <td>
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh2_3" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label17" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtVadieh2_3"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>                    
                    </asp:Panel>         
                </td>
            </tr>
           <%end if %>
            <%If MoamelehID = 4 Then%>
            <tr>
                <td>
                    <asp:Panel ID="Panel12" runat="server">
                    <table>
                <tr>
                    <td>
                        اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh2_3" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label18" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtEjareh2_3"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>             
                </td>
            </tr>
            <%End If%>
            <tr>
        <td>
            <table>
                        <tr>
                            <td>
                                توضیحات قیمت :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTozihat1_3" runat="server" Width="390px"></asp:TextBox>
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
                                <span style="color: #0000cc">متراژ &nbsp; &nbsp; &nbsp; </span></td>
                            <td>
                                زیربنا :
                            </td>
                            <td>
                                <asp:TextBox ID="txtzirBana_3" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtzirBana_3"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</td>
                            <td style="color: #000000">
                                &nbsp; &nbsp;&nbsp; طول بر :
                            </td>
                            <td>
                                <asp:TextBox ID="txtToolBar_3" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtToolBar_3"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="color: #3300cc"><span style="color: #0000cc">
                        <br />
                    امکانات</span><br />
                    </span>
                    <br />
                        <asp:CheckBoxList ID="EmkanatList_3" runat="server" Height="31px" RepeatColumns="6"
                            RepeatDirection="Horizontal" Width="527px">
                            <asp:ListItem>انباری</asp:ListItem>
                            <asp:ListItem>تلفن</asp:ListItem>
                            <asp:ListItem>پارکینگ</asp:ListItem>
                            <asp:ListItem>برق سه فاز</asp:ListItem>
                            <asp:ListItem>آب</asp:ListItem>
                            <asp:ListItem>گاز</asp:ListItem>
                        </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td>
                    <br />
                    <table>
                        <tr>
                            <td>
                                توضیحات :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTozihat2_3" runat="server" Width="390px"></asp:TextBox>
                                </td>
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
            <table dir="rtl">
            <tr>
                <td>    
                    <table>
                        <tr>
                            <td>
                                آدرس کامل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress_4" runat="server" Width="373px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtAddress_4"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
    <tr>
        <td>
                    <table>
                        <tr>
                            <td>
                                نوع مالکیت :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMalekiat_4" runat="server" Width="111px">
                                    <asp:ListItem>سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی سند دار</asp:ListItem>
                                    <asp:ListItem>اوقافی نسق</asp:ListItem>
                                    <asp:ListItem>نسق</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
        </td>
    </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                        </tr>
                        <tr>
                            <td>
                                تلفن ثابت ملک :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel1_4" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtTel1_4"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td style="color: #000000">
                                &nbsp; &nbsp;&nbsp; تلفن همراه :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel2_4" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="txtTel2_4"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td>
                        قیمت متری :</td>
                    <td>
                        <asp:TextBox ID="txtPriceMetri_4" runat="server" Width="60px"></asp:TextBox>
                        <asp:Label ID="Label19" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="txtPriceMetri_4"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>
                        قیمت کل :</td>
                    <td>
                        <asp:TextBox ID="txtPriceKol_4" runat="server" Width="60px"></asp:TextBox>
                        <asp:Label ID="Label20" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="txtPriceKol_4"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
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
                        توضیحات :</td>
                    <td>
                        <asp:TextBox ID="txtTozihat1_4" runat="server" Width="390px"></asp:TextBox>
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
                                <span style="color: #0000cc">متراژ &nbsp; : &nbsp; &nbsp;&nbsp; &nbsp; </span></td>
                            <td>
                                مساحت زمین :
                            </td>
                            <td>
                                <asp:TextBox ID="txtzirBana_4" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtzirBana_4"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</td>
                            <td style="color: #000000">
                                &nbsp; &nbsp;&nbsp; طول بر :
                            </td>
                            <td>
                                <asp:TextBox ID="txtToolBar_4" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="txtToolBar_4"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                توضیحات :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTozihat2_4" runat="server" Width="390px"></asp:TextBox>
                                </td>
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
                </td>
            </tr>
        </table>
    </div>
    <br />
    <center>
    <table style="width: 40%">
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="ذخیره" Width="90px" /></td>
            <td>
                <asp:Button ID="btnCancel" runat="server" Text="بازگشت به لیست" ValidationGroup="Return"
                    Width="90px" PostBackUrl="~/Membership/AmlakList.aspx" /></td>
        </tr>
    </table>
    </center>
    <br />
    <br />
</asp:Content>

