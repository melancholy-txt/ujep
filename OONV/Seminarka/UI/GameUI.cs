using Spectre.Console;

public static class GameUI
{
    public static void ShowTitle()
    {
        AnsiConsole.Write(
            new FigletText("Battle Arena")
                .Centered()
                .Color(Color.Red));
        AnsiConsole.WriteLine();
    }

    public static void ShowUnits(List<Unit> playerUnits, List<Unit> enemyUnits)
    {
        var table = new Table();
        table.Border(TableBorder.Rounded);
        table.Title("[yellow]Battle Status[/]");

        table.AddColumn("[green]Your Army[/]");
        table.AddColumn("[red]Enemy Army[/]");

        var maxRows = Math.Max(playerUnits.Count, enemyUnits.Count);

        for (int i = 0; i < maxRows; i++)
        {
            var playerInfo = i < playerUnits.Count
                ? FormatUnit(playerUnits[i], "green")
                : "";
            var enemyInfo = i < enemyUnits.Count
                ? FormatUnit(enemyUnits[i], "red")
                : "";

            table.AddRow(playerInfo, enemyInfo);
        }

        AnsiConsole.Write(table);
        AnsiConsole.WriteLine();
    }

    private static string FormatUnit(Unit unit, string color)
    {
        var status = unit.IsAlive ? $"[{color}]♥ {unit.Hp}[/]" : "[grey]DEAD[/]";
        return $"{unit.GetType().Name} - {status} | ⚔ {unit.AttackPower}";
    }

    public static Unit SelectAttacker(List<Unit> units)
    {
        var aliveUnits = units.Where(u => u.IsAlive).ToList();

        var selected = AnsiConsole.Prompt(
            new SelectionPrompt<Unit>()
                .Title("[green]Select your attacker:[/]")
                .UseConverter(u => $"{u.GetType().Name} (HP: {u.Hp}, ATK: {u.AttackPower})")
                .AddChoices(aliveUnits));

        return selected;
    }

    public static Unit SelectTarget(List<Unit> units)
    {
        var aliveUnits = units.Where(u => u.IsAlive).ToList();

        var selected = AnsiConsole.Prompt(
            new SelectionPrompt<Unit>()
                .Title("[red]Select your target:[/]")
                .UseConverter(u => $"{u.GetType().Name} (HP: {u.Hp})")
                .AddChoices(aliveUnits));

        return selected;
    }

    public static void ShowAttack(Unit attacker, Unit target, int damage)
    {
        AnsiConsole.MarkupLine($"[yellow]{attacker.GetType().Name}[/] attacks [red]{target.GetType().Name}[/]!");
        attacker.Attack();
        AnsiConsole.MarkupLine($"[red]-{damage} damage![/]");
        AnsiConsole.WriteLine();
    }

    public static void ShowVictory()
    {
        AnsiConsole.Write(
            new Panel("[green bold]VICTORY![/]")
                .Border(BoxBorder.Double)
                .BorderColor(Color.Green));
    }

    public static void ShowDefeat()
    {
        AnsiConsole.Write(
            new Panel("[red bold]DEFEAT![/]")
                .Border(BoxBorder.Double)
                .BorderColor(Color.Red));
    }

    public static void ShowTurnHeader(string turn)
    {
        AnsiConsole.Write(new Rule($"[yellow]{turn}[/]").RuleStyle("grey"));
        AnsiConsole.WriteLine();
    }

    public static void PressAnyKey()
    {
        AnsiConsole.MarkupLine("[grey]Press any key to continue...[/]");
        Console.ReadKey(true);
    }

    public static Faction SelectFaction(string title)
    {
        return AnsiConsole.Prompt(
            new SelectionPrompt<Faction>()
                .Title($"[yellow]{title}[/]")
                .AddChoices(Faction.Elves, Faction.Orcs));
    }
}