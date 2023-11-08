using DesafioBenner.Entidades;
using DesafioBenner.Models;

namespace DesafioBenner.Repository.Interfaces
{
    public interface IPrecoVigenteRepository
    {        
        void Adicionar(TabelaPrecoVigente precoVigenteEntity);

        TabelaPrecoVigente ObterPorId(int id);

        void Atualizar(TabelaPrecoVigente precoVigenteEntity);

        void Excluir(int id);

        List<TabelaPrecoVigente> ObterTodos();
        List<TabelaPrecoVigente> ObterPorDataInicial(DateTime dataInicial, DateTime dataFinal);
    }
}
