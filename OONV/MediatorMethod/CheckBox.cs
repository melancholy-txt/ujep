class CheckBox   : Component 
{
    public CheckBox (IMediator mediator) : base(mediator)
    {
    }

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

    public void SetChecked(bool isChecked)
    {
        string status = isChecked ? "checked" : "unchecked";
        dialog.Notify(this, $"CheckBox is {status}");
    }
}