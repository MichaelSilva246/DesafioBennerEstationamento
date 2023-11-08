using DesafioBenner.Entidades;
using DesafioBenner.Models;
using Microsoft.EntityFrameworkCore;
using System.Runtime;

namespace DesafioBenner.Contexts
{
    public class YourSafePlaceContext : DbContext
    {
        public YourSafePlaceContext(DbContextOptions<YourSafePlaceContext> dbContextOptions) : base(dbContextOptions)
        {

        }
        public DbSet<Veiculo> Veiculos { get; set; }
        public DbSet<TabelaPrecoVigente> TabelaPrecoVigentes { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TabelaPrecoVigente>().ToTable("PrecoVigente");
            modelBuilder.Entity<TabelaPrecoVigente>().HasKey(c => c.Id);

            modelBuilder.Entity<Veiculo>().ToTable("Veiculos");
            modelBuilder.Entity<Veiculo>().HasKey(c => c.Placa);
        }     
       

    }
}
