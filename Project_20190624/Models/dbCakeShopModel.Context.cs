﻿//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Project_20190624.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dbCakeShopEntities : DbContext
    {
        public dbCakeShopEntities()
            : base("name=dbCakeShopEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tComment> tComments { get; set; }
        public virtual DbSet<tIG> tIGs { get; set; }
        public virtual DbSet<tMember> tMembers { get; set; }
        public virtual DbSet<tOrderDetail> tOrderDetails { get; set; }
        public virtual DbSet<tProd> tProds { get; set; }
    }
}
