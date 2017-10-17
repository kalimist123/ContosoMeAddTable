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
using Microsoft.Extensions.Logging;

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
            private readonly IMediator _mediator;

            //public CommandHandler(SchoolContext context) => _context = context;


            public CommandHandler(SchoolContext context, IMediator mediator)
            {
                _context = context;
                _mediator = mediator;

            }

            public void Handle(SchoolBooks.Create.Command message)
            {
                var schoolBook = Mapper.Map<SchoolBooks.Create.Command, SchoolBook>(message);

                _context.SchoolBooks.Add(schoolBook);
                _mediator.Publish(new SchoolBookAdded(schoolBook.Id));
            }
        }



        public class SchoolBookAdded : INotification
        {
            public int SchoolBookId { get; }

            public SchoolBookAdded(int schoolBookId)
            {
                SchoolBookId = schoolBookId;
            }
        }


        public class SchoolBookAddedHandler : INotificationHandler<SchoolBookAdded>
        {
            private readonly ILogger<SchoolBooks.Create.Command> _logger;

            public SchoolBookAddedHandler(ILogger<SchoolBooks.Create.Command> logger)
            {
                _logger = logger;
            }

            public void Handle(SchoolBookAdded notification)
            {
                _logger.LogInformation("schoolBook {SchoolBookId} was added.", notification.SchoolBookId);
            }
        }
    }
}
