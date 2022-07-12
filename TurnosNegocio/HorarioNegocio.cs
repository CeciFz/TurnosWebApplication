using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosNegocio
{
    public class HorarioNegocio
    {
        private AccesoDatos datos = new AccesoDatos();

        public List<Horario> listarHorariosConSP(Int32 idEspecialidad = -1 , Int64 idProfesional = -1)
        {
            List<Horario> lista = new List<Horario>();

            try
            {
                datos.setearSP("SP_ListarHorariosProfesionales");
                datos.SetearParametro("@IdEspecialidad", idEspecialidad);
                datos.SetearParametro("@IdProfesional", idProfesional);
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Horario aux = new Horario();
                    aux.idHorario = (Int64)datos.Lector["IdHorario"];

                    if(idProfesional > -1)
                    {
                        aux.dia = (string)datos.Lector["Horario"];
                    }
                    else
                    {
                    aux.dia = (string)datos.Lector["Día"];
                    aux.horaInicio = (TimeSpan)datos.Lector["Hora_Inicio"];
                    aux.horaFin = (TimeSpan)datos.Lector["Hora_Fin"];

                    }

                    aux.frecuencia = (Int16)datos.Lector["Frecuencia"];
                    if (aux.activo = (bool)datos.Lector["Activo"]) lista.Add(aux);
                }

                return lista;

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

        public Horario listarHorarioSeleccionadoConSP(Int64 idHorario)
        {
            Horario horario = new Horario();

            try
            {
                datos.setearSP("SP_ListarHorarioSeleccionado");
                datos.SetearParametro("@IdHorario", idHorario);
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    if (horario.activo = (bool)datos.Lector["Activo"]) {
                        horario.dia = (string)datos.Lector["Día"];
                        horario.horaInicio = (TimeSpan)datos.Lector["Hora_Inicio"];
                        horario.horaFin = (TimeSpan)datos.Lector["Hora_Fin"];
                        horario.frecuencia = (Int16)datos.Lector["Frecuencia"];
                    } else
                    {
                        horario = null;
                    }
                }

                return horario;

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

        public void agregarHorario(Horario horario)
        {
            
            try
            {
                datos.setearConsulta("Insert into Horarios (Día, Hora_Inicio, Hora_Fin, Frecuencia) VALUES (@Día, @Hora_Inicio, @Hora_Fin, @Frecuencia)");
                datos.SetearParametro("@Día", horario.dia);
                datos.SetearParametro("@Hora_Inicio", horario.horaInicio);
                datos.SetearParametro("@Hora_Fin", horario.horaFin);
                datos.SetearParametro("@Frecuencia", horario.frecuencia);


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

        public void modificarHorario(Horario horario)  // hacer SP
        {
           /* try
            {
                datos.setearConsulta("Update Horarios Set Descripcion = @descripcion where Id = @id");
                datos.SetearParametro("@descripcion", horario.descripcion);
                datos.SetearParametro("@id", horario.id);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }*/
        }

        public void eliminarLogicoHorario(int id)
        {
            try
            {
                datos.setearConsulta("Update Horarios set Activo = 0 where id = @Id");
                datos.SetearParametro("@Id", id);
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