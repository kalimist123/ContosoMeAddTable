﻿namespace ContosoUniversity.IntegrationTests.Features.Courses
{
    using System;
    using System.Threading.Tasks;
    using ContosoUniversity.Features.Courses;
    using Models;
    using Shouldly;
    using Xunit;
    using static SliceFixture;

    public class IndexTests : IntegrationTestBase
    {
        [Fact]
        public async Task Should_return_all_courses()
        {
            var adminId = await SendAsync(new ContosoUniversity.Features.Instructors.CreateEdit.Command
            {
                FirstMidName = "George",
                LastName = "Costanza",
                HireDate = DateTime.Today,
            });

            var englishDept = new Department
            {
                Name = "English",
                InstructorID = adminId,
                Budget = 123m,
                StartDate = DateTime.Today
            };
            var historyDept = new Department
            {
                Name = "History",
                InstructorID = adminId,
                Budget = 123m,
                StartDate = DateTime.Today
            };

            var english = new Course
            {
                Credits = 4,
                Department = englishDept,
                Id = 1235,
                Title = "English 101"
            };
            var history = new Course
            {
                Credits = 4,
                Department = historyDept,
                Id = 4312,
                Title = "History 101"
            };
            await InsertAsync(englishDept, historyDept, english, history);

            var result = await SendAsync(new Index.Query());

            result.ShouldNotBeNull();
            result.Courses.Count.ShouldBe(2);
        }
    }
}