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
    public partial class MenuProfesional : System.Web.UI.Page
    {
        public Profesional infoProfesional { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            Int64 idUsuario = (Int64)Session["IdUsuario"];
            ProfesionalNegocio profNeg = new ProfesionalNegocio();
            infoProfesional = profNeg.buscarProfesionalConSP(idUsuario);

            List<Especialidad> especialidades = infoProfesional.especialidades;


            repSeleccionEspecialidad.DataSource = especialidades;
            repSeleccionEspecialidad.DataBind();

        }

        protected void btnEspecialidad_Click(object sender, EventArgs e)
        {
            Int32 idEspecialidad = Int32.Parse(((Button)sender).CommandArgument);
            Session.Add("IdEspecialidad", idEspecialidad);
            Response.Redirect("./PanelTurnosProfesional.aspx",false);
        }
    }
}