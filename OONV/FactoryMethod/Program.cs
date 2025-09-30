namespace FactoryMethod;

interface Database
{
    public string ReadRecord();
    public string WriteRecord();
}

class MySQL : Database
{
    public MySQL() { }
    public string ReadRecord() { return "select * from db"; }
    public string WriteRecord() { return "insert '' into ..."; }

}

class MongoDB : Database
{
    public MongoDB() { }
    public string ReadRecord() { return "find(...)"; }
    public string WriteRecord() { return "insertOne(...)"; }

}

class Factory
{
    public Database CreateProduct(string typ)
    {
        if (typ == "NoSQL") { return new MongoDB(); }
        else { return new MySQL(); }

    }
}

class Program
{
    static void Main(string[] args)
    {
        Factory tovarnicka = new Factory();
        Database db = tovarnicka.CreateProduct("NoSQL");
        Console.WriteLine(db.ReadRecord());
    }
}
