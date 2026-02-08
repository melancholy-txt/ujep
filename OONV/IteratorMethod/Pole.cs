class Pole<T> : IPole<T>
{
    public T[] elements;
    public int size;
    public Pole(T[] elements)
    {
        this.elements = elements;
        this.size = elements.Length;
    }
    public IIterator<T> CreateLeftIterator()
    {
        return new LeftIterator<T>(this);
    }

    public IIterator<T> CreateRightIterator()
    {
        return new RightIterator<T>(this);
    }
}