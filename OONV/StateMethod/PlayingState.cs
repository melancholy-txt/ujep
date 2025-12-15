class PlayingState : State
{
    private Spooptify _spooptify;

    public PlayingState(Spooptify spooptify)
    {
        _spooptify = spooptify;
    }
    public void ClickPlay()
    {
        Console.WriteLine("Device is playing, not doing shit lol.");
    }

    public void ClickPause()
    {
        Console.WriteLine("Device is playing, pausing now.");
        _spooptify.SetState(new StoppedState(_spooptify));
    }

    public void ClickNext()
    {
        Console.WriteLine("Device is playing, going to next track.");
    }

    public void ClickPrev()
    {
        Console.WriteLine("Device is playing, going to previous track.");
    }

    public void VolumeUp()
    {
        Console.WriteLine("Device is playing, increasing volume.");
    }

    public void VolumeDown()
    {
        Console.WriteLine("Device is playing, decreasing volume.");
    }
}