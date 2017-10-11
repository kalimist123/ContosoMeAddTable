using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
using AutoMapper.QueryableExtensions;
using ContosoUniversity.Data;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace ContosoUniversity.Features.SchoolBooks
{
    public class Index
    {
        public class Query : IRequest<List<Model>>
        {
        }

        public class Model
        {
            public string Name { get; set; }

            public decimal Price { get; set; }

           public string Author { get; set; }

            public int Id { get; set; }

           
        }

        public class QueryHandler : IAsyncRequestHandler<Query, List<Model>>
        {
            private readonly SchoolContext _context;

            public QueryHandler(SchoolContext context) => _context = context;

            public async Task<List<Model>> Handle(Query message)
            {
                var projectTo = _context.SchoolBooks
                    .ProjectTo<Model>();
                return await projectTo.ToListAsync();
            }
        }
    }
}