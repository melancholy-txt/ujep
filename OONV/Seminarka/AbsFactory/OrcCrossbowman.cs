public class OrcCrossbowman : Ranged
{
    public OrcCrossbowman(int hp, int attack, Guid unitId, int range) : base(hp, attack, unitId, range)
    {
    }

    public override void Attack()
    {
        Console.WriteLine("Orc Crossbowman fires a bolt!");
    }
}