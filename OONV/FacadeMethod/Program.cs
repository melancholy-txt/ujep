namespace FacadeMethod;

class Barista()
{
    Mlynek mlynek = new Mlynek();
    Pakovac pakovac = new Pakovac();
    Kavovar kavovar = new Kavovar();

    public void UvarKafe()
    {
        mlynek.MletKafe();
        pakovac.KafeDoPaky();
        kavovar.UvaritKafe();
        kavovar.VylitKafe();
        Console.WriteLine("Káva je hotová!");   
    }
}

class Mlynek
{
    public void MletKafe()
    {
        Console.WriteLine("Mletí kávy");
    }
}

class Pakovac
{
    public void KafeDoPaky()
    {
        Console.WriteLine("Káva správně rozprostřená do páky");
    }
}
class Kavovar
{
    public void UvaritKafe()
    {
        Console.WriteLine("Vaření kávy");
    }   
    public void VylitKafe()
    {
        Console.WriteLine("Káva teče do šálku");
    }
}

class Program
{
    static void Main(string[] args)
    {
        Console.Write("...");
        Console.ReadLine();
        Console.WriteLine("máme women's project nicaraguu");
        Console.ReadLine();    
        Barista barista = new Barista();
        barista.UvarKafe();
    }
}
