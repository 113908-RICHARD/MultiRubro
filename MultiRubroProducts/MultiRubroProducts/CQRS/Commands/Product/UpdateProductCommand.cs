using MediatR;
using MultiRubroProducts.DTOS.Requests.Updating;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Product
{
    public class UpdateProductCommand:IRequest<ProductResponse>
    {
        public UpdateProductRequest UpdateProductRequest { get; set; }
    }
}
