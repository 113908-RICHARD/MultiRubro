using MediatR;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Queries.Category
{
    public class GetCategoryByIdQuery:IRequest<CategoryResponse>
    {
        public Guid Id { get; set; }
    }
}
