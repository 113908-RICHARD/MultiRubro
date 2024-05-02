using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MultiRubroProducts.DbSet;
using MultiRubroProducts.DTOS.Responses;

namespace MultiRubroProducts.Profiles
{
    public class DomainToResponse:Profile
    {
        public DomainToResponse()
        {
            CreateMap<Category, CategoryResponse>()
                .ForMember(
                dest => dest.Description,
                opt => opt.MapFrom(src => src.Description));

            CreateMap<Provider, ProviderResponse>();

            CreateMap<Product, ProductResponse>();
        }
    }
}
