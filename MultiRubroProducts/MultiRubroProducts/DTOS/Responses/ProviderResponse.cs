namespace MultiRubroProducts.DTOS.Responses
{
    public class ProviderResponse
    {
        public Guid ProviderId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string Cellphone { get; set; } = string.Empty;
    }
}
