class StoppedState : State
{
    private Spooptify _spooptify;

    public StoppedState(Spooptify spooptify)
    {
        _spooptify = spooptify;
    }

    public void ClickPlay()
    {
        Console.WriteLine("Device is stopped, starting playback.");
        _spooptify.SetState(new PlayingState(_spooptify));
    }

    public void ClickPause()
    {
        Console.WriteLine("Device is stopped, cannot pause.");
    }

    public void ClickNext()
    {
        Console.WriteLine("Device is stopped, going to next track.");
    }

    public void ClickPrev()
    {
        Console.WriteLine("Device is stopped, going to previous track.");
    }

    public void VolumeUp()
    {
        Console.WriteLine("Device is stopped, increasing volume.");
    }

    public void VolumeDown()
    {
        Console.WriteLine("Device is stopped, decreasing volume.");
    }
}