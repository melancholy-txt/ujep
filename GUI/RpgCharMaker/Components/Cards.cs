namespace RpgCharMaker.Components
{
    public class CharCard
    {
        public string Name { get; set; } = "";
        public string Class { get; set; } = "";
        public int Str { get; set; }
        public int Dex { get; set; }
        public int Int { get; set; }
        public int Cha { get; set; }
        public int Wis { get; set; }
    }

    public static class Cards
    {
        public static List<CharCard> Roster { get; set; } = new();
    }
}
