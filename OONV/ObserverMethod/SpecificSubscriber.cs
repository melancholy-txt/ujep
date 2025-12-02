class SpecificSubscriber : ISubscriber
{
    public SpecificSubscriber(string[] filteredSales)
    {
        FilteredSales = new List<string>(filteredSales);
    }   
    private List<string> filteredSales = new List<string>();

    public List<string> FilteredSales
    {
        get => filteredSales;
        set => filteredSales = value ?? new List<string>();
    }

    public void Update(Publisher publisher)
    {
        // System.Console.WriteLine("--------------------------------");
        List<string> sales = publisher.GetSales();
        System.Console.Write($"\nChci jen ");
        foreach (string filter in FilteredSales)
        {
            System.Console.Write(filter + ", ");
        }
        System.Console.Write("momentalne ve sleve: ");

        for (int i = 0; i < sales.Count; i++)
        {
            if (FilteredSales.Contains(sales[i]))
            {
                if (i == sales.Count - 1)
                    System.Console.Write(sales[i]);
                else
                    System.Console.Write(sales[i] + ", ");
            }
        }
    }
}   