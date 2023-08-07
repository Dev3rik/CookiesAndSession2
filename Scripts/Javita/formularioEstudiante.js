let masCortos = document.getElementById("Nombre");
let cortoApellido = document.getElementById("Apellido");
let cortoEmail = document.getElementById("Email");
let cortoSexoM = document.getElementById("Masculino");
let cortoSexoF = document.getElementById("Femenino");
let cortoDireccion = document.getElementById("Direccion");
let cortoDepartamento = document.getElementById("Departamento");
let cortoRequerimientos = document.getElementById("Requerimientos")
console.log(cortoRequerimientos);
console.log("se está leyendo");
function limpiar() {
    var sinNada = "";
    masCortos.value = sinNada;
    cortoApellido.value = sinNada;
    cortoEmail.value = sinNada;
    cortoSexoM.checked = false;
    cortoSexoF.checked = false;
    cortoDireccion.value = sinNada;
    cortoDepartamento.value = 0;
    cortoRequerimientos.value = sinNada;
    return false;
}
function enviar() {
    var expRegNombre = /^[a-zA-Z ]+$/;
    var regex = /^\w+([.-_+]?\w+)*@unsa.edu.pe+$/;
    var validar = new Boolean(true);
    let validarNombre = masCortos.value;
    let validarApellido = cortoApellido.value;
    let validarEmail = cortoEmail.value;
    let validarSexo = cortoSexoM.checked;
    let validarSexoF = cortoSexoF.checked;
    let validarDepartamento = cortoDepartamento.value;
    if (validarNombre == "" || !expRegNombre.exec(validarNombre)) {
        alert("Nombre Invalido");
    }
    if (validarApellido == "" || !expRegNombre.exec(validarApellido)) {
        alert("Apellido Invalido")
        validar = false;
    }
    if (validarSexo == false && validarSexoF == false) {
        alert("No eligio su sexo")
        validar = false;
    }
    if (validarEmail == "" || !regex.exec(validarEmail)) {
        alert("Email Invalido")
        validar = false;
    }
    if (validarDepartamento == 0) {
        alert("Seleccione un departamento")
        validar = false;
    }
    if (validar == true) {
        var d = new Date();
        alert("Mensaje enviado a las: " + d);
        return validar;
    }
    return validar;

}

function VerificateInput(Nombre,Apellido) {

    let Datos = {
        Name: Nombre,
        lastName: Apellido
    };
    $.ajax({
        url: 'FormRegister.aspx/getInformacion',
        type: 'POST',
        async: true,
        data: JSON.stringify(Datos),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: exito

    });
    return false;
}

function exito(data) {
    console.log("Respuesta del servidor:", data.d);
    $('#ValidationInputs').removeClass("text-success text-danger");
    $('#ValidationInputs').css("display", "block");
    $("#text").text(data.d);

    var returnS = data.d;
    if (returnS[0] == "A") {
        $('#ValidationInputs').addClass('text-danger');
    }
    else {
        $('#ValidationInputs').addClass('text-success');
    }
    return false;
}


function onInputFinish() {

    VerificateInput(masCortos.value,cortoApellido.value);
}
cortoApellido.addEventListener('input', onInputFinish);
