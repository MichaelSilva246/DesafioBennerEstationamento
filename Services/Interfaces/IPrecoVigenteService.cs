using DesafioBenner.Models;
using DesafioBenner.Request;

namespace DesafioBenner.Services.Interfaces
{
    public interface IPrecoVigenteService
    {
        void Atualizar(AtualizarPrecoVigenteRequest request);
        void Excluir(int id);
        void Novo(AdicionarPrecoVigenteRequest request);
        TabelaPrecoVigente ObterPorId(int id);
        List<TabelaPrecoVigente> ObterTodos();
        List<TabelaPrecoVigente> ObterPorDataInicial(DateTime dataInicial, DateTime? dataFinal);
    }
}
