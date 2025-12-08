using System.Runtime.CompilerServices;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace FlyweightMethod;

class BadParticle
{
    float[] coords;
    float[] vector;
    float speed;
    byte[] texture;

    public BadParticle(float[] coords, float speed, byte[] texture)
    {
        this.coords = coords;
        this.vector = new float[] { 0.0f, 0.0f };
        this.speed = speed;
        this.texture = texture;
    }

    public void Move(float[] vector, float speed)
    {
        coords[0] += vector[0] * speed; 
        coords[1] += vector[1] * speed;   
    }
}

class Particle
{
    byte[] texture;

    public Particle(byte[] texture)
    {
        this.texture = texture;
    }
}

class MovingParticle
{
    Particle particle;

    float[] coords;
    float[] vector;
    float speed;

    public MovingParticle(float[] coords, float speed, Particle particle)
    {
        this.coords = coords;
        this.vector = new float[] { 0.0f, 0.0f };
        this.speed = speed;
        this.particle = particle;
    }
    public void Move(float[] vector,float speed)
    {
        coords[0] += vector[0] * speed; 
        coords[1] += vector[1] * speed;   
    }
}

class Program
{
    static void Main(string[] args)
    {
        int numberOfParticles = 100000;
        int velikostBitmapy = 500;
        Random rng = new Random();

        Console.WriteLine("1. BEZ MUŠÍ VÁHY");
        long before = GC.GetTotalMemory(true);
        Console.WriteLine($"Paměť před vytvořením částic: {before / 1024.0:F2} KB");
        List<BadParticle> nopparticles = new List<BadParticle>();
        for (int i = 0; i < numberOfParticles; i++)
        {
            float xrand = rng.Next(0, 800);
            float yrand = rng.Next(0, 600);
            BadParticle nopParticle = new BadParticle(
                new float[] { xrand, yrand }, 2f, new byte[velikostBitmapy * 1024]
            );
            nopparticles.Add(nopParticle);
        }
        long after = GC.GetTotalMemory(true);
        Console.WriteLine($"Paměť po vytvoření částic: {after / 1024.0:F2} KB");
    Console.WriteLine($"Rozdíl: {(after - before) / 1_073_741_824.0:F3} GB");

        Console.WriteLine("2. S MUŠÍ VÁHOU");
    before = GC.GetTotalMemory(true);
    Console.WriteLine($"Paměť před vytvořením částic: {before / 1_073_741_824.0:F3} GB");
        Particle particle = new Particle(new byte[velikostBitmapy * 1024]);
        List<MovingParticle> mparticles = new List<MovingParticle>();
        for (int i = 0; i < numberOfParticles; i++)
        {
            float xrand = rng.Next(0, 800);
            float yrand = rng.Next(0, 600);
            MovingParticle mParticle = new MovingParticle(new float[] { xrand, yrand }, 2f, particle);
            mparticles.Add(mParticle);
        }
    after = GC.GetTotalMemory(true);
    Console.WriteLine($"Paměť po vytvoření částic: {after / 1_073_741_824.0:F3} GB");
    Console.WriteLine($"Rozdíl: {(after - before) / 1_073_741_824.0:F3} GB");
    
    }
}
