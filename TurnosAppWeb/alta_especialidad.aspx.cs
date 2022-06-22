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
    public partial class alta_especialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                Especialidad especialidad = new Especialidad();
                EspecialidadNegocio negocio = new EspecialidadNegocio();

                especialidad.descripcion = txtDescripcion.Text;
                negocio.agregarEspecialidad(especialidad);

                //((List<Especialidad>Session ["listaespecialidades"]).add(especialidad);
                Response.Redirect("especialidades.aspx");
            }
            catch (Exception ex)
            {

                //throw;
            }
            

        }
    }
}