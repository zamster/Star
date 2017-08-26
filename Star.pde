import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
Manager mgr;

color[] superColor = {
  #fef4f4, #fdeff2, #e9dfe5, #e4d2d8, #f6bfbc, #f5b1aa, #f5b199, #efab93, #f2a0a1, #f0908d, #ee827c, #f09199, #f4b3c2, #eebbcb, #e8d3c7, #e8d3d1, #e6cde3, #e5abbe, #e597b2, #e198b4, #e4ab9b, #e09e87, #d69090, #d4acad, #c97586, #c099a0, #b88884, #b48a76, #a86965, #a25768, #ec6d71, #eb6ea5, #e95295, #e7609e, #d0576b, #c85179, #e9546b, #e95464, #c85554, #c53d43, #e83929, #e60033, #e2041b, #d7003a, #c9171e, #d3381c, #ce5242, #d9333f, #b94047, #ba2636, #b7282e, #a73836, #9e3d3f, #a22041, #a22041, #f8f4e6, #ede4cd, #e9e4d4, #ebe1a9, #f2f2b0, #e4dc8a, #f8e58c, #ddbb99, #d7a98c, #f2c9ac, #fff1cf, #fddea5, #fce2c4, #fde8d0, #f9c89b, #f7bd8f, #f6b894, #f4dda5, #f1bf99, #f1bf99, #efcd9a, #efcd9a, #f0cfa0, #edd3a1, #e0c38c, #f3bf88, #f7b977, #f19072, #f19072, #ee836f, #eb9b6f, #e0815e, #df7163, #d57c6b, #d0826c, #ca8269, #bb5548, #ab6953, #96514d, #8d6449, #deb068, #bf794e, #bc763c, #b98c46, #b79b5b, #b77b57, #b68d4c, #ad7d4c, #ad7d4c, #ae7c4f, #ad7e4e, #ae7c58, #a86f4c, #946243, #917347, #956f29, #8c7042, #7b6c3e, #d8a373, #cd8c5c, #cd5e3c, #cb8347, #c37854, #c38743, #c39143, #bf783a, #bb5535, #bb5520, #b55233, #aa4f37, #9f563a, #9f563a, #9a493f, #98623c, #965042, #965036, #95483f, #954e2a, #8f2e14, #8a3319, #8a3b00, #852e19, #7b4741, #773c30, #783c1d, #762f07, #752100, #6c3524, #683f36, #664032, #6d3c32, #583822, #6c2c2f, #640125, #f8b862, #f6ad49, #f39800, #f08300, #ec6d51, #ee7948, #ed6d3d, #ec6800, #ec6800, #ee7800, #eb6238, #ea5506, #ea5506, #eb6101, #e49e61, #e45e32, #e17b34, #dd7a56, #db8449, #d66a35, #ffd900, #ffd900, #ffea00, #ffec47, #fef263, #fcd575, #fbd26b, #f5e56b, #eec362, #ebd842, #ffdb4f, #fbca4d, #fcc800, #f8b500, #fabf14, #f7c114, #e6b422, #e6b422, #d9a62e, #d3a243, #c89932, #d0af4c, #8b968d, #6e7955, #767c6b, #888e7e, #5a544b, #56564b, #555647, #494a41, #6b6f59, #474b42, #333631, #5b6356, #726250, #9d896c, #94846a, #897858, #716246, #cbb994, #d6c6af, #bfa46f, #9e9478, #a59564, #715c1f, #c7b370, #dcd3b2, #a19361, #8f8667, #887938, #6a5d21, #918754, #a69425, #ada250, #938b4b, #8c8861, #a1a46d, #726d40, #928c36, #dccb18, #d7cf3a, #c5c56a, #c3d825, #b8d200, #e0ebaf, #d8e698, #c7dc68, #99ab4e, #7b8d42, #69821b, #aacf53, #b0ca71, #b9d08b, #839b5c, #cee4ae, #82ae46, #a8c97f, #9ba88d, #c8d5bb, #c1d8ac, #a8bf93, #769164, #d6e9ca, #93ca76, #93b881, #badcad, #97a791, #98d98e, #88cb7f, #69b076, #6b7b6e, #bed2c3, #93b69c, #a6c8b2, #47885e, #316745, #68be8d, #3eb370, #007b43, #bed3ca, #92b5a9, #7ebea5, #7ebeab, #028760, #3b7960, #2f5d50, #3a5b52, #475950, #00552e, #005243, #006e54, #00a381, #38b48b, #00a497, #80aba9, #5c9291, #478384, #43676b, #80989b, #2c4f54, #1f3134, #47585c, #485859, #6c848d, #53727d, #5b7e91, #426579, #4c6473, #455765, #44617b, #393f4c, #393e4f, #203744, #4d4c61, #eaf4fc, #eaedf7, #e8ecef, #ebf6f7, #c1e4e9, #bce2e8, #a2d7dd, #abced8, #a0d8ef, #89c3eb, #84a2d4, #83ccd2, #84b9cb, #698aab, #008899, #00a3af, #2a83a2, #59b9c6, #2ca9e1, #38a1db, #0095d9, #0094c8, #2792c3, #007bbb, #5383c3, #5a79ba, #4c6cb3, #3e62ad, #1e50a2, #507ea4, #19448e, #164a84, #165e83, #274a78, #2a4073, #223a70, #192f60, #1c305c, #0f2350, #17184b, #0d0015, #bbc8e6, #bbbcde, #8491c3, #8491c3, #4d5aaf, #4d5aaf, #4a488e, #4d4398, #5654a2, #706caa, #68699b, #867ba9, #dbd0e6, #a59aca, #7058a3, #674598, #674196, #9079ad, #745399, #65318e, #522f60, #493759, #2e2930, #884898, #c0a2c7, #460e44, #74325c, #55295b, #895b8a, #824880, #915c8b, #9d5b8b, #7a4171, #bc64a4, #b44c97, #aa4c8f, #cc7eb1, #cca6bf, #c4a3bf, #e7e7eb, #dcd6d9, #d3cfd9, #d3ccd6, #c8c2c6, #a6a5c4, #a69abd, #a89dac, #9790a4, #9e8b8e, #95859c, #95949a, #71686c, #705b67, #634950, #5f414b, #4f455c, #5a5359, #594255, #524748, #513743, #e6eae3, #d4dcd6, #d4dcda, #d3cbc6, #c8c2be, #b3ada0, #a99e93, #a58f86, #928178, #887f7a, #b4866b, #b28c6e, #a16d5d, #9f6f55, #8c6450, #856859, #765c47, #6f514c, #6f4b3e, #544a47, #543f32, #554738, #433d3c, #432f2f, #3f312b, #302833, #ffffff, #fffffc, #f7fcfe, #f8fbf8, #fbfaf5, #f3f3f3, #f3f3f2, #eae5e3, #e5e4e6, #dcdddd, #dddcd6, #c0c6c9, #afafb0, #adadad, #a3a3a2, #9ea1a3, #9fa0a0, #949495, #888084, #7d7d7d, #7b7c7d, #727171, #595857, #595455, #524e4d, #474a4d, #383c3c, #2b2b2b, #2b2b2b, #180614, #281a14, #000b00, #250d00, #241a08, #16160e
};

int MAX_PARTICLE_NUMBER = 512;

boolean sketchFullScreen()
{
  return true;
}

void setup() 
{
  size(displayWidth, displayHeight, P3D);
  smooth();
  noCursor();
  minim = new Minim(this);
  mgr = new Manager();
}

void draw() 
{
  background(8);
  blendMode(ADD);

  mgr.run();

  String fr = int(frameRate) + " FPS";
  frame.setTitle(fr);
}

class Manager 
{
  SimpleParticleSystem ps;
  AudioInput in;
  FFT fft;

  RoseSystem rose;
  PhysicSystem physic;

  Timer starTimer;

  public Manager () 
  {
    in = minim.getLineIn();

    fft = new FFT(in.bufferSize(), in.sampleRate());

    physic = new PhysicSystem();
    rose = new RoseSystem(random(16, 64));

    ps = rose;

    starTimer = new Timer(2500);
    starTimer.start();
  }

  void run()
  {
    fft.forward(in.mix);

    float frq = fft.calcAvg(80, 650);

    if (frq > 5 && ps == rose) 
    {
      physic = new PhysicSystem();
      ps = physic;
    }

    if (starTimer.isFinished())
    {
      starTimer.start();
      if (frq < 0.5 && ps == physic) 
      {
        rose = new RoseSystem(random(16, 64));
        ps = rose;
      }
    }

    ps.render(frq);
  }
}

// Interface
class SimpleParticleSystem 
{
  public SimpleParticleSystem () 
  {
  }

  void render(float frq)
  {
  }
}

class RoseSystem extends SimpleParticleSystem
{
  float seed;
  int dim;

  RoseParticle[] particles = new RoseParticle[MAX_PARTICLE_NUMBER];

  int cindex;

  public RoseSystem(float _s)
  {
    dim = 0;
    seed = _s;
    cindex = int(random(512));

    for (int i = 0; i < MAX_PARTICLE_NUMBER; i++)
    {
      int rndseed = cindex % 465;
      cindex++;
      particles[i] = new RoseParticle(i, superColor[rndseed], seed);
    }
  }

  void render(float frq)
  {
    if (dim < MAX_PARTICLE_NUMBER)
    {
      dim += 3;

      if (dim > MAX_PARTICLE_NUMBER) 
      {
        dim = MAX_PARTICLE_NUMBER;
      }
    }

    for (int i = 0; i < dim; i++)
    {
      particles[i].render();

      if (particles[i].removable == true)
      {
        int rndseed = cindex % 465;
        cindex++;
        particles[i] = new RoseParticle(i, superColor[rndseed], seed);
      }
    }
  }
}

class RoseParticle
{
  int id;
  int col;

  float t0;
  float speed;
  float lifetime;
  float lifetimeMax;

  boolean removable;

  public RoseParticle (int _id, int _col, float _s)
  {
    id = _id;
    col = _col;

    lifetime = 0;
    lifetimeMax = 3600 * random(0.5, 2);

    speed = 2 * PI * MAX_PARTICLE_NUMBER / 1800000;
    removable = false;

    t0 = -(1800000 * _s) / (float) height;
  }

  void render()
  {
    /* 
     Rose Equation Cartesian parametric equations
     x = sin(t) * cos(kt)
     y = cos(t) * cos(kt)
     */

    lifetime++;

    if (lifetime >= lifetimeMax)
    {
      removable = true;
    }

    float t = (millis() * 0.001 - t0) * speed;

    float r = id / (float) MAX_PARTICLE_NUMBER;
    int counter = int(t / 1800000);
    if ((counter & 1) == 0)
    {
      r = 1 - r;
    }

    float k = t * r; 

    float len = 0.309 * id * height / (float) MAX_PARTICLE_NUMBER;

    float x = (width / 2 + len * sin(k) * cos(k * t));
    float y = (height / 2 + len * cos(k) * cos(k * t));

    stroke(color(red(col), green(col), blue(col), 180));
    strokeWeight(max(2, len * 0.05));
    point(x, y);
  }
}

class PhysicSystem extends SimpleParticleSystem
{
  ArrayList<PhysicParticle> particles = new ArrayList<PhysicParticle>();

  public PhysicSystem () 
  {
  }

  void render(float frq)
  {
    boolean electric = false;

    if (frq > 2) 
    {
      int number = int(frq * noise(millis() * 0.005));
      for (int i = 0; i < number; i++) 
      {
        if (particles.size() < MAX_PARTICLE_NUMBER)
        {
          particles.add(new PhysicParticle( frq ));
        }
      }
    }

    if (frq > 3)
    {
      electric = true;
    }

    for (int i = 0; i < particles.size(); i++) 
    {
      particles.get(i).render(electric);
    }

    for (int i = 0; i < particles.size(); i++) 
    {
      PhysicParticle tmp = particles.get(i);
      if (tmp.removable == true) 
      {
        particles.remove(i);
      }
    }
  }
}

class PhysicParticle 
{
  PVector loc;

  PVector speed = new PVector();
  PVector acc = new PVector();

  int col;
  float rad;

  float angle;

  float lifetime;
  float lifetimeMax;

  float frictionAcc;
  float frictionSpeed;

  boolean removable = false;

  public PhysicParticle (float frq) 
  {
    loc = new PVector(width / 2, height / 2);

    lifetime = 0;
    lifetimeMax = 80 * random(0.8, 1.5);

    rad = max(1, noise(millis() * 0.10, millis() * 0.15) * 3);

    int rndseed = int(random(65535)) % 465;
    col = superColor[rndseed];

    float force = max(frq / 32, noise(millis() * 0.15)) * 6;

    angle = random(0, 6.28);
    acc.add(force * cos(angle), force * sin(angle), 0);

    frictionAcc = min(0.9, noise(millis() * 0.005 + 1000) + 0.4);
    frictionSpeed = min(0.9, 0.4 + noise(millis() * 0.005 + 1000) * 3);
  }

  void render(boolean electric)
  {
    lifetime++;
    if (lifetime >= lifetimeMax)
    {
      removable = true;
    }

    acc.mult(frictionAcc);
    speed.mult(frictionSpeed);
    speed.add(acc);
    loc.add(speed);

    stroke(color(red(col), green(col), blue(col), 255 * (1 - lifetime / lifetimeMax)));
    strokeWeight( 2 * rad * (1 + 2 * lifetime * log(lifetime) / lifetimeMax));
    point(loc.x, loc.y);

    if (electric != false) 
    {
      strokeWeight(0.5);
      float numSteps = 6;
      float lx = width/2;
      float ly = height/2;   
      int i = 0;
      while (i < numSteps && abs (lx - loc.x) > 10 || abs(ly - loc.y) > 10)
      {
        float x = lx + (this.loc.x - lx) / numSteps  + random(-9, 9);
        float y = ly + (this.loc.y - ly) / numSteps + random(-9, 9);
        stroke(52, 152, 219, 90);
        line(lx, ly, x, y);
        lx = x;
        ly = y;
        i++;
      }
    }
  }
}

class Timer 
{
  int totalTime;
  boolean isFire;

  int time;
  int lasttime;

  Timer(int tempTotalTime)
  {
    totalTime = tempTotalTime;
    isFire = false;
    time = 0;
  }

  void start() 
  {
    time = 0;
    lasttime = millis();
    isFire = true;
  }

  boolean isFinished()
  { 

    if (isFire == false) 
    {
      return false;
    }

    int deltatime = millis() - lasttime;

    time = time + deltatime;

    lasttime = millis();

    if (time > totalTime) 
    {
      isFire = false;
      return true;
    }
    else
    {
      return false;
    }
  }
}

