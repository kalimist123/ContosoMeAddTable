using AutoMapper;
using ContosoUniversity.Models;

namespace ContosoUniversity.Features.SchoolBooks
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<SchoolBook, Index.Model>();
            CreateMap<SchoolBook, Details.Model>();
            CreateMap<Create.Command, SchoolBook>(MemberList.Source);
            CreateMap<SchoolBook, Edit.Command>().ReverseMap();
            CreateMap<SchoolBook, Delete.Command>();
        }
    }
}