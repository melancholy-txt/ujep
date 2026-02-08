class LeftIterator<T> : IIterator<T>
{
    private Pole<T> pole;
    private int position;

    public LeftIterator(Pole<T> pole)
    {
        this.pole = pole;
        this.position = 0;
    }

    public bool HasNext()
    {
        return position < pole.size;
    }

    public T GetNext()
    {
        if (!HasNext())
            throw new InvalidOperationException("No more elements.");
        else
            return pole.elements[position++];
    }
}