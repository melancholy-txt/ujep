public class PlayerTurnState : IGameState
{
    public void Enter(Game game)
    {
        GameEventManager.Instance.NotifyTurnChanged("Your Turn");
        GameUI.ShowUnits(game.PlayerUnits, game.EnemyUnits);
    }

    public void Update(Game game)
    {
        var attacker = GameUI.SelectAttacker(game.PlayerUnits);
        var target = GameUI.SelectTarget(game.EnemyUnits);

        GameUI.ShowAttack(attacker, target, attacker.AttackPower);
        target.TakeDamage(attacker.AttackPower);

        GameUI.PressAnyKey();
        game.SetState(new EnemyTurnState());
    }

    public void Exit(Game game) { }
}