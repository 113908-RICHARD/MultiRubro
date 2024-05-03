using MediatR;
using MultiRubroProducts.DTOS.Requests.Deletion;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Provider
{
    public class DeleteProviderCommand:IRequest<ProviderResponse>
    {
        public DeleteProviderRequest DeleteProviderRequest { get; set; }
    }
}
