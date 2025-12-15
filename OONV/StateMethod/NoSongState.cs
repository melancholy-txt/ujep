class NoSongState : State
{
    private Spooptify _spooptify;
    public NoSongState(Spooptify spooptify)
    {
        _spooptify = spooptify;
    }
    public void ClickPlay()
    {
        Console.WriteLine("Device has no song, playing last played song...");
        _spooptify.SetState(new PlayingState(_spooptify));
    }

    public void ClickPause()
    {
        Console.WriteLine("Device has no song, cannot pause.");
    }

    public void ClickNext()
    {
        Console.WriteLine("Device has no song, cannot go to next track.");
    }

    public void ClickPrev()
    {
        Console.WriteLine("Device has no song, cannot go to previous track.");
    }

    public void VolumeUp()
    {
        Console.WriteLine("Device has no song, increasing volume anyways.");
    }

    public void VolumeDown()
    {
        Console.WriteLine("Device has no song, decreasing volume anyways.");
    }
}