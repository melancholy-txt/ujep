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
        return "Černá káva co vychladne";
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

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}
