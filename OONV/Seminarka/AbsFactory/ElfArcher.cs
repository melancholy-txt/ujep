public class ElfArcher : Ranged
{
    public ElfArcher(int hp, int attack, Guid unitId, int range) : base(hp, attack, unitId, range)
    {
    }

    public override void Attack()
    {
        Console.WriteLine("Elf Archer shoots an arrow!");
    }
}