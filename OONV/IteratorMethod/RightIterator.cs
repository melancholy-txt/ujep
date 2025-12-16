class RightIterator<T> : IIterator<T>
{
    private Pole<T> pole;
    private int position;

    public RightIterator(Pole<T> pole)
    {
        this.pole = pole;
        this.position = pole.size - 1;
    }

    public bool HasNext()
    {
        return position >= 0;
    }

    public T GetNext()
    {
        if (!HasNext())
            throw new InvalidOperationException("No more elements.");
        else
            return pole.elements[position--];
    }
}