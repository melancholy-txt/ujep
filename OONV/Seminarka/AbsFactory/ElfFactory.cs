public class ElfFactory : IAbsFactory
{
    public Ranged CreateRanged()
    {
        return new ElfArcher(80, 60, Guid.NewGuid(), 10);
    }

    public Tank CreateTank()
    {
        return new ElfWarrior(150, 20, Guid.NewGuid());
    }

    public Soldier CreateSoldier()
    {
        return new ElfSwordsman(100, 40, Guid.NewGuid());
    }
}