namespace MultiRubroProducts.DTOS.Requests.Updating
{
    public class UpdateProductRequest
    {
        public Guid ProductId { get; set; }
        public string Description { get; set; } = string.Empty;
        public Double Price { get; set; }
        
        public Guid ProviderId { get; set; }
        public Guid CategoryId { get; set; }
    }
}
