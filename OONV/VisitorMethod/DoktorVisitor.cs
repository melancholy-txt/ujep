class DoktorVisitor : IVisitor
{
    public void navštivOpičku(Opiček opiček)
    {
        Console.WriteLine("jdeme ošetřit opičku!");
        Console.WriteLine("Poslouchám opičku...");
        opiček.Speak();
        Console.WriteLine("Provádím vyšetření...");
        Console.WriteLine("Opička je zdravá!");
    }

    public void navštivKočičku(Koček koček)
    {
        Console.WriteLine("jdeme ošetřit kočičku!");
        Console.WriteLine("Poslouchám kočičku...");
        koček.Speak();
        Console.WriteLine("kočko kam utikas! čičičiči...");
        Console.WriteLine("Provádím vyšetření..."); 
        Console.WriteLine("Kočička je zdravá!");
    }
}