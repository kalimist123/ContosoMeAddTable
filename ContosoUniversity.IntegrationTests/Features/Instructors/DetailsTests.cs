﻿namespace ContosoUniversity.IntegrationTests.Features.Instructors
{
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using ContosoUniversity.Features.Instructors;
    using Models;
    using Shouldly;
    using Xunit;
    using static SliceFixture;

    public class DetailsTests : IntegrationTestBase
    {
        [Fact]
        public async Task Should_get_instructor_details()
        {
            var englishDept = new Department
            {
                Name = "English",
                StartDate = DateTime.Today
            };
            var english101 = new Course
            {
                Department = englishDept,
                Title = "English 101",
                Credits = 4,
                Id = 123
            };
            await InsertAsync(englishDept, english101);

            var command = new CreateEdit.Command
            {
                FirstMidName = "George",
                LastName = "Costanza",
                OfficeAssignmentLocation = "Austin",
                HireDate = DateTime.Today,
                SelectedCourses = new[] { english101.Id.ToString() }
            };
            var instructorId = await SendAsync(command);

            var result = await SendAsync(new Details.Query { Id = instructorId });

            result.ShouldNotBeNull();
            result.FirstMidName.ShouldBe(command.FirstMidName);
            result.OfficeAssignmentLocation.ShouldBe(command.OfficeAssignmentLocation);
        }
    }
}