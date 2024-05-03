using MediatR;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Queries.Provider
{
    public class GetProviderByIdQuery:IRequest<ProviderResponse>
    {
        public Guid Id { get; set; }
    }
}
