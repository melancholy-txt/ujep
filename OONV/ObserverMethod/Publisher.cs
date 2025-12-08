class Publisher
{
    List<ISubscriber> subscribers = new List<ISubscriber>();
    List<string> sales = new List<string>();

    public void UpdateSales(string sale)
    {
        sales.Add(sale);
        NotifySubscribers();
    }

    public void UpdateSales(List<string> newSales)
    {
        sales = newSales;
        NotifySubscribers();
    }

    public List<string> GetSales()
    {
        return sales;
    }

    public void Subscribe(ISubscriber subscriber)
    {
        subscribers.Add(subscriber);
    }

    public void Unsubscribe(ISubscriber subscriber)
    {
        subscribers.Remove(subscriber);
    }   

    private void NotifySubscribers()
    {
        foreach (ISubscriber subscriber in subscribers)
        {
            subscriber.Update(this);
        }
    }
}