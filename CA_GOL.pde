int w = 4 ;
//int columns = int(width/w);
//int rows = int (height/w);

//1_set a random grid made of black and white squares
//2_map 1s and 0s to old_board
//3_depending on some values of old board, update new board
//4_new board becomes old board
//5_draw squares depending on new board


int[][] old_board;
int[][] new_board;
int t = 0;

//var new_board = new int[width/w][height/w];



void setup()
{
  size(800,800);
  background(255);
   //frameRate(0.05);
   frameRate(10);
  
  setgrid(w);
  //updatecells();
  //noLoop();
 
}

void draw()
{
  t++;
  //fill(0);
  //rect(random(0,width),random(0,height),10,10);
  //setgrid(w);
  //fill(200);
  //text(int(frameRate),20,60);
  updatecells();
  //print(t);
  
  
}
void setgrid(int w)
{ 
  int count0 = 0;
  int count1 = 0;
  //print(height);
  //print(columns);
  //print (width/w);
  //print("\n"+rows);
  old_board = new int[width/w][height/w];
  
  for(int i =0; i < width/w; i++)
  {
    for(int j = 0; j< height/w; j++)
    {
      int x = int(random(0,2));
      //print(x);
      //stroke(0);
      if ( x== 0)
      {
        count0++;
       old_board[i][j] = 0;//0 = white
        fill(255);
      }
      else
      {
        count1++;
        old_board[i][j] = 1; // 1 = black
        fill(0);
      }
     rect(w*i,w*j,w,w); 
    }
  }
  //check_neighbours();
  //print("number of zeros : " + count0);
  //print ("number of ones : " + count1);
}

void updatecells()
{ 
  
  new_board = new int[width/w][height/w];
  check_neighbours();
  
    for(int i =1; i < width/w; i++)
  {
    for(int j = 1; j< height/w; j++)
    {
      
      if ( new_board[i][j] == 0)
      {
        //count0++;
       //old_board[i][j] = 0;//0 = white
        fill(0);
      }
      else
      {
        //count1++;
        //old_board[i][j] = 1; // 1 = black
        fill(255);
      }
     rect(w*i,w*j,w,w); 
    }
  }
  old_board = new_board;
  
  
  
  
}
void check_neighbours()
{ 
  for (int i = 1; i < (width/w)-1 ; i++)
  {
    //print ("column " + i );
   for (int j = 1; j< (height/w) -1; j++)
   {
     int count0 = 0;
      int count1 = 0;
    if (old_board[i-1][j] == 0)   
     count0++;    
    else
    count1++;
    if(old_board[i-1][j-1] == 0)
    count0++;
    else
    count1++;
    if (old_board[i-1][j+1] ==0)
    count0++;
    else
    count1++;
    if (old_board[i][j+1] ==0 )
    count0++;
    else
    count1++;
    if ( old_board[i][j-1] == 0)
    count0++;
    else
    count1++;
    if (old_board[i+1][j-1] == 0)
    count0++;
    else
    count1++;
    if(old_board[i+1][j] == 0)
    count0++;
    else count1++;
    if(old_board[i+1][j+1] == 0)
    count0++;
    else
    count1++;
    //print("\nnumber or white cells : "+ count0);
    //print("number of black cells : " + count1);
    /*
    if(count0 >= count1)
    {
     new_board[i][j] = 0; 
    }
    else
    new_board[i][j] = 1;*/
    if(old_board[i][j] == 0 && count0 <2 )
    new_board[i][j] = 1;
    
    else if(old_board[i][j] == 0 && (count0 ==2 || count0 == 3))
    new_board[i][j] = 0;
    
    else if(old_board[i][j] == 0 && count0 > 3)
    new_board[i][j] = 1;
    
    else if(old_board[i][j] == 1 && count0 == 3)
    new_board[i][j] = 0;
    
    else
    new_board[i][j] = old_board[i][j];
    
    
   }
  }
  
}