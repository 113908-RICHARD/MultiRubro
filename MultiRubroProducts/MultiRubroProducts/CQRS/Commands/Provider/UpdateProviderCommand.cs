using MediatR;
using MultiRubroProducts.DTOS.Requests.Updating;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.CQRS.Commands.Provider
{
    public class UpdateProviderCommand:IRequest<ProviderResponse>
    {
        public UpdateProviderRequest UpdateProviderRequest { get; set; }
    }
}
