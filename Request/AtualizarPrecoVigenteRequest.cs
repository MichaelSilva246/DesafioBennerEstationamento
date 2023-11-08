namespace DesafioBenner.Request
{
    public class AtualizarPrecoVigenteRequest : AdicionarPrecoVigenteRequest
    {
        public int Id { get; set; }
        public DateTime Inicial { get; set; }
    }
}
