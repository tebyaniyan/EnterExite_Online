﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EnterExite_Online.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EnterAndExiteOnlineEntities : DbContext
    {
        public EnterAndExiteOnlineEntities()
            : base("name=EnterAndExiteOnlineEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<EnterExiteLog> EnterExiteLogs { get; set; }
        public virtual DbSet<EnterExite> EnterExites { get; set; }
        public virtual DbSet<Person> Persons { get; set; }
    }
}
