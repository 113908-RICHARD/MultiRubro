namespace MultiRubroProducts.DTOS.Requests.Updating
{
    public class UpdateCategoryRequest
    {
        public Guid CategoryId { get; set; }
        public string Description { get; set; }
    }
}
