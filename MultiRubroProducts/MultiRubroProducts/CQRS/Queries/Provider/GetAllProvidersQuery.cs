using MediatR;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Queries.Provider
{
    public class GetAllProvidersQuery:IRequest<IEnumerable<ProviderResponse>>     
    {
    }
}
