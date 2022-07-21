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
            if (Session["ingresos"] == null)
            {
                Response.Redirect("/default.aspx");
            }
            else if (Session["ingresos"] != null)
            {// no deja entrar tamp a tipo de usuario que le coloquemo probando==1?
                int probando;
                probando = int.Parse(Session["ingresos"].ToString());
                if (probando != 4) { Response.Redirect("/default.aspx"); }

            }
          
          






            if (!IsPostBack)
            {
                Int64 idUsuario = (Int64)Session["IdUsuario"];
                ProfesionalNegocio profNeg = new ProfesionalNegocio();
                infoProfesional = profNeg.buscarProfesionalConSP(idUsuario);
                Session.Add("InfoProfesional", infoProfesional);

                List<Especialidad> especialidades = infoProfesional.especialidades;

                repSeleccionEspecialidad.DataSource = especialidades;
                repSeleccionEspecialidad.DataBind();
            }

        }

        protected void btnEspecialidad_Click(object sender, EventArgs e)
        {
            Int32 idEspecialidad = Int32.Parse(((Button)sender).CommandArgument);
            Session.Add("IdEspecialidad", idEspecialidad);
            Response.Redirect("./PanelTurnosProfesional.aspx",false);
        }
    }
}