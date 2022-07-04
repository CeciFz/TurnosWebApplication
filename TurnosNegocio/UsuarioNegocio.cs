using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;
using TurnosNegocio;

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

                    cargarPerfilesUsuarios(aux);

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

        private void cargarPerfilesUsuarios( Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            usuario.perfileslUsuario = new List<PerfilUsuario>();

            try
            {
                datos.setearConsulta("Select IdUsuario, IdPerfil, Perfil from VW_UsuariosConPerfil");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.id = (Int64)datos.Lector["IdUsuario"];

                    if (aux.id == usuario.id)
                    {
                        PerfilUsuario perfil = new PerfilUsuario();
                        perfil.id = (Int16)datos.Lector["IdPerfil"];
                        perfil.descripcion = (String)datos.Lector["Perfil"];
                        usuario.perfileslUsuario.Add(perfil);
                    }
                }
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

        public void agregarusuario(Usuario usuario )
         {
            AccesoDatos datos = new AccesoDatos();
            try
             {
                 datos.setearConsulta("Insert into Usuarios (Apellidos,Nombres,FechaNacimiento,Sexo,IdTipoDocumento,NroDocumento,Telefono,Mail,IdObraSocial) VALUES (@Apellidos,@Nombres,@FechaNacimiento,@Sexo,@IdTipoDocumento,@NroDocumento,@Telefono,@Mail,@IdObraSocial)");
                    datos.SetearParametro("@Apellidos",usuario.apellidos);
                    datos.SetearParametro("@Nombres",usuario.nombres);
                    datos.SetearParametro("@FechaNacimiento",usuario.fechaNacimiento);
                    datos.SetearParametro("@Sexo",usuario.sexo);
                    datos.SetearParametro("@IdTipoDocumento",usuario.tipoDocumento.id);
                    datos.SetearParametro("@NroDocumento",usuario.nroDocumento);
                    datos.SetearParametro("@Telefono",usuario.telefono);
                    datos.SetearParametro("@Mail",usuario.mail);
                    datos.SetearParametro("@IdObraSocial",usuario.obraSocial.id);
                    

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
