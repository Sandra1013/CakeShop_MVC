//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    using System.ComponentModel;

    public partial class tProd
    {
        public int Id { get; set; }
        [DisplayName("商品名稱")]
        public string pName { get; set; }
        [DisplayName("商品成份")]
        public string pComp { get; set; }
        [DisplayName("商品價格")]
        public Nullable<int> pPrice { get; set; }
        [DisplayName("商品圖片")]
        public string pImage { get; set; }
        [DisplayName("銷售數量")]
        public Nullable<int> pSale { get; set; }
    }
}
