using DesafioBenner.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DesafioBenner.Entidades
{
    public class Veiculo
    {        
        public string Placa { get; set; }
        public DateTime DataEntrada { get; set; }
        public DateTime? DataSaida { get; set; }           
    }
}
