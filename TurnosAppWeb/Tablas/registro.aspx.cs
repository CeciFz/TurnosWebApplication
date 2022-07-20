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

            Int32 ing;
            
            

            ing = negocio.agregaringresoConSP(Int64.Parse(dniregistrar.Text), usuarioregistrar.Text, passregistrar.Text);

            if (ing == 1) { lblregistro.Visible = true; }
            else if (ing == 0) { Lblnoregistro.Visible = true; }



        }
    }
}