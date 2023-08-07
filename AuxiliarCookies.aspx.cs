using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace registerStudents
{
    public partial class AuxiliarCookies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadSession();
            deleteSession();

        }
        private void loadSession()
        {
            String nombre = (String)(Session["Nombre"]);
            String apellido = (String)(Session["Apellido"]);

            InformacionNom.Text = "</br>Nombre:  " + nombre;
            InformacionApe.Text = "</br>Apellido:  " + apellido;
        }

        protected void Cerrar_Session(object sender, EventArgs e)
        {
            
            Response.Redirect("FormRegister");
        }


        private void deleteSession()
        {
            Session.RemoveAll();
            Session.Abandon();
        }

        [WebMethod]
        public static String getInformacion(String valor)
        {
            return "Desde el servidor se recibio :" + valor;
        }
    }
}