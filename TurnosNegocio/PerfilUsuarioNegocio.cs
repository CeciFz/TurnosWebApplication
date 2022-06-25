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
        private AccesoDatos datos = new AccesoDatos();
        public List<PerfilUsuario> listarPerfilesUsuarios()
        {
            List<PerfilUsuario> lista = new List<PerfilUsuario>();
      
            try
            {
                datos.setearConsulta("Select Id, Descripcion, Activo from Perfiles_Usuarios");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    PerfilUsuario aux = new PerfilUsuario();
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

        public void agregarPerfilUsuario(PerfilUsuario perfil)
        {
            try
            {
                datos.setearConsulta("Insert into Perfiles_Usuarios (Descripcion) VALUES (@Descripcion)");
                datos.SetearParametro("@Descripcion", perfil.descripcion);


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

        public void modificarPerfilUsuario(PerfilUsuario perfil)
        {

            try
            {
                datos.setearConsulta("Update Perfiles_Usuarios Set Descripcion = @descripcion where Id = @id");
                datos.SetearParametro("@descripcion", perfil.descripcion);
                datos.SetearParametro("@id", perfil.id);

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

        public void eliminarLogicoPerfilUsuario(int id)
        {
            try
            {
                datos.setearConsulta("Update Perfiles_Usuarios set Activo = 0 where id = @Id");
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