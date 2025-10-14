using System;
namespace AbstractFactory
{
    class Program
    {

        abstract class Footsoldier
        {
            int hp { get; set; }
            int attack { get; set; }
            int range { get; set; }

            public Footsoldier(int hp, int attack, int range)
            {
                this.hp = hp;
                this.attack = attack;
                this.range = range;
            }

            public abstract void Attack();

        }

        abstract class Archer

        {
            int hp { get; set; }
            int attack { get; set; }
            int range { get; set; }

            public Archer(int hp, int attack, int range)
            {
                this.hp = hp;
                this.attack = attack;
                this.range = range;
            }

            public abstract void Attack();

        }

        interface IAbstractFactory
        {
            Footsoldier CreateFootsoldier();
            Archer CreateArcher();
        }

        class ElfFactory : IAbstractFactory
        {
            public Footsoldier CreateFootsoldier()
            {
                return new ElfFootsoldier();
            }

            public Archer CreateArcher()
            {
                return new ElfArcher();
            }
        }

        class OrcFactory : IAbstractFactory
        {
            public Footsoldier CreateFootsoldier()
            {
                return new OrcFootsoldier();
            }

            public Archer CreateArcher()
            {
                return new OrcArcher();
            }
        }

        class ElfFootsoldier : Footsoldier
        {
            public ElfFootsoldier() : base(100, 15, 1) { }

            public override void Attack()
            {
                Console.WriteLine("Elf Footsoldier attacks with a sword!");
            }
        }
        class ElfArcher : Archer
        {
            public ElfArcher() : base(80, 10, 5) { }

            public override void Attack()
            {
                Console.WriteLine("Elf Archer attacks with a bow!");
            }
        }
        class OrcFootsoldier : Footsoldier
        {
            public OrcFootsoldier() : base(120, 20, 1) { }

            public override void Attack()
            {
                Console.WriteLine("Orc Footsoldier attacks with a club!");
            }
        }
        class OrcArcher : Archer
        {
            public OrcArcher() : base(90, 15, 5) { }
            public override void Attack()
            {
                Console.WriteLine("Orc Archer attacks with a crossbow!");
            }
        }

        static void Main(string[] args)
        {
            IAbstractFactory factory = new OrcFactory();
            Footsoldier footsoldier = factory.CreateFootsoldier();
            Archer archer = factory.CreateArcher();

            footsoldier.Attack();
            archer.Attack();
        }
    }
}
