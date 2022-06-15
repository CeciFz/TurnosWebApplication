using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TurnosDominio
{
    public class Turno
    {
        public int id { get; set; }
        public DateTime fecha { get; set; }
        public DateTime hora { get; set; }
        public Profesional profesional { get; set; }
        public Paciente paciente { get; set; }
        public string observaciones { get; set; }
        public EstadoTurno estado { get; set; }

        public override string ToString()
        {
            string mensaje = "Paciente: " + paciente.ToString() + ", Profesional: " + profesional.ToString();

            return mensaje;
        }
    }
}
