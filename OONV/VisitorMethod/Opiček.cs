class Opiček : IAnimal
{
    public void accept(IVisitor visitor)
    {
        visitor.navštivOpičku(this);
    }
    public int pocetBananu = 0;
    public void Speak()
    {
        Console.WriteLine("U A U A U A");
    }

    public void Eat()
    {
        if (pocetBananu == 0)
        {
            Console.WriteLine("nejsou banany :(");
            return;
        }
        else
        {
            for (int i = 0; i < pocetBananu; i++)
            {
                Console.WriteLine("mňam mňam banánek!!! :)");
            }         
            pocetBananu = 0;  
        }   
    }
}