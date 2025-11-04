using System.Security.Cryptography;
using System.Text.Json;

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
        if (string.IsNullOrWhiteSpace(message))
        {
            Console.Error.WriteLine("Empty message received - nothing to send.");
            return;
        }

        try
        {
            var emailData = JsonSerializer.Deserialize<Dictionary<string, string>>(message);
            if (emailData == null
                || !emailData.TryGetValue("from", out var from)
                || !emailData.TryGetValue("to", out var to)
                || !emailData.TryGetValue("body", out var body))
            {
                Console.Error.WriteLine("Invalid email data: missing required fields (from/to/body).");
                return;
            }

            _emailService.SendEmail(from, to, body);
        }
        catch (JsonException ex)
        {
            Console.Error.WriteLine($"Failed to parse message as JSON: {ex.Message}");
        }
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
        var jsonMessage = "{ \"from\": \"tonda@tonda.com\", \"to\": \"netonda@netonda.com\", \"subject\": \"Test Email\", \"body\": \"Hello, this is a test email  !\" }";
        LegacyEmail legacyEmail = new LegacyEmail();
        INotifier emailNotifier = new EmailNotifier(legacyEmail);
        emailNotifier.Send(jsonMessage);
    }
}
