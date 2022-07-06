using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosAppWeb
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResgistrarse_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {//falta seguir, agregar asp text box en el ingreso y pass  minuto 18:31
            //<input type="email" class="form-control" id="inputEmail3">
            //<input type="password" class="form-control" id="inputPassword3">
            ingresos ingresos;
            ingresosnegocio negocio = new ingresosnegocio();
            try
            {

                ingresos = new ingresos(TextUser.Text, Textpassword.Text,false);
                if (negocio.loguear(ingresos))
                {
                    Session.Add("ingresos", ingresos);
                    Response.Redirect("UsuariosListado.aspx");

                }
                else
                {
                    Session.Add("erroringreso", "user o pass incorrectos");
                    Response.Redirect("UsuariosListado.aspx");

                }
            }
            catch (Exception ex)
            {

               // throw ;
            }
        }
    }
}