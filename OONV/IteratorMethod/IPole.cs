interface IPole<T>
{
    IIterator<T> CreateLeftIterator();
    IIterator<T> CreateRightIterator();
}