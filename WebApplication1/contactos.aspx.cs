using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;
using TurnosNegocio;
namespace WebApplication1
{
    public partial class contactos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PersonaNegocio negocio = new PersonaNegocio();
            listacontactos.DataSource = negocio.listarpersonas();
            listacontactos.DataBind();
        }
    }
}