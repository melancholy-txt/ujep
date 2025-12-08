class TextBox : Component 
{
    private bool isEnabled = true;

    public TextBox(IMediator mediator) : base(mediator)
    {
    }

    public void Enable() => isEnabled = true;
    public void Disable() => isEnabled = false;

    public override void Click(string eventMessage, string button = "left")
    {
        dialog.Notify(this, eventMessage);
    }

    public override void KeyPress(string eventMessage, string key)
    {
        if (key == "Enter")
        {
            dialog.Notify(this, eventMessage);
        }
    }
}