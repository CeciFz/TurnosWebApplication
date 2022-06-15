using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class ObraSocial
    {
        public int id { get; set; }
        public string descripcion { get; set; }
        public bool activo { get; set; }
        public override string ToString()
        {
            return descripcion;
        }

    }
}
