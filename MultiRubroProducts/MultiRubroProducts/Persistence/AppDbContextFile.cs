using Microsoft.EntityFrameworkCore;
using MultiRubroProducts.DbSet;

namespace MultiRubroProducts.Persistence
{
    public class AppDbContextFile: DbContext
    {
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Provider> Providers { get; set; }

        public AppDbContextFile(DbContextOptions<AppDbContextFile> options) : base(options)
        {


        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasOne(d => d.Provider)
                .WithMany(p => p.Products)
                .HasForeignKey(d => d.ProviderId) // Assuming ProviderId is the foreign key property
                .OnDelete(DeleteBehavior.NoAction)
                .HasConstraintName("FK_PRODUCT_PROVIDER");

                entity.HasOne(d => d.Category)
                    .WithMany()
                    .HasForeignKey(d => d.CategoryId) // Assuming CategoryId is the foreign key property
                    .OnDelete(DeleteBehavior.NoAction)
                    .HasConstraintName("FK_PRODUCT_CATEGORY");
            }
            );


        }
    }
}
    

