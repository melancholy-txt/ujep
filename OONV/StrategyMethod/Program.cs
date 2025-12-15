namespace StrategyMethod;
using System;

interface ISorter
{
    void Sort(int file);
}

class BubbleSort : ISorter
{
    public void Sort(int file)
    {
        Console.WriteLine("Sorting using Bubble Sort for a file that's " + file + " TondaBytes large!");
    }
}

class QuickSort : ISorter
{
    public void Sort(int file)
    {
        Console.WriteLine("Sorting using Quick Sort for a file that's " + file + " TondaBytes large!");
    }
}

class Context
{
    private ISorter _sorter    ;

    public Context(ISorter sorter)
    {
        _sorter = sorter    ;
    }

    public void SetStrategy(ISorter sorter)
    {
        _sorter = sorter;
    }

    public void ExecuteStrategy(int file)
    {
        _sorter.Sort(file);
    }
}

class Program
{
    static void Main(string[] args)
    {
        Context context = new Context(new BubbleSort());

        for(int i = 0; i < 10; i++)
        {
            int filesize = System.Convert.ToInt32(new Random().Next(1, 40));
            if (filesize > 20)
            {
                context.SetStrategy(new QuickSort());
            }
            else
            {
                context.SetStrategy(new BubbleSort());
            }
            context.ExecuteStrategy(filesize);
        }

    }
}
