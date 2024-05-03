using AutoMapper;
using MediatR;
using MultiRubroProducts.CQRS.Commands.Category;



using MultiRubroProducts.CQRS.Queries.Category;
using MultiRubroProducts.DTOS.Responses;
using MultiRubroProducts.Repositories.Interfaces;

namespace MultiRubroProducts.CQRS.Handlers.Queries.Category
{
    public class GetCategoryByIdQueryHandler : IRequestHandler<GetCategoryByIdQuery, CategoryResponse>
    {

        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public GetCategoryByIdQueryHandler(IMapper mapper, IUnitOfWork unitOfWork)
        {
            _mapper = mapper;   
            _unitOfWork = unitOfWork;
            
        }

        public async Task<CategoryResponse> Handle(GetCategoryByIdQuery request, CancellationToken cancellationToken)
        {
            var result = await _unitOfWork.Categories.GetById(request.Id);
            if (result == null)
            {
                return null;
            }
            else
            {
                return _mapper.Map<CategoryResponse>(result);

            }
        }
    }
}
