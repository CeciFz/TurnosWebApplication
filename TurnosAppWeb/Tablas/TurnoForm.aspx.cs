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

        //public Int32 idEspecialidad { get; set; }

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
                    ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione especialidad","0"));
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
            Int32 idEspecialidad = Int32.Parse(ddlEspecialidad.SelectedItem.Value);
            ProfesionalNegocio profNeg = new ProfesionalNegocio();
            List<Profesional> profesionalesFiltrados = profNeg.listarProfesionalesConSP(idEspecialidad);

            ddlProfesionales.DataSource = profesionalesFiltrados;
            ddlProfesionales.DataValueField = "id";
            ddlProfesionales.DataTextField = "nombres";
            ddlProfesionales.DataBind();
            if(ddlProfesionales.Items.Count > 1) ddlProfesionales.Items.Insert(0, new ListItem("Seleccione profesional", "0"));

            ddlProfesionales_SelectedIndexChanged(sender, e);    

        }

        protected void ddlProfesionales_SelectedIndexChanged(object sender, EventArgs e)
        {

            Int32 idEspecialidad = Int32.Parse(ddlEspecialidad.SelectedItem.Value);
            Int64 idProfesional = 0;
            if (idEspecialidad > 0) idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
            HorarioNegocio horNeg = new HorarioNegocio();
            List<Horario> diasAtencion = horNeg.listarHorariosConSP(idEspecialidad, idProfesional);

            ddlDias.DataSource = diasAtencion;
            ddlDias.DataValueField = "idHorario";
            ddlDias.DataTextField = "dia";
            ddlDias.DataBind();
            if (ddlDias.Items.Count > 1) ddlDias.Items.Insert(0, new ListItem("Seleccione una opción", "0"));

            if (idEspecialidad > 0 && idProfesional > 0) ddlDias_SelectedIndexChanged(sender,e);
            else
            {
                ddlFecha.Items.Clear();
                ddlFecha.DataBind();
            }
        }

        protected void ddlDias_SelectedIndexChanged(object sender, EventArgs e)
        {

            Int64 idHorario = Int64.Parse(ddlDias.SelectedItem.Value);
            if (idHorario > 0 )
            {
                HorarioNegocio horNeg = new HorarioNegocio();

                Horario horario = horNeg.listarHorarioSeleccionadoConSP(idHorario);
                int hoy = (int)DateTime.Now.DayOfWeek;
                int diaSeleccionado = diaSemana(horario.dia);

                DateTime firstDay = DateTime.Today;

                if (hoy > diaSeleccionado)
                {
                    int aux = 7 - diaSeleccionado;
                    firstDay = firstDay.AddDays(aux);
                }

                List<DateTime> date = new List<DateTime>();
                for (int i = 0; i < 9; i++)
                {
                    date.Add(firstDay);
                    firstDay = firstDay.AddDays(7);
                }

                ddlFecha.DataSource = date;
                ddlFecha.DataBind();

            }
            else
            {
                ddlFecha.Items.Clear();
                ddlFecha.DataBind();
            }

        }

        //public List<DateTime> ObtenerFechas(string dia)
        //{


        //}

        private int diaSemana (string dia)
         {
             int result = -1;

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
         }

    }
}