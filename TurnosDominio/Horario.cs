using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Horario
    {
        public Int64 idHorario { get; set; }
        public string dia { get; set; }
        public TimeSpan horaInicio { get; set; }
        public TimeSpan horaFin { get; set; }
        public Int16 frecuencia { get; set; }
        public bool activo { get; set; }
        public string descripcion { get; set; }

        public override string ToString()
        {
            return dia + " " + horaInicio + " a " + horaFin;
        }
    }
}
