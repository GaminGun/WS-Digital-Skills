//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp1
{
    using System;
    using System.Collections.Generic;
    
    public partial class ActivityUsers
    {
        public int ID { get; set; }
        public int IDUser { get; set; }
        public System.DateTime Date { get; set; }
        public System.TimeSpan LoginTime { get; set; }
        public Nullable<System.TimeSpan> LogoutTime { get; set; }
        public Nullable<System.TimeSpan> TimeSpent { get; set; }
        public string TypeError { get; set; }
        public Nullable<System.TimeSpan> AllTimeSpent { get; set; }
    
        public virtual Users Users { get; set; }
    }
}
