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
            lblerror.Visible = false;
            if (Session["error"] != null)
            { lblerror.Visible = true; }
            else if (Session["ingresos"] == null)
            {
                lblerror.Visible = false;
                
            }
            
        }

        protected void btnResgistrarse_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {

            ingresos ingresos;
            ingresosnegocio negocio = new ingresosnegocio();

            try
            {
                ingresos = new ingresos(TextUser.Text, Textpassword.Text,false);
                if (negocio.Loguear(ingresos))
                {
                    Session.Add("ingresos", ingresos);
                   Response.Redirect("listados.aspx");

                }
                else
                {
                    Session.Add("error", "user o pass incorrectos");
                      Response.Redirect("default.aspx");

                }
            }

            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                throw ex;
                
            }
        }
    }
}