using MediatR;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Queries.Product
{
    public class GetProductByIdQuery:IRequest<ProductResponse>
    {
        public Guid Id { get; set; }
    }
}
