using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using TurnosDominio;
using TurnosNegocio;


namespace TurnosAppWeb
{
    public partial class TurnoForm : System.Web.UI.Page
    {
        public List<Usuario> listaPacientes { get; set; }
        public List<Especialidad> listaEspecialidades { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            EspecialidadNegocio espNeg = new EspecialidadNegocio();
            ProfesionalNegocio profNeg = new ProfesionalNegocio();

            try
            {
                if (!IsPostBack)
                {
                    listaPacientes = negocio.listarUsuarios();
                    listaEspecialidades = espNeg.listarEspecialidades();

                    ddlPaciente.DataSource = listaPacientes;
                    ddlPaciente.DataBind();

                    ddlEspecialidad.DataSource = listaEspecialidades;
                    ddlEspecialidad.DataValueField = "id";
                    ddlEspecialidad.DataTextField = "descripcion";
                    ddlEspecialidad.DataBind();

                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }
        }

        /* protected void btnAgendar_Click(object sender, EventArgs e)
         {
             string id = ((Button)sender).CommandArgument;
         }*/


        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            /* int id = int.Parse(ddlEspecialidad.SelectedItem.Value);

             List<Profesional> profesionalesfiltrados = new List<Profesional>();
             Especialidad seleccionada = ((List<Especialidad>)Session["listaEspecialidades"]).Find(x => x.id == id);
             profesionalesfiltrados = ((List<Profesional>)Session["listaProfesionales"]).FindAll(x => x.especialidades.FindAll(y => y.Equals(seleccionada));
             ProfesionalNegocio profNeg = new ProfesionalNegocio();
             listaProfesionales = profNeg.listarProfesionalesConSP();

             foreach (Profesional prof in listaProfesionales)
             {
                 foreach(Especialidad esp in prof.especialidades)
                 {
                     //if (esp.id == id)   
                     if (esp.Equals(seleccionada))   
                     {
                         profesionalesfiltrados.Add(prof);
                     }
                 }

             };*/

            ProfesionalNegocio profNeg = new ProfesionalNegocio();
            List<Profesional> listaProfesionales = profNeg.listarProfesionalesConSP();
            List<Profesional> profesionalesFiltrados = new List<Profesional>();

            int id = int.Parse(ddlEspecialidad.SelectedItem.Value);

            foreach (Profesional prof in listaProfesionales)
            {
                foreach (Especialidad esp in prof.especialidades)
                {
                    if (esp.id == id)
                    {
                        profesionalesFiltrados.Add(prof);
                    }
                }

            }

            ddlProfesionales.DataSource = profesionalesFiltrados;
            ddlProfesionales.DataValueField = "id";
            ddlProfesionales.DataTextField = "apellidos";
            ddlProfesionales.DataBind();

        }

        protected void ddlProfesionales_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProfesionalNegocio profNeg = new ProfesionalNegocio();
            List<Profesional> listaProfesionales = profNeg.listarProfesionalesConSP();
            List<Horario> diasAtencion= new List<Horario>();

            int id = int.Parse(ddlProfesionales.SelectedItem.Value);

            foreach (Profesional prof in listaProfesionales)
            {
                if (prof.id == id)
                    {
                    foreach (Horario horario in prof.horarios)
                    {
                        diasAtencion.Add(horario);
                    }
                } 

            }

            ddlDias.DataSource = diasAtencion;
            ddlDias.DataValueField = "idHorario";
            ddlDias.DataTextField = "dia";
            ddlDias.DataBind();
        }

        //public List<DateTime> ObtenerFechas(string dia)
        //{


        //}

        /* private int diaSemana (string dia)
         {
             int result;

             switch (dia)
             {
                 case "Domingo": result = 0;
                     break;
                 case "Lunes": result = 1;
                     break;
                 case "Martes": result = 2;
                     break;
                 case "Miércoles": result = 3;
                     break;
                 case "Jueves": result = 4;
                     break;
                 case "Viernes": result = 5;
                     break;
                 case "Sábado": result = 6;
                     break;
             }
             return result;
         }*/



    }
}