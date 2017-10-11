using System;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
using AutoMapper.QueryableExtensions;
using ContosoUniversity.Data;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace ContosoUniversity.Features.SchoolBooks
{
    public class Details
    {
        public class Query : IRequest<Model>
        {
            public int Id { get; set; }
        }

        public class Model
        {
            public string Name { get; set; }

            public decimal Price { get; set; }

            public int Id { get; set; }

            
            public string Author { get; set; }

        }

        public class QueryHandler : IAsyncRequestHandler<Query, Model>
        {
            private readonly SchoolContext _context;

            public QueryHandler(SchoolContext context) => _context = context;

            public Task<Model> Handle(Query message) => _context.SchoolBooks
                .FromSql(@"SELECT * FROM SchoolBook WHERE SchoolBookID = {0}", message.Id)
                .ProjectTo<Model>()
                .SingleOrDefaultAsync();
        }
    }
}