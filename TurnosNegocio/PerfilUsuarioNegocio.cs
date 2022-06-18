using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace TurnosNegocio
{
    public class PerfilUsuarioNegocio
    {
        public List<PerfilUsuario> listarPerfilesUsuarios()
        {
            List<PerfilUsuario> lista = new List<PerfilUsuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id, Descripcion from Perfiles_Usuarios");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    PerfilUsuario aux = new PerfilUsuario();
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