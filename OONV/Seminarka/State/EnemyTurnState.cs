using Spectre.Console;

public class EnemyTurnState : IGameState
{
    public void Enter(Game game)
    {
        GameUI.ShowTurnHeader("Enemy Turn");
        GameUI.ShowUnits(game.PlayerUnits, game.EnemyUnits);
    }

    public void Update(Game game)
    {
        foreach (var enemy in game.EnemyUnits.Where(e => e.IsAlive))
        {
            var target = game.PlayerUnits.FirstOrDefault(p => p.IsAlive);
            if (target != null)
            {
                GameUI.ShowAttack(enemy, target, enemy.AttackPower);
                target.TakeDamage(enemy.AttackPower);
            }
        }

        GameUI.PressAnyKey();
        game.SetState(new PlayerTurnState());
    }

    public void Exit(Game game) { }
}