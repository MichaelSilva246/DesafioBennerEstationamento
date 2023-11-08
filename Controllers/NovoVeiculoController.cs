using DesafioBenner.Request;
using DesafioBenner.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Client;

namespace DesafioBenner.Controllers
{
    [ApiController]
    [Route("api/Precofinal")]
    public class NovoVeiculoController : Controller
    {
        private readonly INovoVeiculoService _novoVeiculoService;

        public NovoVeiculoController(INovoVeiculoService novoVeiculoService)
        {   
            _novoVeiculoService = novoVeiculoService;           
        }

        [HttpPost]
        public IActionResult RegistrarEntrada([FromQuery] AdicionarVeiculoRequest request)
        {            
            _novoVeiculoService.RegistrarEntrada(request);
            return Ok();
        }
        [HttpPut]
        public IActionResult AtualizarComSaidaePrecoFinal([FromQuery] AtualizarVeiculoRequest request)
        {
            _novoVeiculoService.AtualizarComSaidaePrecoFinal(request);
            return Ok();
        }
        [HttpGet("obter-pela-placa")]
        public IActionResult ObterPorPlaca([FromQuery] string placa)
        {
            return Ok(_novoVeiculoService.ObterPorPlaca(placa));
        }
        [HttpGet]
        public IActionResult ObterTodos()
        {
            return Ok(_novoVeiculoService.ObterTodos());
        }
        [HttpDelete("excluir-pela-placa")]
        public IActionResult Excluir(string placa)
        {
            _novoVeiculoService.Excluir(placa);
            return Ok();
        }
    }
}