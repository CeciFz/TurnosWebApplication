using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public enum tipousuarios
    {
        normal = 1,
        admin = 2

    }

    public class ingresos
    {

        public int id { get; set; }
        public string user { get; set; }

        public string pass { get; set; }

        public tipousuarios tipoUsuario { get; set; }


        public ingresos (string user, string pass, bool admin)
      {
        user = user;
        pass = pass;

            //?operador ternario, if de una linea, envia true si es admin, sino false
        tipoUsuario = admin? tipousuarios.admin : tipousuarios.normal;


         }
    }
}
