using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace TurnosNegocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> listarUsuarios()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select Id, Apellidos,Nombres,FechaNacimiento,Sexo,TipoDoc,NroDocumento,Obra_Social,Telefono,Mail,FechaAlta from VW_Usuarios");
                datos.lecturaDatos();
                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();

                    aux.id = (Int64)datos.Lector["Id"];
                    aux.apellidos = (string)datos.Lector["Apellidos"];
                    aux.nombres = (string)datos.Lector["Nombres"];
                    aux.fechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    aux.sexo = (string)datos.Lector["Sexo"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.mail = (string)datos.Lector["Mail"];  
                    aux.tipoDocumento = new TipoDocumento();
                    //aux.tipoDocumento.id = (Int16)datos.Lector["IdTipoDoc"];  Si lo precisamos, hay que agregarlo vista y consulta tmb
                    aux.tipoDocumento.descripcion = (string)datos.Lector["TipoDoc"];
                    aux.nroDocumento = (Int64)datos.Lector["NroDocumento"];

                    aux.obraSocial = new ObraSocial();
                    //aux.obraSocial.id = datos.Lector["Id"]; Si lo precisamos, hay que agregarlo vista y consulta tmb
                    aux.obraSocial.descripcion = (string)datos.Lector["Obra_Social"];
                    
                    aux.fechaAlta = (DateTime)datos.Lector["FechaAlta"];

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








        /*
        public void eliminarUsuario(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("delete from Personas where id = @id");
                datos.SetearParametro("@id", id);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        */
        }
}
