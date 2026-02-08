class DocumentHandler : IHandler
{
    private IHandler _nextHandler;
    public void SetNext(IHandler handler)
    {
        this._nextHandler = handler;
    }
    public async Task Handle(string request)
    {
        System.Console.WriteLine("DocumentHandler zpracovava request: " + request);
    }
}