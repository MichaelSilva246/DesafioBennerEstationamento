using Azure.Core;
using DesafioBenner.Entidades;
using DesafioBenner.Models;
using DesafioBenner.Repository;
using DesafioBenner.Repository.Interfaces;
using DesafioBenner.Request;
using Microsoft.EntityFrameworkCore;
using System.Numerics;

namespace DesafioBenner.Services.Interfaces
{
    public class NovoVeiculoService : INovoVeiculoService
    {
        private readonly IPrecoVigenteRepository _precoVigenteRepository;
        private readonly INovoVeiculoRepository _veiculoRepository;
        public NovoVeiculoService(IPrecoVigenteRepository precoVigenteRepository, INovoVeiculoRepository veiculoRepository)
        {
            _precoVigenteRepository = precoVigenteRepository;
            _veiculoRepository = veiculoRepository;
        }

        public void AtualizarComSaidaePrecoFinal(AtualizarVeiculoRequest request)
        {
            var veiculoEntitity = _veiculoRepository.ObterPorPlaca(request.Placa);

            if (veiculoEntitity is not null)
            {
                veiculoEntitity.DataSaida = DateTime.Now;

                _veiculoRepository.AtualizarComSaidaePrecoFinal(veiculoEntitity);
            }
            CalcularEImprimirValorDevido(request.Placa);
        }

        public void Excluir(string placa)
        {
            var veiculoEntitity = _veiculoRepository.ObterPorPlaca(placa);

            if (veiculoEntitity is not null)
            {
                _veiculoRepository.Excluir(placa);
            }
        }

        public void RegistrarEntrada(AdicionarVeiculoRequest request)
        {
            if (string.IsNullOrWhiteSpace(request.Placa))
            {
                throw new ArgumentNullException("A placa não pode ser nula ou vazia.", nameof(request.Placa));
            }

            var veiculoEntitity = new Veiculo();

            veiculoEntitity.Placa = request.Placa;
            veiculoEntitity.DataEntrada = DateTime.Now;

            _veiculoRepository.RegistrarEntrada(veiculoEntitity);

        }

        public Veiculo ObterPorPlaca(string placa)
        {
            var veiculoEntitity = _veiculoRepository.ObterPorPlaca(placa);

            return veiculoEntitity is null ? null : veiculoEntitity;
        }

        public List<Veiculo> ObterTodos()
        {
            var veiculoEntitity = _veiculoRepository.ObterTodos();

            return veiculoEntitity;
        }
        public double CalcularEImprimirValorDevido(string placa)
        {
            var tabelaNovoVeiculo = _veiculoRepository.ObterPorPlaca(placa);
            var tabelaPrecoVigente = _precoVigenteRepository.ObterTodos()
            .Where(item => tabelaNovoVeiculo.DataEntrada >= item.DataInicial && tabelaNovoVeiculo.DataEntrada <= item.DataFinal)
            .FirstOrDefault();   
           
            if (tabelaNovoVeiculo.DataSaida is null)
            {
                throw new Exception("O carro ainda está estacionado!");
            }

            TimeSpan tempoEstacionamento = tabelaNovoVeiculo.DataSaida.Value - tabelaNovoVeiculo.DataEntrada;
            int horas = (int)tempoEstacionamento.TotalHours;
            int minutos = tempoEstacionamento.Minutes;

            double valorDevido;

            if (tabelaPrecoVigente is null)
            {
                throw new Exception("Você não tem selecionado uma tabela de preco válida!");
            }

            if (horas == 0 && minutos <= 30)
            {
                valorDevido = (double)tabelaPrecoVigente.ValorPrimeiraHora / 2.0;
            }
            else if (horas <= 1 && minutos <= 10)
            {
                valorDevido = (double)tabelaPrecoVigente.ValorPrimeiraHora;
            }
            else
            {
                if (minutos <= 10)
                {
                    horas = horas - 1;
                }
                valorDevido = (double)tabelaPrecoVigente.ValorPrimeiraHora + (double)(tabelaPrecoVigente.ValorHoraAdicional * horas);
            }
            valorDevido = (double)tabelaPrecoVigente.ValorPrimeiraHora + ((double)tabelaPrecoVigente.ValorHoraAdicional * horas);
            return valorDevido;

            Console.WriteLine($"Valor total a pagar: R$:{valorDevido}");
            Console.ReadKey();
        }

        public TabelaPrecoVigente ObterPorDataInicial(DateTime dataInicial, DateTime dataFinal)
        {
            return ObterPorDataInicial(dataInicial, dataFinal);
        }
    }
}