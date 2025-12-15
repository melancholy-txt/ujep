class SoundRecorderVisitor : IVisitor
{
    public void navštivOpičku(Opiček opiček)
    {
        Console.WriteLine("nejdrive musime opicku nalakat banany");
        Console.WriteLine("tady mas banan, pojd ke me opicko...");
        opiček.pocetBananu += 1;
        opiček.Eat();
        Console.WriteLine("Nahrávám zvuk opičky: ");
        opiček.Speak();
        Console.WriteLine("...zvuk nahrán. tady je realna logika konverrtovani nahravky jojo");   
    }

    public void navštivKočičku(Koček koček)
    {
        Console.WriteLine("nejdrive musime kocku nalakat");
        Console.WriteLine("psst pst pst...");       
        Console.WriteLine("Nahrávám zvuk kočičky: ");
        koček.Speak();
        Console.WriteLine("...zvuk nahrán. tady je realna logika konverrtovani nahravky jojo");
    }
}