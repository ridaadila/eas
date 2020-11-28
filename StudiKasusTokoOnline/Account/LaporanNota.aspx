<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LaporanNota.aspx.cs" Inherits="StudiKasusTokoOnline.Account.LaporanNota" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="smReport" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="rvLaporan" runat="server" Width="800"></rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
