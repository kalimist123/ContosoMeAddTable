using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper.QueryableExtensions;
using ContosoUniversity.Data;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace ContosoUniversity.Features.SchoolBooks
{
    public class Delete
    {
        public class Query : IRequest<Command>
        {
            public int Id { get; set; }
        }

        public class Command : IRequest
        {
            public string Name { get; set; }

            public decimal Price { get; set; }

           

            public int Id { get; set; }

            
            public string Author { get; set; }

            public byte[] RowVersion { get; set; }
        }

        public class QueryHandler : IAsyncRequestHandler<Query, Command>
        {
            private readonly SchoolContext _db;

            public QueryHandler(SchoolContext db) => _db = db;

            public async Task<Command> Handle(Query message) => await _db
                .SchoolBooks
                .Where(d => d.Id == message.Id)
                .ProjectTo<Command>()
                .SingleOrDefaultAsync();
        }

        public class CommandHandler : IAsyncRequestHandler<Command>
        {
            private readonly SchoolContext _db;

            public CommandHandler(SchoolContext db) => _db = db;

            public async Task Handle(Command message)
            {
                var SchoolBook = await _db.SchoolBooks.FindAsync(message.Id);

                _db.SchoolBooks.Remove(SchoolBook);
            }
        }
    }
}
