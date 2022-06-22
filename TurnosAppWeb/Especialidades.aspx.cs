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
            //se carga la lista a session para luego mostrarla en modificar 
            if (Session["listaespecialidades"] == null)
            {
                EspecialidadNegocio negocios = new EspecialidadNegocio();
                Session.Add("listaespecialidades", negocios.listarEspecialidades());
            }

            listaespecialidades.DataSource = Session["listaespecialidades"];
            listaespecialidades.DataBind();



           EspecialidadNegocio negocio = new EspecialidadNegocio();
            
            listaespecialidades.DataSource = negocio.listarEspecialidades();
            listaespecialidades.DataBind();



        }

        protected void listaespecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            //captura el id seleccionado
            var id = listaespecialidades.SelectedDataKey.Value.ToString();
            Response.Redirect("modificar_especialidad.aspx?id=" + id);
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {

        }
    }
}