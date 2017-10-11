﻿using System;
using System.Threading.Tasks;
using ContosoUniversity.Data;
using Microsoft.AspNetCore.Mvc.Filters;

namespace ContosoUniversity.Infrastructure
{
    public class DbContextTransactionFilter : IAsyncActionFilter
    {
        private readonly SchoolContext _dbContext;

        public DbContextTransactionFilter(SchoolContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            try
            {
                await _dbContext.BeginTransactionAsync();

                await next();

                await _dbContext.CommitTransactionAsync();
            }
            catch (Exception)
            {
                _dbContext.RollbackTransaction();
                throw;
            }
        }
    }
}