using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace TurnosNegocio
{
    public class EstadoTurnosNegocio
    {
        public List<EstadoTurno> listarEstadosTurnos()
        {
            List<EstadoTurno> lista = new List<EstadoTurno>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id, Descripcion from Estados_Turnos");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    EstadoTurno aux = new EstadoTurno();
                    aux.id = (Int16)datos.Lector["Id"];
                    aux.descripcion = (string)datos.Lector["Descripcion"];

                    lista.Add(aux);
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

    }
}
