interface IHandler
{
    void SetNext(IHandler handler); 
    Task Handle(string request);
}