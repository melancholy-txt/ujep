class KrmícíVisitor : IVisitor
{
    public int pocetBananuProOpičku = 0;    
    public int pocetMyšičekProKočičku = 0;

    public void JítNakupovat()
    {
        Console.WriteLine("Jdu nakupovat jídlo pro zvířátka...");
        pocetBananuProOpičku = System.Random.Shared.Next(1, 5);
        pocetMyšičekProKočičku = System.Random.Shared.Next(1, 5);
        Console.WriteLine("Nákup dokončen!");
    }
    public void navštivOpičku(Opiček opiček)
    {
        Console.WriteLine("Krmím opičku banány.");
        opiček.pocetBananu += pocetBananuProOpičku;
    }

    public void navštivKočičku(Koček koček)
    {
        Console.WriteLine("Krmím kočičku rybičkou.");
        koček.pocetMyší += pocetMyšičekProKočičku;
    }
}