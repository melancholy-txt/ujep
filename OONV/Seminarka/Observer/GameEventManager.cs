public sealed class GameEventManager
{
    private static GameEventManager? _instance;
    private readonly List<IGameObserver> _observers = new();

    public static GameEventManager Instance => _instance ??= new GameEventManager();

    private GameEventManager() { }

    public void Subscribe(IGameObserver observer)
    {
        if (!_observers.Contains(observer))
            _observers.Add(observer);
    }

    public void Unsubscribe(IGameObserver observer) => _observers.Remove(observer);

    public void NotifyDamage(Unit unit, int damage)
    {
        foreach (var observer in _observers)
            observer.OnUnitDamaged(unit, damage);
    }

    public void NotifyDeath(Unit unit)
    {
        foreach (var observer in _observers)
            observer.OnUnitDied(unit);
    }

    public void NotifyTurnChanged(string turnInfo)
    {
        foreach (var observer in _observers)
            observer.OnTurnChanged(turnInfo);
    }
}