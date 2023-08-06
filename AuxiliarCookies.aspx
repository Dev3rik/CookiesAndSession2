<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuxiliarCookies.aspx.cs" Inherits="registerStudents.AuxiliarCookies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/modernizr-2.8.3.js"></script>
        <script defer="defer" type="text/javascript" src="Scripts/Javita/cookie.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="mb-3">
                <label>
                    Sesion enviada por:<br />
                </label>
                <a></a>
                <asp:Label ID="InformacionNom" runat="server" Text=""></asp:Label>
                <asp:Label ID="InformacionApe" runat="server" Text=""></asp:Label>
            </div>
            <div class="row ">
            <div class="col-md-1 mb-3">
                <asp:Button class="btn btn-success" ID="BotonCookies" runat="server" UseSubmitBehavior="false" Text="Mostrar Cookies" OnClientClick="return Cookie()" />

            </div>
            <div class="col-md-1">
                <asp:Button class="btn btn-success" ID="CerrarSesion" runat="server" Text="Cerrar session" OnClick="Cerrar_Session" UseSubmitBehavior="true"/>
            </div>


            </div>
            <div class="col-md-5 ">
                <asp:TextBox ID="Cookies" class="form-control" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>

            </div>
        </div>
    </form>
</body>
</html>
