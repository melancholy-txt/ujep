class Koček : IAnimal
{
    public void accept(IVisitor visitor)
    {
        visitor.navštivKočičku(this);
    }
    public int pocetMyší = 0;
    public void Speak()
    {
        Console.WriteLine("rawr :3");
    }

    public void Eat()
    {
        if (pocetMyší == 0)
        {
            Console.WriteLine("nejsou myši :(");
            return;
        }
        else
        {
            for (int i = 0; i < pocetMyší; i++)
            {
                Console.WriteLine("mňam mňam myška!!! :3");
            }
            pocetMyší = 0;
        }
    }
}