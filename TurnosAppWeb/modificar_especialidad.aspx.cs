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
    public partial class modificar_especialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["ide"];
            txtid.Text = id;
            // no me andaba si habilito estoooo :(
          /*  if (Request.QueryString["ide"] != null )
            {
                Int32 id = int.Parse(Request.QueryString["ide"].ToString());
                List<Especialidad> temporal = ((List<Especialidad>) Session["listaespecialidades"]);
                Especialidad especialidad = temporal.Find(x => x.id == id);
                txtid.Text = especialidad.id.ToString();
               Txtdescripcione.Text = especialidad.descripcion;

            }*/
        }

        protected void btnModificare_Click(object sender, EventArgs e)
        {
            Especialidad objeto = new Especialidad();
            EspecialidadNegocio negocio = new EspecialidadNegocio();

            objeto.id = Int32.Parse(txtid.Text);
            objeto.descripcion =Txtdescripcione.Text;
            negocio.modificarEspecialidad(objeto);
             Session.RemoveAll();
            Response.Redirect("especialidades.aspx");
        }
    }
}