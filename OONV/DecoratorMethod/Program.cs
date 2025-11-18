using System.ComponentModel.Design;

namespace DecoratorMethod;

public interface ICoffeeMaker
{
    public string BrewCoffee();
}

class BasicCoffeeMaker() : ICoffeeMaker
{
    public string BrewCoffee()
    {
        return "Černá káva";
    }
}

abstract class BaseDecorator(ICoffeeMaker coffeeMaker) : ICoffeeMaker
{
    public virtual string BrewCoffee()
    {
        return coffeeMaker.BrewCoffee();
    }
}

class MilkMachine(ICoffeeMaker coffeeMaker) : BaseDecorator(coffeeMaker)
{
    public override string BrewCoffee()
    {
        return base.BrewCoffee() + " s mlékem";
    }
    
}

class MugWarmer(ICoffeeMaker coffeeMaker) : BaseDecorator(coffeeMaker)
{
    public override string BrewCoffee()
    {
        return "Vyhřátý hrnek a v něm " + base.BrewCoffee();
    }
}
class Program
{
    static void Main(string[] args)
    {
        ICoffeeMaker kavovar = new BasicCoffeeMaker();
        Console.WriteLine(kavovar.BrewCoffee());
        kavovar = new MilkMachine(kavovar);
        Console.WriteLine(kavovar.BrewCoffee());
        kavovar = new MugWarmer(kavovar);   
        Console.WriteLine(kavovar.BrewCoffee());
    }
}
