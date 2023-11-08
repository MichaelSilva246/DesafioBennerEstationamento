using DesafioBenner.Entidades;
using DesafioBenner.Models;
using DesafioBenner.Request;

namespace DesafioBenner.Services.Interfaces
{
    public interface INovoVeiculoService
    {
        List<Veiculo> ObterTodos();
        void AtualizarComSaidaePrecoFinal(AtualizarVeiculoRequest request);
        void RegistrarEntrada(AdicionarVeiculoRequest request);
        Veiculo ObterPorPlaca(string placa);
        void Excluir(string placa);
        TabelaPrecoVigente ObterPorDataInicial(DateTime dataInicial, DateTime dataFinal);
    }
}
