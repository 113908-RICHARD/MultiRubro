namespace MultiRubroProducts.DTOS.Requests.Updating
{
    public class UpdateProductStock
    {
        public Guid ProductId { get; set; }
        public int Stock { get; set; }
    }
}
