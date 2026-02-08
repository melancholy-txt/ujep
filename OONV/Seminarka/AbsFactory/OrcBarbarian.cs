public class OrcBarbarian : Tank
{
    public OrcBarbarian(int hp, int attack, Guid unitId) : base(hp, attack, unitId)
    {
    }

    public override void Attack()
    {
        Console.WriteLine("Orc Barbarian smashes with brutal force!");
    }

    public override void Block()
    {
        Console.WriteLine("Orc Barbarian blocks with raw strength!");
    }
}