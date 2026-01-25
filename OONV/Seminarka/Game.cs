public class Game
{
    private IGameState? _currentState;

    public List<Unit> PlayerUnits { get; } = new();
    public List<Unit> EnemyUnits { get; } = new();
    public bool IsRunning { get; private set; } = true;

    public void SetState(IGameState state)
    {
        _currentState?.Exit(this);
        _currentState = state;
        _currentState.Enter(this);
    }

    public void Run()
    {
        GameUI.ShowTitle();
        SetState(new PlayerTurnState());

        while (IsRunning)
        {
            if (!EnemyUnits.Any(u => u.IsAlive))
            {
                GameUI.ShowVictory();
                IsRunning = false;
            }
            else if (!PlayerUnits.Any(u => u.IsAlive))
            {
                GameUI.ShowDefeat();
                IsRunning = false;
            }
            else
            {
                _currentState?.Update(this);
            }
        }
    }
}