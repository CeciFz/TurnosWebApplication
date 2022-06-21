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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PersonaNegocio negocio = new PersonaNegocio();
            listacontactos.DataSource = negocio.listarpersonas();
            listacontactos.DataBind();
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            // colocaremos para filtar los contactos y vuelva a cargar la pgina nuevamente
        }

        protected void listacontactos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var capturaid = listacontactos.SelectedDataKey.Value.ToString();
        }
    }
}