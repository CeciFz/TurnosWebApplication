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
        {

            Ingreso ingresos;
            IngresoNegocio negocio = new IngresoNegocio();

            try
            {
                ingresos = new Ingreso(TextUser.Text, Textpassword.Text);
                int tipo = negocio.Loguear(ingresos);
                if (tipo==1)
                {
                    
                    Session.Add("ingresos",tipo);
                   Response.Redirect("./Tablas/menuadmin.aspx");
                    lblerror.Visible = false;
                }else if(tipo==2){
                    Session.Add("ingresos", tipo);
                    Response.Redirect("/Tablas/menugestion.aspx");
                    lblerror.Visible = false;

                }
                else if (tipo == 3)
                {
                    Session.Add("ingresos", tipo);
                    Response.Redirect("/Tablas/menuprofesional.aspx");
                    lblerror.Visible = false;

                }
                else if (tipo == 4)
                {
                    Session.Add("ingresos", tipo);
                    Response.Redirect("/Tablas/menupaciente.aspx");
                    lblerror.Visible = false;

                }
                else
                {
                    lblerror.Visible = true;
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