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
    public partial class EspecialidadForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ingresos"] == null)
            {
                Response.Redirect("/default.aspx");
            }
            else if (Session["ingresos"] != null)
            {// no deja entrar tamp a tipo de usuario que le coloquemo probando==1?
                int probando;
                probando = int.Parse(Session["ingresos"].ToString());
                if (probando == 0) { Response.Redirect("/default.aspx"); }

            }

            if (Request.QueryString["id"] != null && btnModificar.Visible == false)
            {
                Int32 id = Int32.Parse(Request.QueryString["id"].ToString());
                List<Especialidad> temporal = ((List<Especialidad>)Session["listaEspecialidades"]);
                Especialidad seleccionado = temporal.Find(x => x.id == id);
                txtId.Text = seleccionado.id.ToString();
                txtDescripcion.Text = seleccionado.descripcion;

                btnRegistrar.Visible = false;
                btnModificar.Visible = true;
                btnEliminar.Visible = true;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                Especialidad especialidad = new Especialidad();
                EspecialidadNegocio negocio = new EspecialidadNegocio();

                especialidad.descripcion = txtDescripcion.Text;
                negocio.agregarEspecialidad(especialidad);

                ((List<Especialidad>)Session["listaEspecialidades"]).Add(especialidad);
                Response.Redirect("EspecialidadListado.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
            

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Especialidad especialidad = new Especialidad();
            EspecialidadNegocio negocio = new EspecialidadNegocio();

            especialidad.id = Int32.Parse(txtId.Text);
            especialidad.descripcion = txtDescripcion.Text;

            negocio.modificarEspecialidad(especialidad);
            Session.RemoveAll();
            Response.Redirect("EspecialidadListado.aspx");

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();

            int id = Int32.Parse(txtId.Text);

            negocio.eliminarLogicoEspecialidad(id);
            Session.RemoveAll();   
            Response.Redirect("EspecialidadListado.aspx");

        }
    }
}