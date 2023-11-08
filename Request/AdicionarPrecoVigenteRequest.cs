using System.ComponentModel.DataAnnotations;

namespace DesafioBenner.Request
{
    public class AdicionarPrecoVigenteRequest
    {
        public DateTime DataInicial { get; set; }        
        public DateTime DataFinal { get; set; }
        public decimal ValorPrimeiraHora { get; set; }
        public decimal ValorHoraAdicional { get; set; }
    }
}
