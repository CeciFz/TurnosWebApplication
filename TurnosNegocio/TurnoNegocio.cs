using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;


namespace TurnosNegocio
{
    public class TurnoNegocio
    {
        private AccesoDatos datos = new AccesoDatos();
        public void agregarTurnoConSP(Turno turno)
        {
            try
            {
                datos.setearSP("SP_AltaTurno");
                datos.SetearParametro("@IdPaciente", turno.paciente.id);
                datos.SetearParametro("@Fecha", turno.fecha);
                datos.SetearParametro("@Hora", turno.hora);
                datos.SetearParametro("@IdProfesional", turno.profesional.id);
                datos.SetearParametro("@IdEspecialidad", turno.especialidad.id);
                datos.SetearParametro("@IdHorario", turno.profesional.horarios[0].idHorario);
                datos.SetearParametro("@Observaciones", turno.observaciones);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
