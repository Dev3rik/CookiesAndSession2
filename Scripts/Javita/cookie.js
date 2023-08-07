function callAjax() {
    let send = $('#Cookies').val();
    console.log(send);
    $.ajax({
        url:'AuxiliarCookies.aspx/getInformacion',
        type:'POST',
        async:true,
        data: '{ valor: "' + send + ' " }',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: exito
    
});
return false;
}
let cookies = document.cookie.split(';');
function Cookie() {
    for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i].trim();
        if (cookie.startsWith('sexo=')) {
            let sexoCookie = cookie.substring('sexo='.length, cookie.length);
            document.getElementById('Cookies').value += "Sexo: " + sexoCookie + "\n";
        }
        if (cookie.startsWith('departamento=')) {
            let departamentoCookie = cookie.substring('departamento='.length, cookie.length);
            document.getElementById('Cookies').value += "Departamento: " + departamentoCookie + "\n";
        }
    }
}

function exito(data) {
    console.log("Respuesta del servidor:", data.d);
    var returnS = data.d;
    $('#TextBoxAjax').val(data.d);
    $('#TextBoxAjax').css("visibility", "visible");
    return false;
}

