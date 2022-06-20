using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Persona         // TODO: Ver como agregarle la lista para asociarle costo y profesion
    {                            // si es un profesional
        public Int64 id { get; set; }
        public string apellidos { get; set; }
        public string nombres { get; set; }        
        public DateTime fechaNacimiento { get; set; }
        public string sexo { get; set; }
        public TipoDocumento tipoDocumento { get; set; }
        public Int64 nroDocumento { get; set; }
        public string telefono { get; set; }
        public DBNull mail { get; set; } //verificarrrr tipo null string
        public ObraSocial obraSocial { get; set; }
        public DateTime fechaAlta { get; set; }
        
        public bool activo { get; set; }

        public override string ToString()
        {
            return apellidos + ", " + nombres;
        }
    }
}
