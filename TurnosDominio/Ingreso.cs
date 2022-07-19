using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
   /* public enum tipousuarios
    {
      //  normal = 1,
     //   admin = 2

        admin = 1,
        gestion = 2,
        paciente = 3,
        profesional = 4
    }*/

    public class Ingreso
    {

        public int idIngreso { get; set; }
        public string user { get; set; }

        public string pass { get; set; }

        public Int16 tipoUsuario  { get; set; }

        public Usuario usuario{ get; set; }


        /* public Ingreso (string user, string pass, bool admin)
        {
              User = user;
               Pass = pass;

              //?operador ternario, if de una linea, envia true si es admin, sino false
          TipoUsuario = admin? tipousuarios.admin : tipousuarios.normal;


           }*/
         public Ingreso (string user, string pass)
        {
              this.user = user;
              this.pass = pass;

              //?operador ternario, if de una linea, envia true si es admin, sino false
          //TipoUsuario = admin? tipousuarios.admin : tipousuarios.gestion: tipousuarios.paciente;


           }


    }
}
