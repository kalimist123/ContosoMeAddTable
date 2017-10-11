namespace ContosoUniversity.IntegrationTests.Features.SchoolBooks
{
    using System;
    using Microsoft.EntityFrameworkCore;
    using System.Linq;
    using System.Threading.Tasks;
    using ContosoUniversity.Features.SchoolBooks;
    using Models;
    using Shouldly;
    using Xunit;
    using static SliceFixture;

    public class CreateTests : IntegrationTestBase
    {
        [Fact]
        public async Task Should_create_new_schoolbook()
        {
            

            Create.Command command = null;

            await ExecuteDbContextAsync(async (db, mediator) =>
            {
                

                command = new Create.Command
                {
                    Author ="JohnnyOnion",
                    Name = "Engineering 5",
                    Price=5
                };

                await mediator.Send(command);
            });

            var created = await ExecuteDbContextAsync(db => db.SchoolBooks.Where(d => d.Name == command.Name).SingleOrDefaultAsync());

            created.ShouldNotBeNull();
            created.Author.ShouldBe(command.Author);
            created.Name.ShouldBe(command.Name);
            created.Price.ShouldBe(command.Price.GetValueOrDefault());
        }
    }
}