
Module dbConnectin

    'Public StrConnection As String = "Data Source=8020co\sqlexpress;Initial Catalog=Amlak;Integrated Security=True"
    Public StrConnection As String = ConfigurationManager.ConnectionStrings("AmlakConnectionString").ToString

End Module
