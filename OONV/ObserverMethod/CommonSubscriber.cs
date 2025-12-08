class CommonSubscriber : ISubscriber{
    public void Update(Publisher publisher)
    {
        // System.Console.WriteLine("\n --------------------------------");

        List<string> sales = publisher.GetSales();
        System.Console.Write("\nChci vsechny knizky, momentalne ve sleve: ");

        for(int i = 0; i < sales.Count; i++)
        {
            if(i == sales.Count - 1)
                System.Console.Write(sales[i]);
            else
                System.Console.Write(sales[i] + ", ");
        }
    }
}