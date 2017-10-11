using System;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using ContosoUniversity.Data;
using ContosoUniversity.Models;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace ContosoUniversity.Features.SchoolBooks
{
    public class Edit
    {
        public class Query : IRequest<Command>
        {
            public int Id { get; set; }
        }

        public class Command : IRequest
        {
            public string Name { get; set; }

            public decimal Price { get; set; }

            public string Author { get; set; }

            public int Id { get; set; }
            public byte[] RowVersion { get; set; }
        }

        public class Validator : AbstractValidator<Command>
        {
            public Validator()
            {
                RuleFor(m => m.Name).NotNull().Length(3, 50);
                RuleFor(m => m.Author).NotNull();
                RuleFor(m => m.Price).NotNull();
    
            }
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
                var schoolBook = await _db.SchoolBooks.FindAsync(message.Id);
               
                Mapper.Map(message, schoolBook);
            }
        }
    }
}
