using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Net.Http.Headers;

namespace TracktionApp.Models
{
    public class User
    {
        [Key]
        [Required]
        [StringLength(50)]
        [Display(Name = "Username")]
        [Column("username")]
        public required string strUsername { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Last Name")]
        [Column("last")]
        public required string strLast { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "First Name")]
        [Column("first")]
        public required string strFirst { get; set; }

        [Required]
        [StringLength(100)]
        [EmailAddress]
        [Display(Name = "Email Address")]
        [Column("email")]
        public required string strEmail { get; set; }

        [StringLength(20)]
        [Phone]
        [Display(Name = "Phone Number")]
        [Column("phone")]
        public string? strPhone { get; set; }

        [StringLength(50)]
        [Display(Name = "User Role")]
        [Column("role")]
        public string? strRole { get; set; }
    }
}
