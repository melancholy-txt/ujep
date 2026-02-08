using System;

class Program
{
    static void Main(string[] args)
    {
        GameEventManager.Instance.Subscribe(new GameUIObserver());

        var game = new Game();

        var playerFaction = GameUI.SelectFaction("Choose your faction");
        var aiFaction = GameUI.SelectFaction("Choose AI faction");

        IAbsFactory playerFactory = playerFaction == Faction.Elves ? new ElfFactory() : new OrcFactory();
        IAbsFactory aiFactory = aiFaction == Faction.Elves ? new ElfFactory() : new OrcFactory();

        game.PlayerUnits.Add(playerFactory.CreateSoldier());
        game.PlayerUnits.Add(playerFactory.CreateTank());
        game.PlayerUnits.Add(playerFactory.CreateRanged());

        game.EnemyUnits.Add(aiFactory.CreateSoldier());
        game.EnemyUnits.Add(aiFactory.CreateTank());
        game.EnemyUnits.Add(aiFactory.CreateRanged());

        game.Run();
    }
}