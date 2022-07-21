var UnicodeString = ' !"#$٪،گ)(٭+و-./۰۱۲۳۴۵۶۷۸۹:ك,=.؟@ِذ}ىُىلآ÷ـ،/’د×؛َءٍف‘{ًْإ~جژچ^_پشذزيثبلاهتنمئدخحضقسفعرصطغظ<|>ّ';


function CheckUnicode()
{
	var key = window.event.keyCode;
	if(key > 47 && key < 58) return true;
	if(key < 32)return true;
	if(key >= 128)
	{
		alert("تغيير دهيد EN لطفا زبان صفحه کليد را به");
		return false;
	}
	editor.fireEvent("onfocus");
	if(editor.lang.toString()=="Fa")
	{
		window.event.keyCode = UnicodeString.charCodeAt(key-32);
		return true;
	}
	return true;
}

function KeyDown()
{
	if(window.event.shiftKey && window.event.ctrlKey)
	{
		editor = event.srcElement;
		if(editor.lang.toString() == "Fa")
			editor.lang = "En";
		else
			editor.lang = "Fa";
		editor.fireEvent("onfocus");
		return false;
	}
}

function KeyUp()
{ 
	if(window.event.keyCode == 13)
		return;
	editor = event.srcElement;
    str = editor.value;
    if(str.charAt(str.length-1)=="\n")
		if(editor.lang.toString()=="Fa") editor.dir = "rtl";
		else editor.dir = "ltr";
	else if(str == "")
		if(editor.lang.toString()=="Fa") editor.dir = "rtl";
		else editor.dir = "ltr";
}

function ShowLangStatus()
{
	editor = event.srcElement;
	str = "زبان جاري : "
	if(editor.lang.toString()=="Fa")
		str += "فارسي";
	else
		str += "انگليسي";
	window.status = str;
}

function ClearStatus()
{
	window.status='';
}