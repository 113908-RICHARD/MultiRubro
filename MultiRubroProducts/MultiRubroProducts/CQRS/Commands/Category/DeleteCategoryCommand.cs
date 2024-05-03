using MediatR;
using MultiRubroProducts.DTOS.Requests.Deletion;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Category
{
    public class DeleteCategoryCommand:IRequest<CategoryResponse>
    {
        public DeleteCategoryRequest DeleteCategoryRequest { get; set; }
    }
}
