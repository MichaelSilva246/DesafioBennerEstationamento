using System.ComponentModel.DataAnnotations;

namespace DesafioBenner.Models
{
    public class TabelaPrecoVigente
    {
        public int Id {  get; set; }        
        public DateTime DataInicial { get; set; }       
        public DateTime DataFinal { get; set; }
        public decimal ValorPrimeiraHora { get; set; }
        public decimal ValorHoraAdicional { get; set; }

    }
}