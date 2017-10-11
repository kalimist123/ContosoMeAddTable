using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using ContosoUniversity.Data;
using ContosoUniversity.Models;
using MediatR;

namespace ContosoUniversity.Features.SchoolBooks
{
    public class Create
    {
        public class Command : IRequest
        {
            public string Name { get; set; }

           
            public string Author { get; set; }

            [DataType(DataType.Currency)]
            [Column(TypeName = "money")]
            public decimal? Price { get; set; }
        }


        public class CommandHandler : IRequestHandler<SchoolBooks.Create.Command>
        {
            private readonly SchoolContext _context;

            public CommandHandler(SchoolContext context) => _context = context;

            public void Handle(SchoolBooks.Create.Command message)
            {
                var schoolBook = Mapper.Map<SchoolBooks.Create.Command, SchoolBook>(message);

                _context.SchoolBooks.Add(schoolBook);
            }
        }
    }
}
