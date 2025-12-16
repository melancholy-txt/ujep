class RouteHandler : IHandler
{
    private IHandler _nextHandler;
    private IHandler _webScraper;
    private IHandler _documentScraper;
    private IHandler _chatScraper;
    public RouteHandler()
    {
        this._webScraper = new WebHandler();
        this._documentScraper = new DocumentHandler();
        this._chatScraper = new ChatHandler();
    }
    public void SetNext(IHandler handler)
    {
        this._nextHandler = handler;
    }
    public async Task Handle(string request)
    {
        switch (request)
        {
            case var req when req.Contains("google") || req.Contains("web"):
                await _webScraper.Handle(request);
                break;
            case var req when req.EndsWith(".docx") || req.EndsWith(".pdf") || req.EndsWith(".txt"):
                await _documentScraper.Handle(request);
                break;
            case var req when req.Contains("chat"):
                await _chatScraper.Handle(request);
                break;
            default:
                if (_nextHandler != null)
                {
                    await _nextHandler.Handle(request);
                }
                else
                {
                    System.Console.WriteLine("Nemame handlera pro tenhle request :( \n" + request);
                }
                break;
        }
    }
}
