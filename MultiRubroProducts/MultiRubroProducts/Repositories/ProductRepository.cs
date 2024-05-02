using Microsoft.EntityFrameworkCore;
using MultiRubroProducts.DbSet;
using MultiRubroProducts.Persistence;
using MultiRubroProducts.Repositories.Interfaces;


namespace MultiRubroProducts.Repositories
{
    public class ProductRepository:GenericRepository<Product>,IProductRepository
    {
        public ProductRepository(AppDbContextFile context, ILogger logger) : base(context, logger)
        {
        }

        public async Task<IEnumerable<Product?>> GetProductsFromProviderAsync(Guid providerId)
        {
            try
            {
               return await _dbSet.Where(x => x.ProviderId == providerId).ToListAsync();

            }catch (Exception ex)
            {
                _logger.LogError(ex, "{Repo} All function error", typeof(ProductRepository));
                throw;
            }
        }

        public override async Task<IEnumerable<Product>> All()
        {
            try
            {
                return await _dbSet.Where(x => x.Status == 1)
                    .AsNoTracking()
                    .AsSplitQuery()
                    .ToListAsync();

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "{Repo} All function error", typeof(ProductRepository));
                throw;
            }
        }
        public async override Task<bool> Delete(Guid id)
        {

            try
            {

                var result = await _dbSet.FirstOrDefaultAsync(x => x.Id == id);
                if (result == null) { return false; }

                result.Status = 0;
                result.UpdatedAt = DateTime.UtcNow;
                return true;

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "{Repo} Delete function error", typeof(ProductRepository));
                throw;

            }
        }
        public async override Task<bool> Update(Product entity)
        {
            try
            {
                var result = await _dbSet.FirstOrDefaultAsync(x => entity.Id == entity.Id);
                if (result == null) { return false; };

                result.UpdatedAt = DateTime.UtcNow;
                result.Description = entity.Description;
                result.Price = entity.Price;
                result.Stock = entity.Stock;
                
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "{Repo} Update function error", typeof(ProductRepository));
                throw;
            }
        }
    }
}
