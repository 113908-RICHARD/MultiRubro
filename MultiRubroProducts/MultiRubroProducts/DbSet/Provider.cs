namespace MultiRubroProducts.DbSet
{
    public class Provider:BaseEntity
    {
        public Provider()
        {
            Products = new HashSet<Product>();
        }

        public string Name { get; set; } = string.Empty;
        public string Address { get;set; }= string.Empty;
        public string Cellphone { get; set; } = string.Empty;
        public virtual ICollection<Product> Products { get; set;}
    }
}
