using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System.IO;

namespace TracktionApp.Models
{
    public class TracktionContextFactory : IDesignTimeDbContextFactory<TracktionContext>
    {
        public TracktionContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<TracktionContext>();

            // Load config from appsettings.json
            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            var connectionString = configuration.GetConnectionString("TracktionDB");

            optionsBuilder.UseSqlServer(connectionString);

            return new TracktionContext(optionsBuilder.Options);
        }
    }
}