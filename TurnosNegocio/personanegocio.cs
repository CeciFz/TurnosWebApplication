using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace TurnosNegocio
{
    public class PersonaNegocio
    {
        public List<Persona> listarpersonas()
        {
            List<Persona> lista = new List<Persona>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select Apellidos,Nombres,FechaNacimiento,Sexo,TipoDoc,NroDocumento,Obra_Social,Telefono,Mail,FechaAlta from VW_Personas");
                datos.lecturaDatos();
                while (datos.Lector.Read())
                {

                    Persona aux = new Persona();

                    aux.apellidos = (string)datos.Lector["Apellidos"];
                    aux.nombres = (string)datos.Lector["Nombres"];
                    aux.fechaNacimiento = (DateTime)datos.Lector["FechaNacimiento"];
                    aux.sexo = (string)datos.Lector["Sexo"];
                    aux.telefono = (string)datos.Lector["Telefono"];
                    aux.mail = (string)datos.Lector["Mail"];  
                    aux.tipoDocumento = new TipoDocumento();
                    //aux.tipoDocumento.id = (Int16)datos.Lector["Id"];
                    aux.tipoDocumento.descripcion = (string)datos.Lector["TipoDoc"];
                    aux.nroDocumento = (Int64)datos.Lector["NroDocumento"];
                   
                    aux.obraSocial = new ObraSocial();
                    //aux.obraSocial.id = (Int32)datos.Lector["Id"];
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

    }
}
