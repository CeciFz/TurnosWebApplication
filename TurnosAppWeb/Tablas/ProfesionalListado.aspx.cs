using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosNegocio;
using TurnosDominio;

namespace TurnosAppWeb
{
    public partial class ProfesionalListado : System.Web.UI.Page
    {
        public List<Profesional> listaProfesionales { get; set; }
        public List<Especialidad> especialidad { get; set; }
        public List<Horario> horarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ingresos"] == null)
            {
                Response.Redirect("../default.aspx");
            }

            if (!IsPostBack)
            {
                if (Session["listaProfesionales"] == null)
                {
                    ProfesionalNegocio negocio = new ProfesionalNegocio();
                    listaProfesionales = negocio.listarProfesionalesConSP();
                    Session.Add("listaProfesionales", listaProfesionales);
                }

            }

            //especialidad = (List<Especialidad>)((List<Profesional>)Session["listaProfesionales"]).Find(x => x.id == 1).especialidades;

            dgvlistaProfesionales.DataSource = Session["listaProfesionales"];
            dgvlistaProfesionales.DataBind();

        }


        protected void dgvlistaProfesionales_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvlistaProfesionales.SelectedDataKey.Value.ToString();

            repProfesional.DataSource = ((List<Profesional>)Session["listaProfesionales"]).FindAll(x => x.id.ToString() == id);
            repProfesional.DataBind();

            especialidad = (List<Especialidad>)((List<Profesional>)Session["listaProfesionales"]).Find(x => x.id.ToString() == id).especialidades;
            
            horarios = (List<Horario>)((List<Profesional>)Session["listaProfesionales"]).Find(x => x.id.ToString() == id).horarios;

        }

        
        protected void dgvlistaProfesionales_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            dgvlistaProfesionales.PageIndex = e.NewPageIndex;
            dgvlistaProfesionales.DataBind();

            repProfesional.DataBind();
        }
    }
}