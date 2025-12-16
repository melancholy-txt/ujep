using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("choose type:\n");
        var type = Console.ReadLine();
        switch (type)
        {
            case "int":
                RunIntExample();
                break;
            case "string":
                RunStringExample(); // Example for string type can be implemented similarly
                break;
            // Additional cases for other types can be added here
            default:
                Console.WriteLine("Type not supported.");
                break;
        }
    }

    private static void RunStringExample()
    {
        var data = new[] { "jedna", "dva", "tri", "ctyri", "pet" };
        var pole = new Pole<string>(data);

        Console.WriteLine("Left to right:");
        IIterator<string> left = pole.CreateLeftIterator();
        while (left.HasNext())
        {
            Console.Write(left.GetNext());
            Console.Write(' ');
        }
        Console.WriteLine();

        Console.WriteLine("Right to left:");
        IIterator<string> right = pole.CreateRightIterator();
        while (right.HasNext())
        {
            Console.Write(right.GetNext());
            Console.Write(' ');
        }
        Console.WriteLine();
    }

    private static void RunIntExample()
    {
       var data = new[] { 1, 2, 3, 4, 5 };
        var pole = new Pole<int>(data);

        Console.WriteLine("Left to right:");
        IIterator<int> left = pole.CreateLeftIterator();
        while (left.HasNext())
        {
            Console.Write(left.GetNext());
            Console.Write(' ');
        }
        Console.WriteLine();

        Console.WriteLine("Right to left:");
        IIterator<int> right = pole.CreateRightIterator();
        while (right.HasNext())
        {
            Console.Write(right.GetNext());
            Console.Write(' ');
        }
        Console.WriteLine();
    }
}
