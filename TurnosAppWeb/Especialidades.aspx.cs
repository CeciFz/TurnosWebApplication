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
    public partial class Especialidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            listaespecialidades.DataSource = negocio.listarEspecialidades();
            listaespecialidades.DataBind();
        }

        protected void listaespecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            //accion de editar
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {

        }
    }
}