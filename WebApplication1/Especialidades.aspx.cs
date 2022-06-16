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
    public partial class Especialidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadesNegocio negocio = new EspecialidadesNegocio();
            listaespecialidades.DataSource = negocio.listarEspecialidades();
            listaespecialidades.DataBind();
        }
    }
}