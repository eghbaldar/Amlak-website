<%@ Page Language="VB" MasterPageFile="~/CMS/MasterPage.master" %>


<script runat="server">
    Public MelkID As Integer

    Protected Sub Wizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs)
        lblTozihat.Text = "استان " + ddlOstan.SelectedItem.Text + " - " + "شهر " + ddlShahr.SelectedItem.Text + " - " + ddlMoameleh.SelectedItem.Text + " مغازه"
        Panel1.Visible = False
        Panel2.Visible = False
        Panel3.Visible = False
        Panel4.Visible = False
        Select Case ddlMoameleh.SelectedIndex
            Case 0
                Panel1.Visible = True
            Case 1
                Panel2.Visible = True
            Case 2
                Panel3.Visible = True
            Case 3
                Panel4.Visible = True
        End Select
    End Sub

    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs)
        Select Case ddlMoameleh.SelectedIndex
            Case 0
                SaveItems(0)
            Case 1
                SaveItems(1)
            Case 2
                SaveItems(2)
            Case 3
                SaveItems(3)
        End Select
    End Sub
    
    Private Sub SaveItems(ByVal ItemType As Byte)
        Dim Magh As Amlak.DAL.Maghazeh
        Dim Result As Byte
        Select Case ItemType
            Case 0
                'Int(ddlMantagheh.SelectedItem.Value)
                Result = Magh.Insert_Maghazeh_Foroosh(Session("UserName").ToString(), 1, Int(ddlOstan.SelectedItem.Value), Int(ddlShahr.SelectedItem.Value), 1, _
                                                      txtTel1.Text.Trim, txtTel2.Text.Trim, txtAddress.Text.Trim, _
                                                      txtPriceKol.Text.Trim, txtPriceMetri.Text.Trim, txtTozihat1.Text.Trim, _
                                                      Int(ddlNama.SelectedItem.Value), _
                                                      txtzirBana.Text.Trim, txtToolBar.Text.Trim.Trim, _
                                                      EmkanatList.Items(0).Selected, EmkanatList.Items(1).Selected, EmkanatList.Items(2).Selected, EmkanatList.Items(3).Selected, _
                                                      EmkanatList.Items(4).Selected, EmkanatList.Items(5).Selected, txtTozihat2.Text.Trim, "", ddlMalekiat.SelectedIndex)
                                                     
            Case 1
                Result = Magh.Insert_Maghazeh_RahnEjareh(Session("UserName").ToString(), 1, Int(ddlOstan.SelectedItem.Value), Int(ddlShahr.SelectedItem.Value), 1, _
                                                         txtTel1.Text.Trim, txtTel2.Text.Trim, txtAddress.Text.Trim, txtVadieh1.Text.Trim, txtEjareh1.Text.Trim, txtTozihat1.Text.Trim, _
                                                         Int(ddlNama.SelectedItem.Value), _
                                                         txtzirBana.Text.Trim, txtToolBar.Text.Trim.Trim, _
                                                         EmkanatList.Items(0).Selected, EmkanatList.Items(1).Selected, EmkanatList.Items(2).Selected, EmkanatList.Items(3).Selected, _
                                                         EmkanatList.Items(4).Selected, EmkanatList.Items(5).Selected, txtTozihat2.Text.Trim, "", ddlMalekiat.SelectedIndex)
                
                
            Case 2
                Result = Magh.Insert_Maghazeh_Rahn(Session("UserName").ToString(), 1, Int(ddlOstan.SelectedItem.Value), Int(ddlShahr.SelectedItem.Value), 1, _
                                                   txtTel1.Text.Trim, txtTel2.Text.Trim, txtAddress.Text.Trim, txtVadieh2.Text.Trim, txtTozihat1.Text.Trim, _
                                                   Int(ddlNama.SelectedItem.Value), _
                                                   txtzirBana.Text.Trim, txtToolBar.Text.Trim, _
                                                   EmkanatList.Items(0).Selected, EmkanatList.Items(1).Selected, EmkanatList.Items(2).Selected, EmkanatList.Items(3).Selected, _
                                                   EmkanatList.Items(4).Selected, EmkanatList.Items(5).Selected, txtTozihat2.Text.Trim, "", ddlMalekiat.SelectedIndex)
            
            Case 3
                Result = Magh.Insert_Maghazeh_Ejareh(Session("UserName").ToString(), 1, Int(ddlOstan.SelectedItem.Value), Int(ddlShahr.SelectedItem.Value), 1, _
                                                     txtTel1.Text.Trim, txtTel2.Text.Trim, txtAddress.Text.Trim, _
                                                     txtEjareh2.Text.Trim, txtTozihat2.Text, _
                                                     Int(ddlNama.SelectedItem.Value), _
                                                     txtzirBana.Text.Trim, txtToolBar.Text.Trim, _
                                                     EmkanatList.Items(0).Selected, EmkanatList.Items(1).Selected, EmkanatList.Items(2).Selected, EmkanatList.Items(3).Selected, _
                                                     EmkanatList.Items(4).Selected, EmkanatList.Items(5).Selected, txtTozihat2.Text.Trim, "", ddlMalekiat.SelectedIndex)

        End Select
        If Result <> 0 Then
            lblPayam.Text = "اطلاعات ملک شما با موفقیت ثبت گردید" + "<br /><br />" + "پس از تایید مدیریت اطلاعات شما در سایت به نمایش گذاشته می شود"
            lblTemp.Text = Result
        Else
            lblPayam.Text = "به علت بروز خطا، اطلاعات شما ثبت نگردید"
            FileUpload1.Visible = False
            FileUpload2.Visible = False
            FileUpload3.Visible = False
            FileUpload4.Visible = False
            lblPic1.Visible = False
            lblPic2.Visible = False
            lblPic3.Visible = False
            lblPic4.Visible = False
            lblMsg.Visible = False
            btnSendImage.Visible = False
        End If
    End Sub
    
    Private Function MakeFileName(ByVal FileName As String, ByVal MelkID As Integer) As String
        Dim tempfile As String() = FileName.Split(".")
        Dim fileExt As String = tempfile(tempfile.GetUpperBound(0))
        Dim ServerSavePath As String = "\Images\AmlakPic\"

        Dim newFile As String = ServerSavePath + MelkID.ToString + "_" + Guid.NewGuid.ToString.Replace("-", "") + "." + fileExt
        Return newFile
    End Function

    Private Sub InsertData(ByVal fu As FileUpload, ByVal MelkID As Integer)
        '
        Dim Resize As New ImageUtil
        Dim newFileName1 As String = MakeFileName(fu.FileName, MelkID)
        Dim newFileName2 As String = MakeFileName(fu.FileName, MelkID)

        Dim cmdText As String = "INSERT INTO tblPic(MelkID, OrginalPic, LittlePic) VALUES(@MelkID, @OrginalPic, @LittlePic)"
        Dim objCnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString)
        Dim objCmd As SqlCommand = New SqlCommand(cmdText, objCnn)

        Try
            objCnn.Open()
            objCmd.Parameters.AddWithValue("@MelkID", MelkID)
            objCmd.Parameters.AddWithValue("@OrginalPic", newFileName1)
            objCmd.Parameters.AddWithValue("@LittlePic", newFileName2)
            objCmd.ExecuteNonQuery()
            objCmd.Dispose()
            objCnn.Close()
        Catch ex As Exception
            'Response.Write(ex.Message)
        End Try

        newFileName1 = Request.PhysicalApplicationPath + newFileName1
        newFileName2 = Request.PhysicalApplicationPath + newFileName2
        
        fu.SaveAs(newFileName1)
        Resize.ResizeImageFile(newFileName1, newFileName2, 125, 100)
        '
    End Sub
    
    Protected Sub btnSendImage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ServerSavePath As String = Request.PhysicalApplicationPath + "Images\AmlakPic\"
        MelkID = Convert.ToInt32(lblTemp.Text)
        If FileUpload1.HasFile = True Then
            InsertData(FileUpload1, MelkID)
            FileUpload1.Visible = False
            lblPic1.Visible = False
        End If
        '
        If FileUpload2.HasFile = True Then
            InsertData(FileUpload2, MelkID)
            FileUpload2.Visible = False
            lblPic2.Visible = False
        End If
        '
        If FileUpload3.HasFile = True Then
            InsertData(FileUpload3, MelkID)
            FileUpload3.Visible = False
            lblPic3.Visible = False
        End If
        '
        If FileUpload4.HasFile = True Then
            InsertData(FileUpload4, MelkID)
            FileUpload4.Visible = False
            lblPic4.Visible = False
        End If
        '
        If FileUpload1.Visible = False And FileUpload2.Visible = False And FileUpload3.Visible = False And FileUpload4.Visible = False Then
            lblMsg.Visible = False
            btnSendImage.Visible = False
        End If

    End Sub
     
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim F As New UtilityFunction
        F.FarsiSaz(Me)
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="text-align: right">
        <table style="width: 100%">
            <tr>
                <td>
                    <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="False" Height="344px" Width="592px" ActiveStepIndex="0" StartNextButtonText="مرحله بعد" StepNextButtonText="مرحله بعد" FinishCompleteButtonText="پایان" FinishPreviousButtonText="مرحله قبل" OnNextButtonClick="Wizard1_NextButtonClick" OnFinishButtonClick="Wizard1_FinishButtonClick" StepPreviousButtonText="مرحله قبل">
        <StepStyle VerticalAlign="Top"/>
        <NavigationStyle HorizontalAlign="Center" />
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1" StepType="Start">
                <br />
                <br />
                <table>
                    <tr>
                        <td>
                            استان :</td>
                        <td>
                            <asp:DropDownList ID="ddlOstan" runat="server" Width="130px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="OstanName" DataValueField="ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                                SelectCommand="SELECT [ID], [CountryID], [OstanName] FROM [tblOstan] ORDER BY [OstanName]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شهر :</td>
                        <td>
                            <asp:DropDownList ID="ddlShahr" runat="server" Width="130px" DataSourceID="SqlDataSource2" DataTextField="ShahrName" DataValueField="ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                                SelectCommand="SELECT [ID], [OstanID], [ShahrName] FROM [tblShahr] WHERE ([OstanID] = @OstanID) ORDER BY [ShahrName]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlOstan" Name="OstanID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نوع معامله :</td>
                        <td>
                            <asp:DropDownList ID="ddlMoameleh" runat="server" Width="130px">
                                <asp:ListItem>فروش</asp:ListItem>
                                <asp:ListItem>رهن و اجاره</asp:ListItem>
                                <asp:ListItem>رهن</asp:ListItem>
                                <asp:ListItem>اجاره</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2" StepType="Finish">
                <br />
                <br />
<table dir="rtl">
            <tr>
                <td>
                    <asp:Label ID="lblTozihat" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="#3300CC"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>    
                    <table>
                        <tr>
                            <td style="width:100px">
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
                            <td style="width:100px">
                                تلفن ثابت ملک :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel1" runat="server" Width="80px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTel1"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td style="color: #000000">
                                &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; تلفن همراه :
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
                            <td style="width:100px">
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
                            <td style="width:100px">
                                نما :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlNama" runat="server" Width="111px" DataSourceID="SqlDS_Nama" DataTextField="NamaType" DataValueField="ID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDS_Nama" runat="server" ConnectionString="<%$ ConnectionStrings:AmlakConnectionString %>"
                                    SelectCommand="SELECT * FROM [tblNamaType] ORDER BY [ID]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td style="width:100px">
                                قیمت متری :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceMetri" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label><span
                                    style="color: #cc0033"></span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPriceMetri"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp; &nbsp; قیمت کل :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPriceKol" runat="server" Width="80px"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPriceKol"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                    </table>
                    
                    
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel2" runat="server">
                    <table>
                <tr>
                    <td style="width:100px">
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh1" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtVadieh1"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td>
                        &nbsp;&nbsp;&nbsp; اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh1" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtEjareh1"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>           
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel3" runat="server">
                    <table>
                <tr>
                    <td style="width:100px">
                        ودیعه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtVadieh2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtVadieh2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>                    
                    </asp:Panel>         
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel4" runat="server">
                    <table>
                <tr>
                    <td style="width:100px">
                        اجاره ماهانه :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEjareh2" runat="server" Width="63px"></asp:TextBox>
                        <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="(ریال)"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="txtEjareh2"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
                    </asp:Panel>             
                </td>
            </tr>
            <tr>
        <td>
            <table>
                        <tr>
                            <td style="width:100px">
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
                                <span style="color: #0000cc">متراژ &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span></td>
                            <td>
                                زیربنا :
                            </td>
                            <td>
                                <asp:TextBox ID="txtzirBana" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtzirBana"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</td>
                            <td style="color: #000000">
                                &nbsp; &nbsp;&nbsp; طول بر :
                            </td>
                            <td>
                                <asp:TextBox ID="txtToolBar" runat="server" Width="30px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtToolBar"
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
                            <td style="width:100px">
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
                <!--=============================================================================-->
            </asp:WizardStep>
            
            <asp:WizardStep ID="WizardStep4" runat="server" StepType="Complete" Title="Step 4">
                <center>
                <div style="text-align: center">
                    <center>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                &nbsp;<br />
                                <center>
                                    <asp:Label ID="lblPayam" runat="server" Font-Names="Tahoma" ForeColor="ForestGreen"></asp:Label>
                                </center>
                                <br />
                                <br />
                                <center>
                                    <asp:Button ID="Button1" runat="server" PostBackUrl="~/CMS/Default.aspx" Text="بازگشت به صفحه اصلی" />
                                </center>
                            </td>
                        </tr>
                    </table>
                    </center>
                </div>
                <br />
                <hr style="width: 409px; height: 1px" />
                    &nbsp;<br />
                <div style="text-align: center">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblMsg" runat="server" Text="افزودن عکس برای املاک اختیاری می باشد" Font-Bold="True" Font-Size="12pt" ForeColor="#FF0033"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblPic1" runat="server" Text="عکس شماره 1 :"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="331px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPic2" runat="server" Text="عکس شماره 2 :"></asp:Label>
                            </td>
                            <td><asp:FileUpload ID="FileUpload2" runat="server" Width="331px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPic3" runat="server" Text="عکس شماره 3 :"></asp:Label>
                            </td>
                            <td><asp:FileUpload ID="FileUpload3" runat="server" Width="331px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPic4" runat="server" Text="عکس شماره 4 :"></asp:Label>
                            </td>
                            <td><asp:FileUpload ID="FileUpload4" runat="server" Width="331px" />
                            </td>
                        </tr>
                    </table>
                    &nbsp;</center>
                <center>
                    <table>
                        <tr>
                            <td style="width: 100px">
                                <asp:Button ID="btnSendImage" runat="server" Text="ارسال عکس ها" OnClick="btnSendImage_Click" />
                            </td>
                        </tr>
                    </table>
                </center>
            </asp:WizardStep>
        </WizardSteps>
        <StartNextButtonStyle Width="70px" />
        <FinishCompleteButtonStyle Width="70px" />
        <FinishPreviousButtonStyle Width="70px" />
    </asp:Wizard>
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="lblTemp" runat="server" Visible="False"></asp:Label>
</asp:Content>

