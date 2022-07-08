using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Turno
    {
        public Int64 id { get; set; }
        public Usuario paciente { get; set; }
        public DateTime fecha { get; set; } 
        public TimeSpan hora { get; set; }
        public Profesional profesional { get; set; }
        public Especialidad especialidad { get; set; }
        public string observaciones { get; set; }
        public EstadoTurno estado { get; set; }

        public override string ToString()
        {
            string mensaje = "Paciente: " + paciente.ToString() + ", Profesional: " + profesional.ToString();

            return mensaje;
        }
    }
}
