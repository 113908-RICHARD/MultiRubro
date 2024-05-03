using MultiRubroProducts.DbSet;

namespace MultiRubroProducts.Repositories.Interfaces
{
    public interface IProductRepository:IGenericRepository<Product>
    {
        Task<IEnumerable<Product?>> GetProductsFromProviderAsync(Guid providerId);
    }
}
