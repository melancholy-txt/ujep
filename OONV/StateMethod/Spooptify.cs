class Spooptify
{
    private State _state;

    public Spooptify()
    {
        _state = new NoSongState(this);
    }

    public void SetState(State state)
    {
        Console.WriteLine($"Transitioning from {_state.GetType().Name} to {state.GetType().Name}.");
        _state = state;
    }

    public void ClickPlay()
    {
        _state.ClickPlay();
    }
    public void ClickPause()
    {
        _state.ClickPause();
    }
    public void ClickNext()
    {
        _state.ClickNext();
    }
    public void ClickPrev()
    {
        _state.ClickPrev();
    }
    public void VolumeUp()
    {
        _state.VolumeUp();
    }
    public void VolumeDown()
    {
        _state.VolumeDown();
    }
}