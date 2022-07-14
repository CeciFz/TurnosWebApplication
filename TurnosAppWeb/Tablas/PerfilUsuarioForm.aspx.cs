using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosAppWeb.Tablas
{
    public partial class PerfilUsuarioForm : System.Web.UI.Page
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
                if (probando == 2) { Response.Redirect("/listados.aspx"); }

            }

            if (Request.QueryString["id"] != null && btnModificar.Visible == false)
            {
                Int16 id = Int16.Parse(Request.QueryString["id"].ToString());
                List<PerfilUsuario> temporal = ((List<PerfilUsuario>)Session["listaPerfilesUsuarios"]);
                PerfilUsuario seleccionado = temporal.Find(x => x.id == id);
                txtId.Text = seleccionado.id.ToString();
                txtDescripcion.Text = seleccionado.descripcion;

                btnRegistrar.Visible = false;
                btnModificar.Visible = true;
                btnEliminar.Visible = true;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            PerfilUsuario perfil = new PerfilUsuario();
            PerfilUsuarioNegocio negocio = new PerfilUsuarioNegocio();

            perfil.descripcion = txtDescripcion.Text;
            negocio.agregarPerfilUsuario(perfil);

            ((List<PerfilUsuario>)Session["listaPerfilesUsuarios"]).Add(perfil);
            Response.Redirect("PerfilUsuarioListado.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            PerfilUsuario perfil = new PerfilUsuario();
            PerfilUsuarioNegocio negocio = new PerfilUsuarioNegocio();

            perfil.id = Int16.Parse(txtId.Text);
            perfil.descripcion = txtDescripcion.Text;

            negocio.modificarPerfilUsuario(perfil);
            Session.RemoveAll();   // TODO: Ver si esto está ok
            Response.Redirect("PerfilUsuarioListado.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            PerfilUsuarioNegocio negocio = new PerfilUsuarioNegocio();

            int id = Int16.Parse(txtId.Text);

            negocio.eliminarLogicoPerfilUsuario(id);
            Session.RemoveAll();   // TODO: Ver si esto está ok
            Response.Redirect("PerfilUsuarioListado.aspx");
        }
    }
}