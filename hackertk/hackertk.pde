PImage img;
int pixls=13;
int[] pxs = new int[169];
color average;
int x,y,yinc;

void setup()
{
  size(710,710);
  background(255);
  noStroke();
  img = loadImage("image720.jpg");
  img.resize(710,710);
  for(int i=0;i<pixls;i++)
  { 
    for(int j=0;j<pixls;j++)
    {
      float r = red(img.pixels[((height/pixls)*(j))*(width)+(width/pixls*(i))]);
      float g = green(img.pixels[((height/pixls)*(j))*(width)+(width/pixls*(i))]);
      float b = blue(img.pixels[((height/pixls)*(j))*(width)+(width/pixls*(i))]);
      pxs[i*13+j] = int(r);
    }
  }
  printArray(pxs);
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
