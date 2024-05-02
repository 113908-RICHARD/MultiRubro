using Microsoft.EntityFrameworkCore;
using MultiRubroProducts.DbSet;
using MultiRubroProducts.Persistence;
using MultiRubroProducts.Repositories.Interfaces;


namespace MultiRubroProducts.Repositories
{
    public class ProviderRepository:GenericRepository<Provider>,IProviderRepository
    {
        public ProviderRepository(AppDbContextFile context, ILogger logger) : base(context, logger)
        {
        }

        public override async Task<IEnumerable<Provider>> All()
        {
            try
            {
                return await _dbSet.Where(x => x.Status == 1)
                    .AsNoTracking()
                    .AsSplitQuery()
                    .ToListAsync();
            }catch(Exception ex)
            {
                _logger.LogError(ex, "{Repo} All function error", typeof(ProviderRepository));
                throw;
            }
        }
        public async override Task<bool> Update(Provider entity)
        {
            try
            {
                var result = await _dbSet.FirstOrDefaultAsync(x => entity.Id == entity.Id);
                if (result == null) { return false; };

                result.UpdatedAt = DateTime.UtcNow;
                result.Cellphone = entity.Cellphone;
                result.Address = entity.Address;
                result.Name = entity.Name;
              

                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "{Repo} Update function error", typeof(ProviderRepository));
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
                _logger.LogError(ex, "{Repo} Delete function error", typeof(ProviderRepository));
                throw;

            }
        }
    }
}
