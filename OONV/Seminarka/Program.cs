using System;

class Program
{
    static void Main(string[] args)
    {
        var game = new Game();

        IAbsFactory elfFactory = new ElfFactory();
        IAbsFactory orcFactory = new OrcFactory();

        // Add player units (Elves)
        game.PlayerUnits.Add(elfFactory.CreateSoldier());
        game.PlayerUnits.Add(elfFactory.CreateTank());
        game.PlayerUnits.Add(elfFactory.CreateRanged());

        // Add enemy units (Orcs)
        game.EnemyUnits.Add(orcFactory.CreateSoldier());
        game.EnemyUnits.Add(orcFactory.CreateTank());
        game.EnemyUnits.Add(orcFactory.CreateRanged());

        game.Run();
    }
}