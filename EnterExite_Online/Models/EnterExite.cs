//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class EnterExite
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EnterExite()
        {
            this.EnterExiteLogs = new HashSet<EnterExiteLog>();
        }
    
        public int EnterExiteID { get; set; }
        public int PersonID { get; set; }
        public System.DateTime Date { get; set; }
        public bool Present { get; set; }
        public bool EnterExiteType { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnterExiteLog> EnterExiteLogs { get; set; }
        public virtual Person Person { get; set; }
    }
}
