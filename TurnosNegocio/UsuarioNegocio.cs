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
        private AccesoDatos datos = new AccesoDatos();
        public List<Usuario> listarUsuarios()
        {
            List<Usuario> lista = new List<Usuario>();

            try
            {
                datos.setearSP("SP_ListarUsuarios");
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
                    aux.tipoDocumento.id = (Int16)datos.Lector["IdTipoDoc"];
                    aux.tipoDocumento.descripcion = (string)datos.Lector["TipoDoc"];
                    aux.nroDocumento = (Int64)datos.Lector["NroDocumento"];

                    aux.obraSocial = new ObraSocial();
                    aux.obraSocial.id = (Int32)datos.Lector["IdObraSocial"];
                    aux.obraSocial.descripcion = (string)datos.Lector["ObraSocial"];

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

        private void cargarPerfilesUsuarios(Usuario usuario)
        {
            AccesoDatos datosPerfil = new AccesoDatos();
            usuario.perfileslUsuario = new List<PerfilUsuario>();

            try
            {
                datosPerfil.setearConsulta("Select IdUsuario, IdPerfil, Perfil from VW_UsuariosConPerfil");
                datosPerfil.lecturaDatos();

                while (datosPerfil.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.id = (Int64)datosPerfil.Lector["IdUsuario"];

                    if (aux.id == usuario.id)
                    {
                        PerfilUsuario perfil = new PerfilUsuario();
                        perfil.id = (Int16)datosPerfil.Lector["IdPerfil"];
                        perfil.descripcion = (String)datosPerfil.Lector["Perfil"];
                        usuario.perfileslUsuario.Add(perfil);
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                datosPerfil.cerrarConexion();
            }
        }

        public void agregarUsuarioConSP(Usuario usuario, Int16 perfil, Int32 IdEsp =-1, Int64 IdHorario=-1)
        {

            try
            {
                datos.setearSP("SP_AltaUsuario");
                datos.SetearParametro("@Apellidos", usuario.apellidos);
                datos.SetearParametro("@Nombres", usuario.nombres);
                datos.SetearParametro("@FechaNacimiento", usuario.fechaNacimiento);
                datos.SetearParametro("@Sexo", usuario.sexo);
                datos.SetearParametro("@IdTipoDocumento", usuario.tipoDocumento.id);
                datos.SetearParametro("@NroDocumento", usuario.nroDocumento);
                datos.SetearParametro("@Telefono", usuario.telefono);
                datos.SetearParametro("@Mail", usuario.mail);
                datos.SetearParametro("@IdObraSocial", usuario.obraSocial.id);
                datos.SetearParametro("@IdPerfilUsuario", perfil);
                datos.SetearParametro("@IdEspecialidad", IdEsp);
                datos.SetearParametro("@IdHorario", IdHorario);

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
        public void modificarUsuarioConSP(Usuario usuario, Int16 perfil, Int32 IdEsp = -1, Int64 IdHorario = -1)
        {

            try
            {
                datos.setearSP("SP_ModificarUsuario");
                datos.SetearParametro("@IdUsuario", usuario.id);
                datos.SetearParametro("@Apellidos", usuario.apellidos);
                datos.SetearParametro("@Nombres", usuario.nombres);
                datos.SetearParametro("@FechaNacimiento", usuario.fechaNacimiento);
                datos.SetearParametro("@Sexo", usuario.sexo);
                datos.SetearParametro("@IdTipoDocumento", usuario.tipoDocumento.id);
                datos.SetearParametro("@NroDocumento", usuario.nroDocumento);
                datos.SetearParametro("@Telefono", usuario.telefono);
                datos.SetearParametro("@Mail", usuario.mail);
                datos.SetearParametro("@IdObraSocial", usuario.obraSocial.id);
                datos.SetearParametro("@IdPerfilUsuario", perfil);
                datos.SetearParametro("@IdEspecialidad", IdEsp);
                datos.SetearParametro("@IdHorario", IdHorario);

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

        /****************************PACIENTES*****************************************/
        public List<Usuario> listarPacientes(Int64 idPaciente= -1)
        {
            List<Usuario> lista = new List<Usuario>();

            try
            {
                datos.setearSP("SP_ListarPacientes");
                datos.SetearParametro("@IdPaciente", idPaciente);
                datos.lecturaDatos();
                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();

                    aux.id = (Int64)datos.Lector["Id"];
                    aux.nombres = (string)datos.Lector["NombreCompleto"];
                    
                    aux.fechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    aux.edad = (int)datos.Lector["Edad"];
                    aux.sexo = (string)datos.Lector["Genero"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.mail = (string)datos.Lector["Mail"];
                    aux.tipoDocumento = new TipoDocumento();
                    aux.tipoDocumento.id = (Int16)datos.Lector["IdTipoDoc"];
                    aux.tipoDocumento.descripcion = (string)datos.Lector["TipoDoc"];
                    aux.nroDocumento = (Int64)datos.Lector["NroDocumento"];

                    aux.obraSocial = new ObraSocial();
                    aux.obraSocial.id = (Int32)datos.Lector["IdObraSocial"];
                    aux.obraSocial.descripcion = (string)datos.Lector["ObraSocial"];

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
