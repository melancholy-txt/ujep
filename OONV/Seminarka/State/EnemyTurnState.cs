using Spectre.Console;

public class EnemyTurnState : IGameState
{
    public void Enter(Game game)
    {
        GameEventManager.Instance.NotifyTurnChanged("Enemy Turn");
        GameUI.ShowUnits(game.PlayerUnits, game.EnemyUnits);
    }

    public void Update(Game game)
    {
        var random = new Random();
        var attacker = game.EnemyUnits.Where(e => e.IsAlive).OrderBy(_ => random.Next()).FirstOrDefault();
        if (attacker != null)
        {
            var target = game.PlayerUnits.Where(p => p.IsAlive).OrderBy(_ => random.Next()).FirstOrDefault();
            if (target != null)
            {
                GameUI.ShowAttack(attacker, target, attacker.AttackPower);
                target.TakeDamage(attacker.AttackPower);
            }
        }

        GameUI.PressAnyKey();
        game.SetState(new PlayerTurnState());
    }

    public void Exit(Game game) { }
}