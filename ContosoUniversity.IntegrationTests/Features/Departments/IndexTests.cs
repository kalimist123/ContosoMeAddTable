﻿namespace ContosoUniversity.IntegrationTests.Features.Departments
{
    using System;
    using System.Threading.Tasks;
    using ContosoUniversity.Features.Departments;
    using Models;
    using Shouldly;
    using Xunit;
    using static SliceFixture;

    public class IndexTests : IntegrationTestBase
    {
        [Fact]
        public async Task Should_list_departments()
        {
            var adminId = await SendAsync(new ContosoUniversity.Features.Instructors.CreateEdit.Command
            {
                FirstMidName = "George",
                LastName = "Costanza",
                HireDate = DateTime.Today,
            });

            var dept = new Department
            {
                Name = "History",
                InstructorID = adminId,
                Budget = 123m,
                StartDate = DateTime.Today
            };
            var dept2 = new Department
            {
                Name = "English",
                InstructorID = adminId,
                Budget = 456m,
                StartDate = DateTime.Today
            };

            await InsertAsync(dept, dept2);

            var query = new Index.Query();

            var result = await SendAsync(query);

            result.ShouldNotBeNull();
            result.Count.ShouldBe(2);
        }

    }
}