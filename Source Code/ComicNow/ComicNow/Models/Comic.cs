//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ComicNow.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comic
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Comic()
        {
            this.Chapters = new HashSet<Chapter>();
            this.Comments = new HashSet<Comment>();
            this.Pages = new HashSet<Page>();
            this.RatingLists = new HashSet<RatingList>();
            this.Authors = new HashSet<Author>();
            this.Accounts = new HashSet<Account>();
            this.Tags = new HashSet<Tag>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string OtherName { get; set; }
        public string Description { get; set; }
        public int PublisherId { get; set; }
        public int ChapterNumber { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime LastUpdate { get; set; }
        public bool Status { get; set; }
        public double Rating { get; set; }
        public int TimeRated { get; set; }
        public int Views { get; set; }
        public bool IsActive { get; set; }
        public string ThumbnailUrl { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chapter> Chapters { get; set; }
        public virtual Publisher Publisher { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Page> Pages { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RatingList> RatingLists { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Author> Authors { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Account> Accounts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tag> Tags { get; set; }
    }
}
