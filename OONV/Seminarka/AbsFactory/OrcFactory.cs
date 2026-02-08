public class OrcFactory : IAbsFactory
{
    public Ranged CreateRanged()
    {
        return new OrcCrossbowman(100, 60, Guid.NewGuid(), 5);
    }

    public Tank CreateTank()
    {
        return new OrcBarbarian(200, 25, Guid.NewGuid());
    }

    public Soldier CreateSoldier()
    {
        return new OrcGrunt(150, 40, Guid.NewGuid());
    }
}