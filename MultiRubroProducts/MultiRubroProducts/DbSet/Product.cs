namespace MultiRubroProducts.DbSet
{
    public class Product:BaseEntity
    {
      

        
        public string Description { get; set; } = string.Empty;
        public Double Price { get; set; }
        public int Stock { get; set; }
        public Guid ProviderId { get; set; }
        public Guid CategoryId { get; set; }
        
        public virtual Provider? Provider { get; set; }
        public virtual Category? Category { get; set; }
    }
}
