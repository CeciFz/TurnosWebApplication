using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosNegocio
{
    public class EstadoTurnoNegocio
    {
        private AccesoDatos datos = new AccesoDatos();
        public List<EstadoTurno> listarEstadosTurnos()
        {
            List<EstadoTurno> lista = new List<EstadoTurno>();

            try
            {
                datos.setearConsulta("Select Id, Descripcion, Activo from Estados_Turnos");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    EstadoTurno aux = new EstadoTurno();
                    aux.id = (Int16)datos.Lector["Id"];
                    aux.descripcion = (string)datos.Lector["Descripcion"];

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

        public void agregarEstadoTurno(EstadoTurno estado)
        {
            try
            {
                datos.setearConsulta("Insert into Estados_Turnos (Descripcion) VALUES (@Descripcion)");
                datos.SetearParametro("@Descripcion", estado.descripcion);


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

        public void modificarEstadoTurno(EstadoTurno estado)
        {
            try
            {
                datos.setearConsulta("Update Estados_Turnos Set Descripcion = @descripcion where Id = @id");
                datos.SetearParametro("@descripcion", estado.descripcion);
                datos.SetearParametro("@id", estado.id);

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

        public void eliminarLogicoEstadoTurno(int id)
        {
            try
            {
                datos.setearConsulta("Update Estados_Turnos set Activo = 0 where id = @Id");
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
