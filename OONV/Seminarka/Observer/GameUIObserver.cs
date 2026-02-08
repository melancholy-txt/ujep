using Spectre.Console;

public class GameUIObserver : IGameObserver
{
    public void OnUnitDamaged(Unit unit, int damage)
    {
        AnsiConsole.MarkupLine($"[red]{unit.GetType().Name} took {damage} damage! (HP: {unit.Hp})[/]");
    }

    public void OnUnitDied(Unit unit)
    {
        AnsiConsole.MarkupLine($"[grey]{unit.GetType().Name} has been slain![/]");
    }

    public void OnTurnChanged(string turnInfo)
    {
        GameUI.ShowTurnHeader(turnInfo);
    }
}