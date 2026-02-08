public abstract class Ranged : Unit
{
    public int Range { get; protected set; }

    public Ranged(int hp, int attack, Guid unitId, int range) : base(hp, attack, unitId)
    {
        Range = range;
    }

}