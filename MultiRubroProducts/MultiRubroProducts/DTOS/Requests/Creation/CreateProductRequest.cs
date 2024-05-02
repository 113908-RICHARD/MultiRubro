namespace MultiRubroProducts.DTOS.Requests
{
    public class CreateProductRequest
    {
        public string Description { get; set; } = string.Empty;
        public Double Price { get; set; }
        public int Stock { get; set; }
        public Guid ProviderId { get; set; }
        public Guid CategoryId { get; set; }
    }
}
