class AuthDialog : IMediator
{
    private string title;
    private CheckBox checkboxChecked;
    private TextBox username;
    private TextBox password;
    private Button confirmButton;

    public AuthDialog(string title)
    {
        this.title = title;
        this.checkboxChecked = new CheckBox(this);
        this.username = new TextBox(this);
        this.password = new TextBox(this);
        this.confirmButton = new Button(this);
    }

    public void Notify(Component sender, string eventMessage)
    {
        if (eventMessage == "CheckBoxChecked")
        {
            username.Enable();
            password.Enable();
            confirmButton.Enable();
        }
        else if (eventMessage == "CheckBoxUnchecked")
        {
            username.Disable();
            password.Disable();
            confirmButton.Disable();
        }
        else if (eventMessage == "ConfirmButtonClicked")
        {
            Console.WriteLine("Authenticating user...");
        }
    }
    
}