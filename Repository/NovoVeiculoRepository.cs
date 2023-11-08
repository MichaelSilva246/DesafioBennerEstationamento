using DesafioBenner.Contexts;
using DesafioBenner.Entidades;
using DesafioBenner.Models;
using DesafioBenner.Repository.Interfaces;
using DesafioBenner.Services.Interfaces;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;

namespace DesafioBenner.Repository
{
    public class NovoVeiculoRepository : INovoVeiculoRepository
    {
        private readonly YourSafePlaceContext _context;
        public NovoVeiculoRepository(YourSafePlaceContext context)
        {
            _context = context;
        }

        public void AtualizarComSaidaePrecoFinal(Veiculo veiculoEntitity)
        {
            _context.Veiculos.Update(veiculoEntitity);
            _context.SaveChanges();
        }

        public void Excluir(string placa)
        {
            var veiculoEntity = _context.Veiculos.Find(placa);

            if (veiculoEntity != null)
            {
                _context.Veiculos.Remove(veiculoEntity);
                _context.SaveChanges();
            }
        }

        public bool ExistePlaca(string placa)
        {
            throw new NotImplementedException();
        }

        public Veiculo ObterPorPlaca(string placa)
        {
            return _context.Veiculos.FirstOrDefault(c => c.Placa == placa);
        }

        public List<Veiculo> ObterTodos()
        {
            return _context.Veiculos.OrderBy(c => c.DataEntrada).ToList();
        }

        public void RegistrarEntrada(Veiculo veiculoEntity)
        {
            _context.Veiculos.Add(veiculoEntity);
            _context.SaveChanges();
        }      
    }
}
