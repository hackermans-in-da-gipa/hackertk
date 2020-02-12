PImage img;
int pixls=13;
int[] pxs = new int[169];
color average;
int x,y,yinc;
JSONArray values;

void setup()
{
  size(710,710);
  background(255);
  noStroke();
  img = loadImage("image720.jpg");
  img.resize(710,710);
   values = new JSONArray();
  for(int i=0;i<pixls;i++)
  { 
    for(int j=0;j<pixls;j++)
    {
      JSONObject clr = new JSONObject();
      color p = img.pixels[((height/pixls)*(j))*(width)+(width/pixls*(i))];
      float r = hue(p);
      float g = saturation(p);
      float b = brightness(p);
       clr.setFloat("r", r);
       clr.setFloat("g", g);
       clr.setFloat("b", b);
       values.setJSONObject(i, clr);
      pxs[i*13+j] = int(r);
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
