using DesafioBenner.Models;
using DesafioBenner.Request;
using DesafioBenner.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace DesafioBenner.Controllers
{
    [ApiController]
    [Route("api/Precovigente")]
    public class PrecoVigenteController : Controller
    {
        private readonly IPrecoVigenteService _precoVigenteService;

        public PrecoVigenteController(IPrecoVigenteService precoVigenteService)
        {
            _precoVigenteService = precoVigenteService;
        }
        [HttpPost]
        public IActionResult Novo([FromQuery] AdicionarPrecoVigenteRequest request)
        {
            _precoVigenteService.Novo(request);
            return Ok();
        }
        [HttpPut]
        public IActionResult Atualizar([FromQuery] AtualizarPrecoVigenteRequest request)
        {
            _precoVigenteService.Atualizar(request);
            return Ok();
        }
        [HttpGet("obter-por-id")]
        public IActionResult ObterPorId([FromQuery] int id)
        {
            return Ok(_precoVigenteService.ObterPorId(id));
        }
        [HttpGet()]
        public IActionResult ObterTodos()
        {
            return Ok(_precoVigenteService.ObterTodos());
        }

        [HttpGet("obter-por-datainicial")]
        public IActionResult ObterPorDataInicial([FromQuery] DateTime dataInicial, [FromQuery] DateTime? dataFinal)
        {
            if (!dataFinal.HasValue)
            {
                dataFinal = DateTime.Now;
            }
            List<TabelaPrecoVigente> resultado = _precoVigenteService.ObterPorDataInicial(dataInicial, dataFinal.Value);

            return Ok(resultado);
            
        }

        [HttpDelete("Excluir/{id}")]        
        public IActionResult Excluir(int id)
        {
            _precoVigenteService.Excluir(id);
            return Ok();
        }
    }
}
