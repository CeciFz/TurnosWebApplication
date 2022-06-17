using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace TurnosNegocio
{
    public class personanegocio
    {
        public List<Persona> listarpersonas()
        {
            List<Persona> lista = new List<Persona>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select Id,Apellidos,Nombres,FechaNacimiento,Sexo,IdTipoDocumento,NroDocumento,FechaAlta,Activo from Personas");
                datos.lecturaDatos();

                while (datos.Lector.Read())
                {

                    Persona aux = new Persona();

                    aux.id = (Int64)datos.Lector["Id"];
                    aux.apellidos = (string)datos.Lector["Apellidos"];
                    aux.nombres = (string)datos.Lector["Nombres"];
                    aux.fechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    aux.sexo = (string)datos.Lector["Sexo"];
                   //aux.tipoDocumento = (TipoDocumento)datos.Lector["IdTipoDocumento"];
                    aux.nroDocumento = (Int64)datos.Lector["NroDocumento"];
                    //aux.fechaAlta = (DateTime)datos.Lector["FechaAlta"];
                   // aux.activo = (bool)datos.Lector["Activo"];

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
