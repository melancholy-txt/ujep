public abstract class Unit
{
    public int Hp { get; protected set; }
    public int AttackPower { get; protected set; }
    public Guid UnitId { get; protected set; }
    public bool IsAlive => Hp > 0;

    public Unit(int hp, int attack, Guid unitId)
    {
        Hp = hp;
        AttackPower = attack;
        UnitId = unitId;
    }

    public abstract void Attack();

    public void TakeDamage(int damage)
    {
        Hp -= damage;
        // Removed observer notifications
    }

    public void Heal(int amount) => Hp += amount;
}