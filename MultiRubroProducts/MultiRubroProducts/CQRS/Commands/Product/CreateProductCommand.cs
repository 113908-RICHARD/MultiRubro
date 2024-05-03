using MediatR;
using MultiRubroProducts.DTOS.Requests;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Product
{
    public class CreateProductCommand : IRequest<ProductResponse>
    {
        public CreateProductRequest CreateProductRequest { get; set; }
    }
}
