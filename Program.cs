using DesafioBenner.Contexts;
using DesafioBenner.Repository;
using DesafioBenner.Repository.Interfaces;
using DesafioBenner.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<IPrecoVigenteService, PrecoVigenteService>();
builder.Services.AddScoped<IPrecoVigenteRepository, PrecoVigenteRepository>();

builder.Services.AddScoped<INovoVeiculoService, NovoVeiculoService>();
builder.Services.AddScoped<INovoVeiculoRepository, NovoVeiculoRepository>();

builder.Services.AddDbContext<YourSafePlaceContext>(opt =>
{
    opt.UseSqlServer(builder.Configuration.GetConnectionString("Estacionamento"));
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
