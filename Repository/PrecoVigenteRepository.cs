using DesafioBenner.Contexts;
using DesafioBenner.Models;
using DesafioBenner.Repository.Interfaces;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;

namespace DesafioBenner.Repository
{
    public class PrecoVigenteRepository : IPrecoVigenteRepository
    {
        private readonly YourSafePlaceContext _context;
        public PrecoVigenteRepository(YourSafePlaceContext context)
        {
            _context = context;
        }       

        public void Adicionar(TabelaPrecoVigente precoVigenteEntity)
        {
            _context.TabelaPrecoVigentes.Add(precoVigenteEntity);
            _context.SaveChanges();
        }

        public void Atualizar(TabelaPrecoVigente precoVigenteEntity)
        {
            _context.TabelaPrecoVigentes.Update(precoVigenteEntity);
            _context.SaveChanges();
        }

        public void Excluir(int id)
        {
            var precoVigenteEntity = _context.TabelaPrecoVigentes.Find(id);

            if (precoVigenteEntity != null)
            {
                _context.TabelaPrecoVigentes.Remove(precoVigenteEntity);
                _context.SaveChanges();
            }
        }      

        public List<TabelaPrecoVigente> ObterPorDataInicial(DateTime dataInicial, DateTime dataFinal)
        {           
           return ObterTodos().Where(c => c.DataInicial >= dataInicial && c.DataInicial <= dataFinal).ToList();
        }
        
        public TabelaPrecoVigente ObterPorId(int id)
        {           
            return _context.TabelaPrecoVigentes.FirstOrDefault(c => c.Id == id);
        }    

        public List<TabelaPrecoVigente> ObterTodos()
        {
            return _context.TabelaPrecoVigentes.OrderBy(c => c.DataInicial).ToList();
        }
       
    }
}
