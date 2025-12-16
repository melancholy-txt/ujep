class ChatHandler : IHandler
{
    private static HttpClient sharedClient = new()
    {
        BaseAddress = new Uri("https://openrouter.ai/api/v1/chat/completions"),
    };
    public void SetNext(IHandler handler)
    {
        // No next handler for ChatHandler
    }
    public async Task Handle(string request)
    {
        System.Console.WriteLine("ChatHandler zpracovava request: " + request);
        
        try
        {
            var requestBody = new
            {
                model = "tngtech/deepseek-r1t2-chimera:free",
                messages = new[]
                {
                    new { role = "user", content = request }
                }
                
            };
            
            var jsonContent = System.Text.Json.JsonSerializer.Serialize(requestBody);
            var content = new StringContent(jsonContent, System.Text.Encoding.UTF8, "application/json");
            
            sharedClient.DefaultRequestHeaders.Clear();
            sharedClient.DefaultRequestHeaders.Add("Authorization", "Bearer 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");
            
            HttpResponseMessage response = await sharedClient.PostAsync("", content);
            response.EnsureSuccessStatusCode();
            
            string responseBody = await response.Content.ReadAsStringAsync();
            System.Console.WriteLine("Chatko API Response:");
            System.Console.WriteLine(responseBody);
        }
        catch (HttpRequestException e)
        {
            System.Console.WriteLine("Error calling Chatko API:");
            System.Console.WriteLine(e.Message);
        }
    }
}   