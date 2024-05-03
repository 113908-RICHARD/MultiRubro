using MediatR;
using MultiRubroProducts.DTOS.Requests;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Provider
{
    public class CreateProviderCommand:IRequest<ProviderResponse>
    {
        public CreateProviderRequest CreateProviderRequest { get; set; }
    }
}
