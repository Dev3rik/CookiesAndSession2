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