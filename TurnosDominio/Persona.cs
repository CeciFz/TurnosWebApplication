using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Persona    
    {
        public int id { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public char sexo { get; set; }
        public string tipoDocumento { get; set; }
        public int nroDocumento { get; set; }
        public DateTime fechaAlta { get; set; }
        public bool activo { get; set; }

       

        public override string ToString()
        {
            return apellidos + ", " + nombres;
        }
    }
}
