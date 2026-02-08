public abstract class Tank : Unit
{
    public Tank(int hp, int attack, Guid unitId) : base(hp, attack, unitId) { }

    public abstract void Block();
}