using Microsoft.EntityFrameworkCore;
using MultiRubroProducts.Persistence;
using MultiRubroProducts.Repositories.Interfaces;

namespace MultiRubroProducts.Repositories
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {

        public readonly ILogger _logger;
        protected AppDbContextFile _context;
        internal DbSet<T> _dbSet;

        public GenericRepository(AppDbContextFile context, ILogger logger)
        {
             _logger = logger;
            _context = context;

            _dbSet = context.Set<T>();
        }

        public virtual async Task<bool> Add(T entity)
        {
           await _dbSet.AddAsync(entity);
            return true;
        }

        public virtual async Task<IEnumerable<T>> All()
        {
            throw new NotImplementedException();
        }

        public virtual async Task<bool> Delete(Guid id)
        {
            throw new NotImplementedException();
        }

        public virtual async Task<T?> GetById(Guid id)
        {
            return await _dbSet.FindAsync(id);
        }

        public virtual async Task<bool> Update(T entity)
        {
            throw new NotImplementedException();
        }
    }
}
