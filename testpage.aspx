<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testpage.aspx.cs" Inherits="testpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript">
        //Called this method on any button click  event for Testing
        function MyFunction(Param1, Param2) {
            test = new Array();
            test = document.getElementsByName("test")
            name = "";
            for (i = 0; i < test.length; i++)
            {
                name = name + test[i].value + ",";
            }
            $.ajax({
                type: "POST",
                url: "MyPage.aspx/MyMethod",
                data: "{ test1: '" + name + "',Param2: '" + Param2 + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: "true",
                cache: "false",
                success: function (msg) {
                    alert("Done");
                },
                Error: function (x, e) {
                    alert("Error");
                }
            });
        }
</script> 
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="button" value="submit" id="btn" onclick="MyFunction()" />
        <input type="hidden" name="test" value="Hello" />'
        <input type="hidden" name="test" value="Hello2" />
    </div>
    </form>
</body>
</html>
