class LockedState : State
{
    private Spooptify _spooptify;

    public LockedState(Spooptify spooptify)
    {
        _spooptify = spooptify;
    }
    public void ClickPlay()
    {
        Console.WriteLine("Device is locked. Unlock to play.");
    }

    public void ClickPause()
    {
        Console.WriteLine("Device is locked. Unlock to pause.");
    }

    public void ClickNext()
    {
        Console.WriteLine("Device is locked. Unlock to go to next track.");
    }

    public void ClickPrev()
    {
        Console.WriteLine("Device is locked. Unlock to go to previous track.");
    }

    public void VolumeUp()
    {
        Console.WriteLine("Device is locked. Unlock to adjust volume.");
    }

    public void VolumeDown()
    {
        Console.WriteLine("Device is locked. Unlock to adjust volume.");
    }
}