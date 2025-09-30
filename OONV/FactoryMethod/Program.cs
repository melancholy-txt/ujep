namespace FactoryMethod;

interface Database
{
    public string ReadRecord();
    public string WriteRecord();
}

class MySQL : Database
{
    public MySQL() { }
    public string ReadRecord() { return "find(...)"; }
    public string WriteRecord() { return "insertOne(...)"; }

}

class MongoDB : Database
{
    public MongoDB() { }
    public string ReadRecord() { return "select * from db"; }
    public string WriteRecord() { return "insert '' into ..."; }

}

class FactoryMethod
{
    public Database CreateProduct(string typ)
    {

    }
}

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}
