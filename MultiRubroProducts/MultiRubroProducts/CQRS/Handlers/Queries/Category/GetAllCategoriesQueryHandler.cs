using AutoMapper;
using MediatR;
using MultiRubroProducts.CQRS.Queries.Category;
using MultiRubroProducts.DTOS.Responses;
using MultiRubroProducts.Repositories.Interfaces;
using System.Data.Entity.Infrastructure;

namespace MultiRubroProducts.CQRS.Handlers.Queries.Category
{
    public class GetAllCategoriesQueryHandler : IRequestHandler<GetAllCategoriesQuery, IEnumerable<CategoryResponse>>
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public GetAllCategoriesQueryHandler(IMapper mapper, IUnitOfWork unitOfWork)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;

        }

        public async Task<IEnumerable<CategoryResponse>> Handle(GetAllCategoriesQuery request, CancellationToken cancellationToken)
        {
            var result = await _unitOfWork.Categories.All();
            if (result == null) {

                throw null;
                
            }
            else
            {
                return _mapper.Map<IEnumerable<CategoryResponse>>(result);

            }
        }
    }
}
