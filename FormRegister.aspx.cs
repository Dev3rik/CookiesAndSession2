using Newtonsoft.Json.Linq;
using registerStudents.Almacen;
using registerStudents.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection.Emit;
using System.Web.Services;

namespace registerStudents
{

    public partial class FormRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            addDropDownCiudadItem();
        }


        private string[] readFile()
        {
            string[] lines = File.ReadAllLines("C:\\Users\\PREDATOR\\source\\repos\\registerStudents\\registerStudents\\DepartamentosHTML");
            return lines;
        }
        private string[] serviceCall()
        {
            Service1Client client = new Service1Client();
            String[] ciudades = client.getCiudades();
            return ciudades;
        }

        private void serviceCall2()
        {
            string sexo = Masculino.Checked ? "M" : "F";
            AlmacenClient client = new AlmacenClient();
            InfoUsuario info = new InfoUsuario();
            info.userName = Nombre.Text;
            info.userApellido = Apellido.Text;
            info.userSexo = sexo;
            info.userEmail = Email.Text;
            info.userDireccion = Direccion.Text;
            info.userDepartamento = Departamento.SelectedIndex;
            info.userRequerimiento = Requerimientos.Text;
            client.getForm(info);

        }


        protected void addDropDownCiudadItem()
        {
            string[] ciudades = serviceCall();
            Array.Sort(ciudades);
            Departamento.Items.Add("Seleccione una ciudad");

            for (int i = 0; i < ciudades.Length; i++)
            {
                string s = ciudades[i];
                Departamento.Items.Add(s);
            }

        }

        private bool ValidarDatos()
        {
            if (Nombre.Text == "" || Apellido.Text == "" || (Masculino.Checked == false && Femenino.Checked == false) || Requerimientos.Text == "" || Direccion.Text == "" || Email.Text == "" || Departamento.SelectedIndex == 0)
            {
                return false;
            }
            return true;
        }

        private void LimpiarInputs()
        {
            Nombre.Text = string.Empty;
            Apellido.Text = string.Empty;
            Masculino.Checked = false;
            Femenino.Checked = false;
            Email.Text = string.Empty;
            Direccion.Text = string.Empty;
            Requerimientos.Text = string.Empty;
            Departamento.SelectedIndex = 0;

        }

        private void createCookie(string sexo, string departamento)
        {
            HttpCookie cookie1 = new HttpCookie("sexo", sexo);
            HttpCookie cookie2 = new HttpCookie("departamento", departamento);
            cookie1.Expires = DateTime.Now.AddDays(1);
            cookie2.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie1);
            Response.Cookies.Add(cookie2);
        }


        protected void createSession(String nombre, String apellido, String sexo, String Departamento)
        {
            Session["Nombre"] = nombre;
            Session["Apellido"] = apellido;
        }
        protected void BotonEnviar_Click(object sender, EventArgs e)
        {


            if (ValidarDatos())
            {
                string nombre = Nombre.Text;
                string apellido = Apellido.Text;
                string sexo = string.Empty;
                if (Masculino.Checked)
                {
                    sexo = "Masculino";
                }
                else if (Femenino.Checked)
                {
                    sexo = "Femenino";
                }
                string email = Email.Text;
                string direccion = Direccion.Text;
                string departamento = Departamento.Text;
                string requerimientosN = Requerimientos.Text;
                serviceCall2();
                createSession(nombre, apellido, sexo, departamento);
                createCookie(sexo, departamento);
                mensaje.Text = "DATOS ENVIADOS DESDE C#:<br />Nombre: " + nombre + "<br />Apellido: " + apellido + "<br />Sexo: " + sexo + "<br />Email: " + email
                    + "<br />Direccion: " + direccion + "<br />Departamento: " + departamento + "<br />Requerimientos: " + requerimientosN;
                LimpiarInputs();
                Response.Redirect("AuxiliarCookies");
            }

        }
        [WebMethod]
        public static String getInformacion(String Name, String lastName)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB ;Initial Catalog=DataBaseRegister;Integrated Security=True";

            string query = "SELECT COUNT(*) FROM RegisterEstudent WHERE nombre = @Name AND Apellidos = @lastName";

            int count = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", Name);
                    command.Parameters.AddWithValue("@lastName", lastName);
                    connection.Open();
                    count = (int)command.ExecuteScalar();
                }
            }

            if (count > 0)

            {
                
                return  "A)" + Name + " " + lastName + " ya está registrado.";
            }
            else
            {
                return "B)" + Name + " " + lastName + " no está registrado.";
            }
        }

    }
}