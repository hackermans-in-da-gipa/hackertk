PImage img;
int pixls=13;
int[] pxs = new int[400];
color average;
int x,y,yinc;
JSONArray values;

void setup()
{
  size(580,734);
  background(255);
  noStroke();
  img = loadImage("image720.jpg");
  img.resize(580,734);
   values = new JSONArray();
  for(int i=0;i<pixls;i++)
  { 
    for(int j=0;j<pixls;j++)
    {
      JSONObject clr = new JSONObject();
      color p = img.pixels[((height/pixls)*(j))*(width)+(width/pixls*(i))];
      float h = hue(p);
      float s = saturation(p);
      float l = brightness(p);
       clr.setInt("h", ceil(h/21.25));
       clr.setFloat("s", s);
       clr.setFloat("l", ceil(l/42.5));
       values.setJSONObject(i, clr);
      pxs[i*20+j] = int(h);
    }
  }
  
  saveJSONArray(values, "data/new.json");
  
}
void draw()
{
  background(255,0);
  loadPixels();
  for(int i=0;i<pixls;i++)
  { 
    for(int j=0;j<pixls;j++)
    {
      float r = red(img.pixels[((height/pixls)*(j))*(width)+(width/pixls*(i))]);
      float g = green(img.pixels[((height/pixls)*(j))*(width)+(width/pixls*(i))]);
      float b = blue(img.pixels[((height/pixls)*(j))*(width)+(width/pixls*(i))]);
      fill(r,g,b);
      rect((width/pixls*(i)),(height/pixls)*(j),width/pixls,height/pixls);
      yinc=(height/pixls)*j;
    }
  }
}
