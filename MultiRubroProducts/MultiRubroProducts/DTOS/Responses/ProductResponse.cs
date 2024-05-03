namespace MultiRubroProducts.DTOS.Responses
{
    public class ProductResponse
    {
        public Guid ProductId { get; set; }
        public string Description { get; set; } = string.Empty;
        public Double Price { get; set; }
        public int Stock { get; set; }
       
    }
}
