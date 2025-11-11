namespace BridgeMethod;

interface IDevice
{
    bool isOn();
    void turnOn();
    void turnOff();
    int getVolume();
    void setVolume(int volume);
    int getChannel();
    void setChannel(int channelNumber);

}

class Remote
{
    protected readonly IDevice _device;

    public Remote(IDevice device)
    {
        _device = device;
    }

    public void togglePower()
    {
        if (_device.isOn())
        {
            _device.turnOff();
        }
        else
        {
            _device.turnOn();
        }
    }

    public void volumeUp()
    {
        _device.setVolume(_device.getVolume() + 1);
    }

    public void volumeDown()
    {
        _device.setVolume(_device.getVolume() - 1);
    }

    public void channelUp()
    {
        _device.setChannel(_device.getChannel() + 1);
    }

    public void channelDown()
    {
        _device.setChannel(_device.getChannel() - 1);
    }

}

class BetterRemote : Remote
{

    private int _lastVolume;
    public BetterRemote(IDevice device) : base(device)
    {
    }

    public void mute()
    {
        if (_device.getVolume() > 0)
        {         
            _lastVolume = _device.getVolume();      
            _device.setVolume(0);
        }
        else
            _device.setVolume(_lastVolume);
    }
}

class Television : IDevice
{
    private bool _on = false;
    private int _volume = 15;
    private int _channel = 1;
    private int _maxChannel = 100;
    private int _maxVolume = 100;   

    public bool isOn() => _on;

    public void turnOn() => _on = true;

    public void turnOff() => _on = false;

    public int getVolume() => _volume;

    public void setVolume(int volume)
    {
        if (volume > _maxVolume)
            _volume = _maxVolume;
        else if (volume < 0)
            _volume = 0;
        else
            _volume = volume;
    }

    public int getChannel() => _channel;

    public void setChannel(int channelNumber)
    {
        if (channelNumber > _maxChannel)
            _channel = 1;
        else if (channelNumber < 1)
            _channel = _maxChannel;
        else
            _channel = channelNumber;
    }
}

class Radio : IDevice
{
    private bool _on = false;
    private int _volume = 2;
    private int _channel = 1;
    private int _maxChannel = 10;
    private int _maxVolume = 10;

    public bool isOn() => _on;

    public void turnOn() => _on = true;

    public void turnOff() => _on = false;

    public int getVolume() => _volume;

    public void setVolume(int volume){
        if (volume > _maxVolume)
            _volume = _maxVolume;
        else if (volume < 0)
            _volume = 0;
        else
            _volume = volume;
    }

    public int getChannel() => _channel;

    public void setChannel(int channelNumber) {
        if (channelNumber > _maxChannel)
            _channel = 1;
        else if (channelNumber < 1)
            _channel = _maxChannel;
        else
            _channel = channelNumber;
    }
}

class Program
{
    static void Main(string[] args)
    {
        // Showcase the Bridge pattern: demonstrate how the same Remote
        // abstraction can operate on different Implementations (Television vs Radio).

        static void PrintState(IDevice d, string name)
        {
            Console.WriteLine($"{name} - Type: {d.GetType().Name}, Power: {(d.isOn() ? "On" : "Off")}, Volume: {d.getVolume()}, Channel: {d.getChannel()}");
        }

        var tv = new Television();
        var radio = new Radio();

        var tvRemote = new Remote(tv);
        var radioRemote = new BetterRemote(radio);

        Console.WriteLine("Bridge pattern showcase: Television vs Radio\n");

        PrintState(tv, "TV initial");
        PrintState(radio, "Radio initial");

        Console.WriteLine("\n--- Toggle TV power and change volume/channel ---");
        tvRemote.togglePower();                // turn TV on
        tvRemote.volumeUp();                    // increase TV volume by 1
        tvRemote.channelUp();                   // increment TV channel
        PrintState(tv, "TV after power on, vol up, channel up");

        Console.WriteLine("\n--- TV channel wrap-around (set to 101) ---");
        tv.setChannel(101);                     // beyond maxChannel to show wrap behavior
        PrintState(tv, "TV after setChannel(101)");

        Console.WriteLine("\n--- Radio operations via BetterRemote (mute/unmute, channel wrap) ---");
        radioRemote.togglePower();              // turn Radio on
        radioRemote.volumeUp();                 // increase radio volume
        PrintState(radio, "Radio after power on and vol up");
        radioRemote.mute();                     // mute (store last volume)
        PrintState(radio, "Radio after mute");
        radioRemote.mute();                     // unmute (restore last volume)
        PrintState(radio, "Radio after unmute (should restore last volume)");

        Console.WriteLine("\n--- Radio channel wrap-around (set to 11) ---");
        radio.setChannel(11);                   // beyond maxChannel to show wrap behavior
        PrintState(radio, "Radio after setChannel(11)");

        Console.WriteLine("\nDone.");
    }
}
