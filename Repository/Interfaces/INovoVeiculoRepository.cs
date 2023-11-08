using DesafioBenner.Contexts;
using DesafioBenner.Entidades;
using DesafioBenner.Models;
using Microsoft.EntityFrameworkCore;

namespace DesafioBenner.Repository.Interfaces
{
    public interface INovoVeiculoRepository
    {
        public bool ExistePlaca(string placa);       
        Veiculo ObterPorPlaca(string placa);
        void AtualizarComSaidaePrecoFinal(Veiculo veiculoEntitity);
        void Excluir(string placa);
        List<Veiculo> ObterTodos();
        void RegistrarEntrada(Veiculo veiculoEntitity);

    }
}
