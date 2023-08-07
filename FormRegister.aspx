<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormRegister.aspx.cs" Inherits="registerStudents.FormRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--JQuery-->
    <script type="text/javascript" src="/Scripts/jquery-3.4.1.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/modernizr-2.8.3.js"></script>
    <title>Registro de estudiantes</title>
    <script defer="defer" type="text/javascript" src="Scripts/Javita/formularioEstudiante.js"></script>
</head>
<body>

    <form id="form1" runat="server">

        <div class="text-bg-dark p-3 mb-4">REGISTRO DE ESTUDIANTES</div>
        <div class="container">
            <div class="row g-3 mb-4">
                <div class="col-md-1">
                    <label for="name" class="col-form-label">Nombre</label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox class="form-control" ID="Nombre" runat="server" placeholder="FIRST NAME"></asp:TextBox>
                </div>
            </div>
            <div class="row g-3 mb-4">
                <div class="col-md-1">
                    <label for="ApellidoText" class="col-form-label">Apellido</label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox class="form-control" ID="Apellido" runat="server" PlaceHolder="LAST NAME"></asp:TextBox>
                </div>
            </div>

            <div class="col-sm-6 p-2 rounded" id="ValidationInputs" style="display: none">
                <div class="mb-1" id="text"></div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-md-1">
                    <label class="form-check-label" for="insertSexo">Sexo</label>
                </div>
                <div class="col-md-3">
                    <asp:RadioButton ID="Masculino" runat="server" GroupName="sexo"></asp:RadioButton>
                    <label class="form-check-label">Masculino</label>
                    <asp:RadioButton ID="Femenino" runat="server" GroupName="sexo"></asp:RadioButton>
                    <label class="form-check-label">Femenino</label>
                </div>
            </div>
            <div class="row g-3 mb-4">
                <div class="col-md-1">
                    <label for="EmailText" class="col-form-label">Email</label>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-text" id="addon-wrapping">@</span>
                        <asp:TextBox class="form-control" ID="Email" runat="server" PlaceHolder="EMAIL"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row g-3 mb-5">
                <div class="col-md-1">
                    <label for="DireccionText" class="col-form-label">Direccion</label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox class="form-control" ID="Direccion" runat="server" PlaceHolder="DIRECTION"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label for="DepartamenteText" class="col-form-label">Departamento</label>
                </div>
                <div class="col-md-2">
                    <asp:DropDownList class="btn btn-light text-center" runat="server" ID="Departamento">
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row g-3">
                <div>
                    <label>Requerimientos</label>
                </div>
                <div class="col-md-5">
                    <asp:TextBox ID="Requerimientos" runat="server" class="form-control" TextMode="MultiLine" Rows="4" PlaceHolder="REQUERIMIENTOS"></asp:TextBox>
                </div>
            </div>

            <div class="text-center mb-5">
                <asp:Button class="btn btn-warning" runat="server" Text="Limpiar" UseSubmitBehavior="false" OnClientClick="return limpiar()"></asp:Button>
                <asp:Button class="btn btn-success" ID="BotonEnviar" runat="server" Text="Enviar" UseSubmitBehavior="true" OnClick="BotonEnviar_Click" OnClientClick="return enviar()"></asp:Button>

            </div>
        </div>
        <div class="text-bg-light text-center">
            <asp:Label ID="mensaje" runat="server" Text=""></asp:Label>

        </div>
    </form>
</body>

</html>
