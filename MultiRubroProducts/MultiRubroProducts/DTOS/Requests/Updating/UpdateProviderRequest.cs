namespace MultiRubroProducts.DTOS.Requests.Updating
{
    public class UpdateProviderRequest
    {
        public Guid ProviderId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string Cellphone { get; set; } = string.Empty;
    }
}
