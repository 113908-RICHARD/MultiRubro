using MediatR;
using MultiRubroProducts.DTOS.Requests;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Category
{
    public class CreateCategoryCommand:IRequest<CategoryResponse>
    {
        public CreateCategoryRequest CreateCategoryRequest { get; set; }
    }
}
