public class ElfWarrior : Tank
{
    public ElfWarrior(int hp, int attack, Guid unitId) : base(hp, attack, unitId)
    {
    }

    public override void Attack()
    {
        Console.WriteLine("Elf Warrior strikes with a heavy blow!");
    }

    public override void Block()
    {
        Console.WriteLine("Elf Warrior blocks with a shield!");
    }
}