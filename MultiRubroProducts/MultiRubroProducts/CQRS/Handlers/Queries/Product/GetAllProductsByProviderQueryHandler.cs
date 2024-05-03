using AutoMapper;
using MediatR;
using MultiRubroProducts.CQRS.Queries.Product;
using MultiRubroProducts.DTOS.Responses;
using MultiRubroProducts.Repositories.Interfaces;

namespace MultiRubroProducts.CQRS.Handlers.Queries.Product
{
    public class GetAllProductsByProviderQueryHandler : IRequestHandler<GetAllProductsFromProviderQuery, IEnumerable<ProductResponse>>
    {

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public GetAllProductsByProviderQueryHandler()
        {
            
        }

        public Task<IEnumerable<ProductResponse>> Handle(GetAllProductsFromProviderQuery request, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
