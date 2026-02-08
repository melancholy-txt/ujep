class WebHandler : IHandler
{
    private IHandler _nextHandler;

    private static HttpClient sharedClient = new()
    {
        BaseAddress = new Uri("https://api.langsearch.com/v1/web-search"),
    };
    public void SetNext(IHandler handler)
    {
        this._nextHandler = handler;
    }
    public async Task Handle(string request)
    {
        System.Console.WriteLine("WebHandler zpracovava request: " + request);
        
        try
        {
            var requestBody = new
            {
                query = request,
                max_results = 1
            };
            
            var jsonContent = System.Text.Json.JsonSerializer.Serialize(requestBody);
            var content = new StringContent(jsonContent, System.Text.Encoding.UTF8, "application/json");
            
            sharedClient.DefaultRequestHeaders.Clear();
            sharedClient.DefaultRequestHeaders.Add("Authorization", "Bearer sk-a3bdb41bc02b4dc99dd56263e747ee34");
            
            HttpResponseMessage response = await sharedClient.PostAsync("", content);
            response.EnsureSuccessStatusCode();
            
            string responseBody = await response.Content.ReadAsStringAsync();
            System.Console.WriteLine("LangSearch API Response:");
            System.Console.WriteLine(responseBody);
        }
        catch (HttpRequestException e)
        {
            System.Console.WriteLine("Error calling LangSearch API:");
            System.Console.WriteLine(e.Message);
        }
    }
}