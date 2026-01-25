public interface IGameObserver
{
    void OnUnitDamaged(Unit unit, int damage);
    void OnUnitDied(Unit unit);
    void OnTurnChanged(string turnInfo);
}