using MultiRubroProducts.Persistence;
using MultiRubroProducts.Repositories.Interfaces;

namespace MultiRubroProducts.Repositories
{
    public class UnitOfWork:IUnitOfWork,IDisposable
    {

        public ICategoryRepository Categories { get; set; }
        public IProductRepository Products { get;  set; }
        public IProviderRepository Providers { get; set; }
        private readonly AppDbContextFile _context; 

        public UnitOfWork(AppDbContextFile context,ILoggerFactory loggerFactory)
        {
            _context = context;
            var logger = loggerFactory.CreateLogger("logs");

            Categories = new CategoryRepository(context, logger);
            Products = new ProductRepository(context, logger);
            Providers = new ProviderRepository(context, logger);
        }

        public void Dispose()
        {
            _context.Dispose();
        }

        public async Task<bool> CompleteAsync()
        {
            var result = await _context.SaveChangesAsync();
            return result > 0;
        }
    }
}
