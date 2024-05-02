using AutoMapper;
using MultiRubroProducts.DbSet;
using MultiRubroProducts.DTOS.Requests;
using MultiRubroProducts.DTOS.Requests.Updating;

namespace MultiRubroProducts.Profiles
{
    public class RequestToDomain:Profile
    {
        public RequestToDomain()
        {
            CreateMap<CreateCategoryRequest,Category>()
                .ForMember(
                dest => dest.Description,
                opt => opt.MapFrom(src => src.Description))
                 .ForMember(
                dest => dest.Status,
                opt => opt.MapFrom(src => 1))
                .ForMember(
                dest => dest.AddedDate,
                opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForMember(
                dest => dest.UpdatedAt,
                opt => opt.MapFrom(src => DateTime.UtcNow));

            CreateMap<CreateProviderRequest,Provider>()
                .ForMember(
                dest => dest.Status,
                opt => opt.MapFrom(src => 1))
                 .ForMember(
                dest => dest.AddedDate,
                opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForMember(
                dest => dest.UpdatedAt,
                opt => opt.MapFrom(src => DateTime.UtcNow));
           
            CreateMap<CreateProductRequest,Product>()
                  .ForMember(
                dest => dest.Status,
                opt => opt.MapFrom(src => 1))
                .ForMember(
                dest => dest.AddedDate,
                opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForMember(
                dest => dest.UpdatedAt,
                opt => opt.MapFrom(src => DateTime.UtcNow));


            CreateMap<UpdateCategoryRequest,Category>()
                .ForMember(
                dest => dest.Description,
                opt => opt.MapFrom(src => src.Description))

                .ForMember(
                 dest => dest.UpdatedAt,
                 opt => opt.MapFrom(src => DateTime.UtcNow));

             CreateMap<UpdateProviderRequest,Provider>()
                 .ForMember(
               dest => dest.UpdatedAt,
               opt => opt.MapFrom(src => DateTime.UtcNow));

            CreateMap<UpdateProductRequest,Product>()
                .ForMember(
               dest => dest.UpdatedAt,
               opt => opt.MapFrom(src => DateTime.UtcNow));
          
            CreateMap<UpdateProductStock, Product>()
                .ForMember(
                dest => dest.Stock,
                opt => opt.MapFrom(src => src.Stock))
                 .ForMember(
               dest => dest.UpdatedAt,
               opt => opt.MapFrom(src => DateTime.UtcNow));

        }
    }
}
