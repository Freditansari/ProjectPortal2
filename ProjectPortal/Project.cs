//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectPortal
{
    using System;
    using System.Collections.Generic;
    
    public partial class Project
    {
        public Project()
        {
            this.Tasks = new HashSet<Task>();
        }
    
        public int ProjectID { get; set; }
        public string Department { get; set; }
        public string ProjectName { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public Nullable<bool> isCompleted { get; set; }
        public string UserID { get; set; }
    
        public virtual Department Department1 { get; set; }
        public virtual ICollection<Task> Tasks { get; set; }
    }
}
