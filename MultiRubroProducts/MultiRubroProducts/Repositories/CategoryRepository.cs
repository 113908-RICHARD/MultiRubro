
using Microsoft.EntityFrameworkCore;
using MultiRubroProducts.DbSet;
using MultiRubroProducts.Persistence;
using MultiRubroProducts.Repositories.Interfaces;


namespace MultiRubroProducts.Repositories
{
    public class CategoryRepository: GenericRepository<Category>, ICategoryRepository
    {

        public CategoryRepository(AppDbContextFile context, ILogger logger) : base(context, logger)
        {
        }

        public override async Task<IEnumerable<Category>> All()
        {
            try
            {
                return await  _dbSet.Where(x => x.Status == 1)
                    .AsNoTracking()
                    .AsSplitQuery()
                    .ToListAsync();

            }catch(Exception ex) {
                _logger.LogError(ex, "{Repo} All function error", typeof(CategoryRepository));
                throw;
            }
        }
        public override async Task<bool> Delete(Guid id)
        {
            try
            {

                var result = await _dbSet.FirstOrDefaultAsync(x => x.Id == id);
                if(result == null) { return false; }

                result.Status = 0;
                result.UpdatedAt = DateTime.UtcNow;
                return true;

            }catch(Exception ex)
            {
                _logger.LogError(ex, "{Repo} Delete function error", typeof(CategoryRepository));
                throw;

            }
        }
        public override async Task<bool> Update(Category entity)
        {
            try
            {
                var result = await _dbSet.FirstOrDefaultAsync(x => entity.Id == entity.Id);
                if (result == null) { return false; };

                result.UpdatedAt = DateTime.UtcNow;
                result.Description = entity.Description;
                return true;
            }
            catch(Exception ex)
            {
                _logger.LogError(ex, "{Repo} Update function error", typeof(CategoryRepository));
                throw;
            }
            
        }
    }
}
