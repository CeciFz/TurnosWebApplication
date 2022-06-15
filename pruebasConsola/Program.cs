using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TurnosDominio;

namespace pruebasConsola
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Paciente paciente = new Paciente();
            Profesional prof = new Profesional();
            Turno turno = new Turno();

            paciente.nombres = "cecilia";
            paciente.apellidos = "Fernandez";

            prof.nombres = "Facundo";
            prof.apellidos = "Zumsteind";

            turno.paciente = paciente;
            turno.profesional = prof;

            Console.WriteLine(turno.ToString());
            Console.ReadKey();

        }
    }
}
