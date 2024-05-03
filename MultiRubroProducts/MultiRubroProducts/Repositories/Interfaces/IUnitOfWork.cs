namespace MultiRubroProducts.Repositories.Interfaces
{
    public interface IUnitOfWork
    {
        IProductRepository Products { get; }
        ICategoryRepository Categories { get; }
        IProviderRepository Providers { get; }
        Task<bool> CompleteAsync();

    }
}
