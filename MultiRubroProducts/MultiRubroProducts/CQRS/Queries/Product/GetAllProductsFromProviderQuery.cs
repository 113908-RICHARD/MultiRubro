using MediatR;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Queries.Product
{
    public class GetAllProductsFromProviderQuery:IRequest<IEnumerable<ProductResponse>>
    {
        public Guid ProviderId { get; set; }    
    }
}
