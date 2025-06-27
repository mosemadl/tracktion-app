using Microsoft.EntityFrameworkCore;

namespace TracktionApp.Models
{
    public class TracktionContext : DbContext
    {
        public TracktionContext(DbContextOptions<TracktionContext> options)
            : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
    }
}
