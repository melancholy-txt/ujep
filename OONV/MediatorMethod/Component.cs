abstract class Component
{
    protected IMediator dialog;

    public Component(IMediator mediator)
    {
        this.dialog = mediator;
    }

    public abstract void Click(string eventMessage, string button = "left");

    public abstract void KeyPress(string eventMessage, string key);
}