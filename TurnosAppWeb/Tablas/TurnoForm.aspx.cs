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
        private Int32 idEspecialidad { get; set; }
        private Int64 idProfesional { get; set; }
        private Int64 idHorario { get; set; }

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

            UsuarioNegocio negocio = new UsuarioNegocio();
            EspecialidadNegocio espNeg = new EspecialidadNegocio();
            ProfesionalNegocio profNeg = new ProfesionalNegocio();
            idProfesional = idHorario = 0;

            try
            {
                if (!IsPostBack)
                {
                    //crea listapaciente=lista basedato
                    listaPacientes = negocio.listarPacientes();
                    listaEspecialidades = espNeg.listarEspecialidades();

                    ddlPaciente.DataSource = listaPacientes;
                    ddlPaciente.DataValueField = "id";
                    ddlPaciente.DataTextField = "nombres";  
                    ddlPaciente.DataBind();

                    ddlEspecialidad.DataSource = listaEspecialidades;
                    // datavaluefield es lo que toma como valor
                    ddlEspecialidad.DataValueField = "id";
                    //datatextfiel es lo que muestra el desplegable
                    ddlEspecialidad.DataTextField = "descripcion";
                    ddlEspecialidad.DataBind();
                    ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione especialidad", "0"));
                }

                idEspecialidad = Int32.Parse(ddlEspecialidad.SelectedItem.Value);
                lblSinTurno.Visible = false;

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }

            if (Request.QueryString["id"] != null/* && btnModificar.Visible == false*/)
            {
                Int64 id = Int64.Parse(Request.QueryString["id"].ToString());
                List<Turno> temporal = ((List<Turno>)Session["listaTurnos"]);
                Turno seleccionado = temporal.Find(x => x.id.ToString() == "id");
                ddlPaciente.SelectedValue = seleccionado.paciente.id.ToString();
                ddlEspecialidad.SelectedValue = seleccionado.especialidad.id.ToString();
                
                ddlProfesionales.SelectedValue = seleccionado.profesional.id.ToString();
                ddlDias.SelectedValue = seleccionado.idHorario.ToString();
                ddlFecha.SelectedValue = seleccionado.fecha.ToString();
                ddlHora.SelectedValue = seleccionado.hora.ToString();
                

            }
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProfesionalNegocio profNeg = new ProfesionalNegocio();
            List<Profesional> profesionalesFiltrados = profNeg.listarProfesionalesConSP(idEspecialidad);

            ddlProfesionales.DataSource = profesionalesFiltrados;
            ddlProfesionales.DataValueField = "id";
            ddlProfesionales.DataTextField = "nombres";
            ddlProfesionales.DataBind();
            if (ddlProfesionales.Items.Count > 1) ddlProfesionales.Items.Insert(0, new ListItem("Seleccione profesional", "0"));

            ddlProfesionales_SelectedIndexChanged(sender, e);

        }

        protected void ddlProfesionales_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (idEspecialidad > 0) idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);

            HorarioNegocio horNeg = new HorarioNegocio();
            List<Horario> diasAtencion = horNeg.listarHorariosConSP(idEspecialidad, idProfesional);

            ddlDias.DataSource = diasAtencion;
            ddlDias.DataValueField = "idHorario";
            ddlDias.DataTextField = "dia";
            ddlDias.DataBind();
            if (ddlDias.Items.Count > 1) ddlDias.Items.Insert(0, new ListItem("Seleccione una opción", "0"));

            if (idEspecialidad > 0 && idProfesional > 0) ddlDias_SelectedIndexChanged(sender, e);
            else
            {
                ddlFecha.Items.Clear();
                ddlFecha.DataBind();
                ddlHora.Items.Clear();
                ddlHora.DataBind();
            }
        }

        protected void ddlDias_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (idEspecialidad > 0) idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
            if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);

            if (idHorario > 0)
            {
                HorarioNegocio horNeg = new HorarioNegocio();

                Horario horario = horNeg.listarHorarioSeleccionadoConSP(idHorario);
                int hoy = (int)DateTime.Now.DayOfWeek;
                int diaSeleccionado = diaSemana(horario.dia);
                int aux = 0;

                DateTime firstDay = DateTime.Today;

                if (hoy > diaSeleccionado)
                {
                    aux = 7 - hoy + diaSeleccionado;
                    firstDay = firstDay.AddDays(aux);
                }
                else if (hoy < diaSeleccionado)
                {
                    aux = diaSeleccionado - hoy;
                    firstDay = firstDay.AddDays(aux);
                }

                List<DateTime> date = new List<DateTime>();
                for (int i = 0; i < 8; i++)
                {
                    date.Add(firstDay);
                    firstDay = firstDay.AddDays(7);
                }

                ddlFecha.DataSource = date;
                ddlFecha.DataBind();
                ddlFecha_SelectedIndexChanged(sender, e);
            }
            else
            {
                ddlFecha.Items.Clear();
                ddlFecha.DataBind();
                ddlHora.Items.Clear();
                ddlHora.DataBind();
            }

        }

        private int diaSemana(string dia)
        {
            int result = -1;

            switch (dia)
            {
                case "Domingo":
                    result = 0;
                    break;
                case "Lunes":
                    result = 1;
                    break;
                case "Martes":
                    result = 2;
                    break;
                case "Miércoles":
                    result = 3;
                    break;
                case "Jueves":
                    result = 4;
                    break;
                case "Viernes":
                    result = 5;
                    break;
                case "Sábado":
                    result = 6;
                    break;
            }
            return result;
        }

        protected void ddlFecha_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (idEspecialidad > 0) idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);
            if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);

            if (idHorario > 0)
            {
                List<Turno> listaTurnosTomados = new List<Turno>();
                TurnoNegocio negocio = new TurnoNegocio();

                DateTime fechaSeleccionada = DateTime.Parse(ddlFecha.SelectedItem.Value);
                listaTurnosTomados = negocio.turnosTomadosConSP(fechaSeleccionada, idProfesional, idEspecialidad, idHorario);

                HorarioNegocio horNeg = new HorarioNegocio();
                Horario horario = horNeg.listarHorarioSeleccionadoConSP(idHorario);

                TimeSpan horaInicio = horario.horaInicio;
                TimeSpan horaFin = horario.horaFin;
                TimeSpan frecuencia = new TimeSpan(00, horario.frecuencia, 00);

                TimeSpan ActualHr = TimeSpan.Parse(DateTime.Now.ToShortTimeString());


                List<TimeSpan> horas = new List<TimeSpan>();

                while (horaInicio < horaFin)
                {
                    horas.Add(horaInicio);
                    horaInicio = horaInicio.Add(frecuencia);
                }


                int compara = 0;
                if (listaTurnosTomados.Count > 0)
                {
                    foreach (Turno t1 in listaTurnosTomados)
                    {
                        horaInicio = horario.horaInicio;
                        while (horaInicio < horaFin)
                        {
                            compara = TimeSpan.Compare(t1.hora, horaInicio);
                            if (compara == 0)                                     // Si es = 0, son iguales (está tomado)
                            {
                                horas.Remove(horaInicio);
                            }
                            horaInicio = horaInicio.Add(frecuencia);
                        }
                    }
                }

                ddlHora.DataSource = horas;
                ddlHora.DataBind();
                if (ddlHora.Items.Count == 0) lblSinTurno.Visible = true;



            }
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            Int64 idPaciente = 0;
            if (idEspecialidad > 0) idProfesional = Int64.Parse(ddlProfesionales.SelectedItem.Value);  //Idespecialidad lo carga en el LOAD
            if (idProfesional > 0) idHorario = Int64.Parse(ddlDias.SelectedItem.Value);
            if (idHorario > 0)
            {
                try
                {
                    idPaciente = Int64.Parse(ddlPaciente.SelectedItem.Value);
                    Turno turno = new Turno();
                    TurnoNegocio negocio = new TurnoNegocio();

                    turno.paciente = new Usuario();
                    turno.paciente.id = idPaciente;
                    turno.profesional = new Profesional();
                    turno.profesional.id = idProfesional;
                    turno.especialidad = new Especialidad();
                    turno.especialidad.id = idEspecialidad;
                    //turno.profesional.horarios = new List<Horario>();
                    //turno.profesional.horarios.Add(new Horario());
                    //turno.profesional.horarios[0].idHorario = idHorario;
                    turno.idHorario = idHorario;

                    turno.fecha = DateTime.Parse(ddlFecha.SelectedItem.Value);
                    turno.hora = TimeSpan.Parse(ddlHora.SelectedItem.Value);
                    turno.observaciones = txtObservaciones.Text;

                    negocio.agregarTurnoConSP(turno);
                    Response.Redirect("TurnoForm.aspx", false);
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex);
                    throw;
                }

            }
        }


    }
}