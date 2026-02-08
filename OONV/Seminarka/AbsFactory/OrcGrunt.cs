public class OrcGrunt : Soldier
{
    public OrcGrunt(int hp, int attack, Guid unitId) : base(hp, attack, unitId)
    {
    }

    public override void Attack()
    {
        Console.WriteLine("Orc Grunt attacks with a club!");
    }
}