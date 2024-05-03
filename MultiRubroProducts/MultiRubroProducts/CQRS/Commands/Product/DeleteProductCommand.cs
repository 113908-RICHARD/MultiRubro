using MediatR;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Product
{
    public class DeleteProductCommand:IRequest<ProductResponse>
    {
        public DeleteProductCommand DeleteProductRequest { get; set; }
    }
}
