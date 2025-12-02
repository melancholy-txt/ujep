interface IMediator
{
    void Notify(Component sender, string eventMessage);
}