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
            Response.Redirect("/Tablas/registro.aspx");
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {

            Ingreso ingreso;
            IngresoNegocio negocio = new IngresoNegocio();
            try
            {
                ingreso = new Ingreso(TextUser.Text, Textpassword.Text);
                ingreso = negocio.Loguear(ingreso);
                


                if (ingreso.tipoUsuario == 1)
                {
                    Session.Add("ingresos", ingreso.tipoUsuario);
                    Session.Add("IdUsuario", ingreso.usuario.id);
                    Response.Redirect("./Gestion/MenuAdmin.aspx");
                    lblerror.Visible = false;
                }
                else if (ingreso.tipoUsuario == 2)
                {
                    Session.Add("ingresos", ingreso.tipoUsuario);
                    Session.Add("IdUsuario", ingreso.usuario.id);
                    Response.Redirect("/Gestion/MenuGestion.aspx");
                    lblerror.Visible = false;

                }
                else if (ingreso.tipoUsuario == 3)
                {
                    Session.Add("ingresos", ingreso.tipoUsuario);
                    Session.Add("IdUsuario", ingreso.usuario.id);
                    Response.Redirect("/Gestion/MenuPaciente.aspx");
                    lblerror.Visible = false;

                }
                else if (ingreso.tipoUsuario == 4)
                {
                    Session.Add("ingresos", ingreso.tipoUsuario);
                    Session.Add("IdUsuario", ingreso.usuario.id);
                    Response.Redirect("/Gestion/MenuProfesional.aspx");
                    lblerror.Visible = false;

                }
                else if (ingreso.tipoUsuario == 0)
                {

                    lblerror.Visible = true;

                }
                else
                {

                    Session.Add("ingresos", null);
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