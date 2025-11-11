using Microsoft.VisualBasic;

namespace CompositeMethod;

public abstract class Communicator
{
    public abstract void Send(string message);
}

public class EmailCommunicator : Communicator
{
    public override void Send(string message)
    {
        Console.WriteLine($"Sending Email: {message}");
    }
}

public class SmsCommunicator : Communicator
{
    public override void Send(string message)
    {
        Console.WriteLine($"Sending SMS: {message}");
    }
}

public class DiscordCommunicator : Communicator
{
    public override void Send(string message)
    {
        Console.WriteLine($"Sending Discord Message: {message}");
    }
}

public class TeamsCommunicator : Communicator
{
    public override void Send(string message)
    {
        Console.WriteLine($"Sending Teams Message: {message}");
    }
}

public class CompositeCommunicator : Communicator
{
    private List<Communicator> communicators = new List<Communicator>();

    public void AddCommunicator(Communicator communicator)
    {
        communicators.Add(communicator);
    }

    public override void Send(string message)
    {
        foreach (Communicator communicator in communicators)
        {
            communicator.Send(message);
        }
    }
}

class Program
{
    static void Main(string[] args)
    {
        CompositeCommunicator compositeCommunicator = new CompositeCommunicator();
        CompositeCommunicator compositeCommunicator2 = new CompositeCommunicator();
        CompositeCommunicator compositeCommunicator3 = new CompositeCommunicator();

        compositeCommunicator.AddCommunicator(compositeCommunicator2);
        compositeCommunicator.AddCommunicator(compositeCommunicator3);

        compositeCommunicator2.AddCommunicator(new EmailCommunicator());
        compositeCommunicator2.AddCommunicator(new SmsCommunicator());
        compositeCommunicator3.AddCommunicator(new DiscordCommunicator());
        compositeCommunicator3.AddCommunicator(new TeamsCommunicator());

        compositeCommunicator.Send("čau more");
    }
}
