using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosNegocio;

namespace TurnosAppWeb.Tablas
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registrar_Click(object sender, EventArgs e)
        {
            IngresoNegocio negocio = new IngresoNegocio();

            try
            {
                Int64 ing;

                ing = negocio.idusuarioSP(Int64.Parse(dniregistrar.Text));

                //ing = negocio.agregaringresoConSP(Int64.Parse(dniregistrar.Text), usuarioregistrar.Text, passregistrar.Text);

                if (ing < 0) { Lblnoregistro.Visible = true; }
                else
                {
                    Int64 ingreso;
                    ingreso = negocio.agregaringresoConSP(usuarioregistrar.Text, passregistrar.Text, ing);

                    if (ingreso == 1)
                    {
                        Lblnoregistro.Visible = false;
                        lblregistro.Visible = true;
                        Response.Redirect("/default.aspx");
                    }
                    else if (ingreso == -1) { Lblnoregistro.Visible = true; }


                }
            }
            catch (Exception)
            {
               

            }

           
            



        }
    }
}