using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosApp
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadesNegocio especialidades = new EspecialidadesNegocio();
            dgvEspecialidades.DataSource = especialidades.listarEspecialidades();
            dgvEspecialidades.DataBind();

        }
    }
}