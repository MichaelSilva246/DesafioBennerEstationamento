using Azure.Core;
using DesafioBenner.Models;
using DesafioBenner.Repository.Interfaces;
using DesafioBenner.Request;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.EntityFrameworkCore;
using System.Runtime.ExceptionServices;

namespace DesafioBenner.Services.Interfaces
{
    public class PrecoVigenteService : IPrecoVigenteService
    {
        private readonly IPrecoVigenteRepository _precoVigenteRepository;
        private readonly INovoVeiculoRepository _novoVeiculoRepository;
        public PrecoVigenteService(IPrecoVigenteRepository precoVigenteRepository, INovoVeiculoRepository novoVeiculoRepository)
        {
            _precoVigenteRepository = precoVigenteRepository;
            _novoVeiculoRepository = novoVeiculoRepository; 
        }      


        public void Atualizar(AtualizarPrecoVigenteRequest request)
        {
            var precoVigenteEntity = _precoVigenteRepository.ObterPorId(request.Id);

            if (precoVigenteEntity is not null)
            {
                precoVigenteEntity.DataInicial = request.DataInicial;
                precoVigenteEntity.DataFinal = request.DataFinal;
                precoVigenteEntity.ValorPrimeiraHora = request.ValorPrimeiraHora;
                precoVigenteEntity.ValorHoraAdicional = request.ValorHoraAdicional;

                _precoVigenteRepository.Atualizar(precoVigenteEntity);
            }
            
        }

        public void Excluir(int id)
        {
            var precoVigenteEntity = _precoVigenteRepository.ObterPorId(id);

            if (precoVigenteEntity is not null)
            {
                _precoVigenteRepository.Excluir(id);
            }
        }

        public void Novo(AdicionarPrecoVigenteRequest request)
        {
            var precoVigenteEntity = new TabelaPrecoVigente();
            precoVigenteEntity.DataInicial = request.DataInicial;
            precoVigenteEntity.DataFinal = request.DataFinal;
            precoVigenteEntity.ValorPrimeiraHora = request.ValorPrimeiraHora;
            precoVigenteEntity.ValorHoraAdicional = request.ValorHoraAdicional;

            _precoVigenteRepository.Adicionar(precoVigenteEntity);
        }

        public TabelaPrecoVigente ObterPorDataInicial(DateTime dataInicial, DateTime? dataFinal)
        {
            if (!dataFinal.HasValue)
            {
                dataFinal = DateTime.Now;
            }

            return ObterPorDataInicial(dataInicial, dataFinal.Value);
        }

        public TabelaPrecoVigente ObterPorId(int id)
        {
            var precoVigenteEntity = _precoVigenteRepository.ObterPorId(id);

            return precoVigenteEntity is null ? null : precoVigenteEntity;
        }

        public List<TabelaPrecoVigente> ObterTodos()
        {            
            return _precoVigenteRepository.ObterTodos();             
        }

        List<TabelaPrecoVigente> IPrecoVigenteService.ObterPorDataInicial(DateTime dataInicial, DateTime? dataFinal)
        {
            throw new NotImplementedException();
        }
    }    
}
