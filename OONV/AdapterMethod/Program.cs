using System.Security.Cryptography;

namespace AdapterMethod;

interface INotifier
{
    void Send(string message);
}

class EmailNotifier : INotifier
{
    private readonly LegacyEmail _emailService;

    public EmailNotifier(LegacyEmail emailService)
    {
        _emailService = emailService;
    }

    public void Send(string message)
    {
        _emailService.SendEmail("from@example.com", "to@example.com", message);
    }
}

class LegacyEmail
{
    public void SendEmail(string from, string to, string message)
    {
        Console.WriteLine($"Email sent from: {from}, to: {to}, with message: {message}");
    }
}

class Program
{
    static void Main(string[] args)
    {
        LegacyEmail legacyEmail = new LegacyEmail();
        INotifier emailNotifier = new EmailNotifier(legacyEmail);
        emailNotifier.Send("Hello, this is a test email!");
    }
}
