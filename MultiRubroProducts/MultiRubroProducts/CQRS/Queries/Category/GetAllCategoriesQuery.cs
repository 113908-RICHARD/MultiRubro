using MediatR;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Queries.Category
{
    public class GetAllCategoriesQuery:IRequest<IEnumerable<CategoryResponse>>
    {
    }
}
