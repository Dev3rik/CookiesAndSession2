<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="registerStudents.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro de Alumno</title>
</head>
        <script>
            value = "";
            function limpiar(e){
                e.preventDefault();
                document.getElementById(Apellido).value = "";
                return false;
            }
        </script>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>REGISTRO DE ALUMNOS</h1>
            Nombre:<asp:TextBox ID="Nombre" runat="server"></asp:TextBox>
            <p>Apellido: <input id="Apellido" type="text" /> </p>
            <p> Sexo: <input id="Radio1" type="radio" /> Masculino  <input id="Radio2" type="radio" /> Femenino</p>
            <p>Email: <input id="Email" type="text"/></p>
            <p>Direccion: <input id="Direccion" type="text" /> Departamento <select id="Departamento">
                <option>Amazonas</option>
                <option>Ancash</option>
                <option>Apurimac</option>
                <option>Arequipa</option>
                <option>Ayacucho</option>
                <option>Cajamarca</option>
                <option>Cusco</option>
                <option>Huancavelica</option>
                <option>Huanuco</option>
                <option>Ica</option>
                <option>Junín</option>
                <option>La Libertad</option>
                <option>Lambayeque</option>
                <option>Lima</option>
                <option>Loreto</option>
                <option>Madre de Dios</option>
                <option>Moquegua</option>
                <option>Pasco</option>
                <option>Piura</option>
                <option>Puno</option>
                <option>San Martín</option>
                <option>Tacna</option>
                <option>Tumbes</option>
                <option>Ucayali</option>
                </select> 
            </p>
            <p>Requerimientos:</p>
             <textarea id="Requerimientos" cols="30" rows="10"></textarea>
             <asp:Button runat="server" Text="Limpiar" OnClientClick="return limpiar()"></asp:Button><input id="Enviar" type="button" value="Enviar" />
        </div>
</form>
</html>
