public class ElfSwordsman : Soldier
{
    public ElfSwordsman(int hp, int attack, Guid unitId) : base(hp, attack, unitId)
    {
    }
    public override void Attack()
    {
        Console.WriteLine("Elf Swordsman attacks with a sword!");
    }
}