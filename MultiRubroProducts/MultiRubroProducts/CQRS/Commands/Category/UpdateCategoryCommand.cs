using MediatR;
using MultiRubroProducts.DTOS.Requests.Updating;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Category
{
    public class UpdateCategoryCommand:IRequest<CategoryResponse>
    {
        public UpdateCategoryRequest UpdateCategoryRequest { get; set; }
    }
}
