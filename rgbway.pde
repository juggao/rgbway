//
//  RGBWAY: a color version of John Conway's 'Game of Life'
//
//  René Oudeweg 2024
//

int cols, rows;
int[][] grid;
int resolution = 55;

final int WHITE=255;
final int BLACK=0;
final int RED=1;
final int GREEN=2;
final int BLUE=3;
final int YELLOW=4;
final int CYAN=5;
final int MAGENTA=6;
final int ORANGE=7;
final int PURPLE=8;
final int LIME=9;
final int TEAL=10;
final int PINK=11;
final int BROWN=12;
final int MAROON=13;
final int NAVY=14;
final int OLIVE=15;
final int GGRAY=16;
final int LIGHTGRAY=17;
final int DARKGRAY=18;
final int LIGHTRED=19;
final int LIGHTGREEN=20;
final int LIGHTBLUE=21;
final int LIGHTYELLOW=22;
final int LIGHTCYAN=23;
final int LIGHTMAGENTA=24;
final int LIGHTORANGE=25;
final int LIGHTPURPLE=26;
final int LIGHTLIME=27;
final int LIGHTTEAL=28;
final int LIGHTPINK=29;
final int LIGHTBROWN=30;
final int LIGHTMAROON=31;
final int LIGHTNAVY=32;

final int C_RED=37;
final int C_GREEN=38;
final int C_BLUE=39;
final int C_YELLOW=40;
final int C_CYAN=41;
final int C_MAGENTA=42;
final int C_ORANGE=43;
final int C_PURPLE=44;
final int C_LIME=45;
final int C_TEAL=46;
final int C_PINK=47;
final int C_BROWN=48;
final int C_MAROON=49;
final int C_NAVY=50;
final int C_OLIVE=51;
final int C_GGRAY=52;
final int C_LIGHTGRAY=53;
final int C_DARKGRAY=54;
final int C_LIGHTRED=55;
final int C_LIGHTGREEN=56;
final int C_LIGHTBLUE=57;
final int C_LIGHTYELLOW=58;
final int C_LIGHTCYAN=59;
final int C_LIGHTMAGENTA=60;
final int C_LIGHTORANGE=61;
final int C_LIGHTPURPLE=62;
final int C_LIGHTLIME=63;
final int C_LIGHTTEAL=64;
final int C_LIGHTPINK=65;
final int C_LIGHTBROWN=66;
final int C_LIGHTMAROON=67;
final int C_LIGHTNAVY=68;

final int MAXCOLORS=33;

    //    RED: (255, 0, 0)
    //GREEN: (0, 255, 0)
    //BLUE: (0, 0, 255)
    //YELLOW: (255, 255, 0)
    //CYAN: (0, 255, 255)
    //MAGENTA: (255, 0, 255)
    //ORANGE: (255, 165, 0)
    //PURPLE: (128, 0, 128)
    //LIME: (0, 128, 0)
    //TEAL: (0, 128, 128)
    //PINK: (255, 192, 203)
    //BROWN: (165, 42, 42)
    //MAROON: (128, 0, 0)
    //NAVY: (0, 0, 128)
    //OLIVE: (128, 128, 0)
    //GRAY: (128, 128, 128)
    //LIGHTGRAY: (211, 211, 211)
    //DARKGRAY: (169, 169, 169)
    //LIGHTRED: (255, 204, 204)
    //LIGHTGREEN: (144, 238, 144)
    //LIGHTBLUE: (173, 216, 230)
    //LIGHTYELLOW: (255, 255, 224)
    //LIGHTCYAN: (224, 255, 255)
    //LIGHTMAGENTA: (255, 204, 255)
    //LIGHTORANGE: (255, 204, 153)
    //LIGHTPURPLE: (204, 153, 255)
    //LIGHTLIME: (204, 255, 153)
    //LIGHTTEAL: (204, 255, 255)
    //LIGHTPINK: (255, 182, 193)
    //LIGHTBROWN: (210, 180, 140)
    //LIGHTMAROON: (145, 95, 95)
    //LIGHTNAVY: (102, 102, 153)

void setup() 
{
  size(1000, 1000);
  //fullScreen();
  cols = width / resolution;
  rows = height / resolution;
  grid = new int[cols][rows];
  
  //initGlider(grid, 1, 0);
  randomSeed(35);
  randomizeGrid();
}

void initGlider(int[][] grid, int x, int y)
{
  // Initialize the grid with a Glider pattern
  grid[x][y] = randomColor();
  grid[x+1][y+1] = randomColor();
  grid[x-1][y+2] = randomColor();
  grid[x][y+2] = randomColor();
  grid[x+2][y+2] = randomColor();
}

void initToad(int[][] grid, int x, int y)
{
  // Initialize the grid with a Toad pattern
  grid[1][1] = randomColor();
  grid[2][1] = randomColor();
  grid[3][1] = randomColor();
  grid[0][2] = randomColor();
  grid[1][2] = randomColor();
  grid[2][2] = randomColor(); 
}

void initBlinker(int[][] grid, int x, int y)
{
  grid[1][1] = randomColor();
  grid[1][2] = randomColor();
  grid[1][3] = randomColor();
}

void draw() 
{
  background(0);
  drawGrid();
  //drawGlider();
  updateGrid();
}

boolean isColorValue(int v)
{
   if ((v >= RED && v <= LIGHTNAVY) || (v >= C_RED && v <= C_LIGHTNAVY)) {
     return true;
   }
   return false;
}

int randomColor()
{
  int randomNumber = int(random(1,MAXCOLORS));
  return randomNumber;
}

    //Red: Cyan
    //Green: Magenta
    //Blue: Yellow
    //Yellow: Blue
    //Cyan: Red
    //Magenta: Green
    //Orange: Blue
    //Purple: Yellow
    //Lime: Magenta
    //Teal: Red
    //Pink: Green
    //Brown: Cyan
    //Maroon: Cyan
    //Navy: Yellow
    //Olive: Magenta
    //Gray: Inverse Gray
    //LightGray: Inverse LightGray
    //DarkGray: Inverse DarkGray
    //LightRed: Cyan
    //LightGreen: Magenta
    //LightBlue: Yellow
    //LightYellow: Blue
    //LightCyan: Red
    //LightMagenta: Green
    //LightOrange: Blue
    //LightPurple: Yellow
    //LightLime: Magenta
    //LightTeal: Red
    //LightPink: Green
    //LightBrown: Cyan
    //LightMaroon: Cyan
    //LightNavy: Yellow
    
int getComplementColor(int v)
{
  switch(v) {
    case RED:
      return C_RED; 
    case GREEN:
      return C_GREEN;
    case BLUE:
       return C_BLUE;
    case YELLOW:
       return C_YELLOW;
    case CYAN:
       return C_CYAN;
    case MAGENTA:
       return C_MAGENTA; 
    case ORANGE:
      return C_ORANGE;
    case PURPLE:
      return C_PURPLE;
    case LIME:
      return C_LIME;
    case TEAL:
      return C_TEAL;
    case PINK:
      return C_PINK;
    case BROWN:
      return C_BROWN;
    case MAROON:
      return C_MAROON;
    case NAVY:
      return C_NAVY;      
    case OLIVE:
      return C_OLIVE; 
    case GGRAY:
      return C_GGRAY; 
    case LIGHTGRAY:
      return C_LIGHTGRAY;
    case DARKGRAY:
      return C_DARKGRAY;
    case LIGHTRED:
      return C_LIGHTRED;      
    case LIGHTGREEN:
      return C_LIGHTGREEN;      
    case LIGHTBLUE:
      return C_LIGHTBLUE;      
    case LIGHTYELLOW:
      return C_LIGHTYELLOW;
    case LIGHTCYAN:
      return C_LIGHTCYAN;      
    case LIGHTMAGENTA:
      return C_LIGHTMAGENTA;      
    case LIGHTORANGE:
      return C_LIGHTORANGE;      
    case LIGHTPURPLE:
      return C_LIGHTPURPLE;      
    case LIGHTLIME:
      return C_LIGHTLIME;      
    case LIGHTTEAL:
      return C_LIGHTTEAL;      
    case LIGHTPINK:
      return C_LIGHTPINK;      
    case LIGHTBROWN:
      return C_LIGHTBROWN; 
    case LIGHTMAROON:
      return C_LIGHTMAROON;      
    case LIGHTNAVY:
      return C_LIGHTNAVY;      
    
    case C_RED:
      return RED; 
    case C_GREEN:
      return GREEN;
    case C_BLUE:
       return BLUE;
    case C_YELLOW:
       return YELLOW;
    case C_CYAN:
       return CYAN;
    case C_MAGENTA:
       return MAGENTA; 
    case C_ORANGE:
      return ORANGE;
    case C_PURPLE:
      return PURPLE;
    case C_LIME:
      return LIME;
    case C_TEAL:
      return TEAL;
    case C_PINK:
      return PINK;
    case C_BROWN:
      return BROWN;
    case C_MAROON:
      return MAROON;
    case C_NAVY:
      return NAVY;      
    case C_OLIVE:
      return OLIVE; 
    case C_GGRAY:
      return GGRAY; 
    case C_LIGHTGRAY:
      return LIGHTGRAY;
    case C_DARKGRAY:
      return DARKGRAY;
    case C_LIGHTRED:
      return LIGHTRED;      
    case C_LIGHTGREEN:
      return LIGHTGREEN;      
    case C_LIGHTBLUE:
      return LIGHTBLUE;      
    case C_LIGHTYELLOW:
      return LIGHTYELLOW;
    case C_LIGHTCYAN:
      return LIGHTCYAN;      
    case C_LIGHTMAGENTA:
      return LIGHTMAGENTA;      
    case C_LIGHTORANGE:
      return LIGHTORANGE;      
    case C_LIGHTPURPLE:
      return LIGHTPURPLE;      
    case C_LIGHTLIME:
      return LIGHTLIME;      
    case C_LIGHTTEAL:
      return LIGHTTEAL;      
    case C_LIGHTPINK:
      return LIGHTPINK;      
    case C_LIGHTBROWN:
      return LIGHTBROWN; 
    case C_LIGHTMAROON:
      return LIGHTMAROON;      
    case C_LIGHTNAVY:
      return LIGHTNAVY;      
      
    case BLACK:
      return WHITE;
    default:
      return WHITE;
  }
}

void setFill(int v)
{
   switch(v) {
    case RED:
      fill(255, 0, 0); // RED
      break;
    case GREEN:
      fill(0, 255, 0); // GREEN
      break;
    case BLUE:
      fill(0, 0, 255); // BLUE
      break;
    case YELLOW:
      fill(255, 255, 0); // YELLOW
      break;
    case CYAN:
      fill(0, 255, 255); // CYAN
      break;
    case MAGENTA:
      fill(255, 0, 255); // MAGENTA
      break;
    case ORANGE:
      fill(255, 165, 0); // ORANGE
      break;
    case PURPLE:
      fill(128, 0, 128); // PURPLE
      break;
    case LIME:
      fill(0, 128, 0); // LIME
      break;
    case TEAL:
      fill(0, 128, 128); // TEAL
      break;
    case PINK:
      fill(255, 192, 203); // PINK
      break;
    case BROWN:
      fill(165, 42, 42); // BROWN
      break;
    case MAROON:
      fill(128, 0, 0); // MAROON
      break;
    case NAVY:
      fill(0, 0, 128); // NAVY
      break;
    case OLIVE:
      fill(128, 128, 0); // OLIVE
      break;
    case GGRAY:
      fill(128, 128, 128); // GRAY
      break;
    case LIGHTGRAY:
      fill(211, 211, 211); // LIGHTGRAY
      break;
    case DARKGRAY:
      fill(169, 169, 169); // DARKGRAY
      break;
    case LIGHTRED:
      fill(255, 204, 204); // LIGHTRED
      break;
    case LIGHTGREEN:
      fill(144, 238, 144); // LIGHTGREEN
      break;
    case LIGHTBLUE:
      fill(173, 216, 230); // LIGHTBLUE
      break;
    case LIGHTYELLOW:
      fill(255, 255, 224); // LIGHTYELLOW
      break;
    case LIGHTCYAN:
      fill(224, 255, 255); // LIGHTCYAN
      break;
    case LIGHTMAGENTA:
      fill(255, 204, 255); // LIGHTMAGENTA
      break;
    case LIGHTORANGE:
      fill(255, 204, 153); // LIGHTORANGE
      break;
    case LIGHTPURPLE:
      fill(204, 153, 255); // LIGHTPURPLE
      break;
    case LIGHTLIME:
      fill(204, 255, 153); // LIGHTLIME
      break;
    case LIGHTTEAL:
      fill(204, 255, 255); // LIGHTTEAL
      break;
    case LIGHTPINK:
      fill(255, 182, 193); // LIGHTPINK
      break;
    case LIGHTBROWN:
      fill(210, 180, 140); // LIGHTBROWN
      break;
    case LIGHTMAROON:
      fill(145, 95, 95); // LIGHTMAROON
      break;
    case LIGHTNAVY:
      fill(102, 102, 153); // LIGHTNAVY
      break;
    case C_RED:
      fill(255-255, 255-0, 255-0); // RED
      break;
    case C_GREEN:
      fill(255-0, 255-255, 255-0); // GREEN
      break;
    case C_BLUE:
      fill(255-0, 255-0, 255-255); // BLUE
      break;
    case C_YELLOW:
      fill(255-255, 255-255, 255-0); // YELLOW
      break;
    case C_CYAN:
      fill(255-0, 255-255, 255-255); // CYAN
      break;
    case C_MAGENTA:
      fill(255-255, 255-0, 255-255); // MAGENTA
      break;
    case C_ORANGE:
      fill(255-255, 255-165, 255-0); // ORANGE
      break;
    case C_PURPLE:
      fill(255-128, 255-0, 255-128); // PURPLE
      break;
    case C_LIME:
      fill(255-0, 255-128, 255-0); // LIME
      break;
    case C_TEAL:
      fill(255-0, 255-128, 255-128); // TEAL
      break;
    case C_PINK:
      fill(255-255, 255-192, 255-203); // PINK
      break;
    case C_BROWN:
      fill(255-165, 255-42, 255-42); // BROWN
      break;
    case C_MAROON:
      fill(255-128, 255-0, 255-0); // MAROON
      break;
    case C_NAVY:
      fill(255-0, 255-0, 255-128); // NAVY
      break;
    case C_OLIVE:
      fill(255-128, 255-128, 255-0); // OLIVE
      break;
    case C_GGRAY:
      fill(255-128, 255-128, 255-128); // GRAY
      break;
    case C_LIGHTGRAY:
      fill(255-211, 255-211, 255-211); // LIGHTGRAY
      break;
    case C_DARKGRAY:
      fill(255-169, 255-169, 255-169); // DARKGRAY
      break;
    case C_LIGHTRED:
      fill(255-255, 255-204, 255-204); // LIGHTRED
      break;
    case C_LIGHTGREEN:
      fill(255-144, 255-238, 255-144); // LIGHTGREEN
      break;
    case C_LIGHTBLUE:
      fill(255-173, 255-216, 255-230); // LIGHTBLUE
      break;
    case C_LIGHTYELLOW:
      fill(255-255, 255-255, 255-224); // LIGHTYELLOW
      break;
    case C_LIGHTCYAN:
      fill(255-224, 255-255, 255-255); // LIGHTCYAN
      break;
    case C_LIGHTMAGENTA:
      fill(255-255, 255-204, 255-255); // LIGHTMAGENTA
      break;
    case C_LIGHTORANGE:
      fill(255-255, 255-204, 255-153); // LIGHTORANGE
      break;
    case C_LIGHTPURPLE:
      fill(255-204, 255-153, 255-255); // LIGHTPURPLE
      break;
    case C_LIGHTLIME:
      fill(255-204, 255-255, 255-153); // LIGHTLIME
      break;
    case C_LIGHTTEAL:
      fill(255-204, 255-255, 255-255); // LIGHTTEAL
      break;
    case C_LIGHTPINK:
      fill(255-255, 255-182, 255-193); // LIGHTPINK
      break;
    case C_LIGHTBROWN:
      fill(255-210, 255-180, 255-140); // LIGHTBROWN
      break;
    case C_LIGHTMAROON:
      fill(255-145, 255-95, 255-95); // LIGHTMAROON
      break;
    case C_LIGHTNAVY:
      fill(255-102, 255-102, 255-153); // LIGHTNAVY
      break;
    case WHITE:
      fill(255, 255, 255);
      break;
    case BLACK:
      fill(0, 0, 0, 88); // with 88 percent transparency 
      break;
    default:
      fill(255,255,255); // Default to white if index is out of range
      break;
  }
}

void drawGlider()
{
  int[][] next = new int[cols][rows];
  
 // Draw the current generation
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (isColorValue(grid[i][j])) {
        setFill(grid[i][j]);
        noStroke();
        rect(i * resolution, j * resolution, resolution, resolution);
      }
    }
  }
  
  // Generate the next generation
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int neighbors = countNeighbors(grid, i, j);
      if (isColorValue(grid[i][j])) {
        if ((neighbors == 2 || neighbors == 3)) {
          next[i][j] = grid[i][j];
        }
      } else {
         if (neighbors == 3) {
           next[i][j] = RED;
         }
         else {
           next[i][j] = BLACK;
         }
      }
    }
  }
  
  // Copy the next generation to the current grid
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = next[i][j];
    }
  } 
  
}

int countNeighbors(int[][] grid, int x, int y) 
{
  int count = 0;
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int nx = (x + i + cols) % cols;
      int ny = (y + j + rows) % rows;
      if (!(i == 0 && j == 0) && isColorValue(grid[nx][ny])) {
        count++;
      }
    }
  }
  return count;
}

int getFirstNeighborColor(int[][] grid, int x, int y) 
{
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int nx = (x + i + cols) % cols;
      int ny = (y + j + rows) % rows;
      if (!(i == 0 && j == 0) && isColorValue(grid[nx][ny])) {
        return grid[nx][ny];
      }
    }
  }
  return BLACK;
}


void keyPressed() 
{
  if (keyCode == ENTER) {
    randomizeGrid();
  }
  else if (key == 'z') {
    resolution += 5;
    cols = width / resolution;
    rows = height / resolution;
    grid = new int[cols][rows];
    randomizeGrid();
  } else if (key == 'x') {
    resolution -= 5;
    cols = width / resolution;
    rows = height / resolution;
    grid = new int[cols][rows];
    randomizeGrid();
  }
}

void drawGrid() 
{
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * resolution;
      int y = j * resolution;
      setFill(grid[i][j]);
      stroke(0);
      rect(x, y, resolution, resolution);
    }
  }
}

void updateGrid() 
{
   updateGrid_Conway(); 
}


void updateGrid_Conway() 
{
  int[][] next = new int[cols][rows];
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int state = grid[i][j];
      int neighbors = countNeighbors(grid, i, j);
      
      if (state == BLACK && neighbors == 3) {
        next[i][j] = getFirstNeighborColor(grid, i, j);
        next[i][j] = getComplementColor(next[i][j]);
      } else if (isColorValue(state) && (neighbors < 2 || neighbors > 3)) {
        next[i][j] = BLACK;
      } else {
        next[i][j] = state;
      }
    }
  }
  
  grid = next;
}

int getMostFrequentNeighborColor(int x, int y) 
{
  int[] colorCounts = new int[MAXCOLORS]; // Array to store counts of red, green, and blue
  
  // Initialize counts to 0
  for (int i = 0; i < MAXCOLORS; i++) {
    colorCounts[i] = 0;
  }
  
  // Count colors of surrounding neighbors
  for (int dx = -1; dx <= 1; dx++) {
    for (int dy = -1; dy <= 1; dy++) {
      // Ignore the center cell itself
      if (dx == 0 && dy == 0) {
        continue;
      }
      
      // Get neighbor coordinates
      int nx = x + dx;
      int ny = y + dy;
      
      // Check bounds
      if (nx >= 0 && nx < cols && ny >= 0 && ny < rows) {
        int neighborColor = grid[nx][ny];
        colorCounts[neighborColor]++;
      }
    }
  }
  
  // Find the most frequent color
  int mostFrequentColor = 0;
  int maxCount = colorCounts[0];
  
  for (int i = 1; i < MAXCOLORS; i++) {
    if (colorCounts[i] > maxCount) {
      mostFrequentColor = i;
      maxCount = colorCounts[i];
    }
  }
  
  //// Return the color based on the most frequent color
  //if (mostFrequentColor == 1) {
  //  return RED;
  //} else if (mostFrequentColor == 2) {
  //  return GREEN;
  //} else if (mostFrequentColor == 3) {
  //  return BLUE;
  //}
  return mostFrequentColor;
}

//int countNeighbors(int[][] grid, int x, int y) {
//  int sum = 0;
//  for (int i = -1; i < 2; i++) {
//    for (int j = -1; j < 2; j++) {
//      int col = (x + i + cols) % cols;
//      int row = (y + j + rows) % rows;
//      if (grid[col][row] >= RED && grid[col][row] <= BLUE)
//        sum += 1;
//    }
//  }
//  sum -= grid[x][y]%4;
//  return sum;
//}

boolean checkNeighborColour(int x, int y, int colour) 
{
  // Check if any of the neighboring cells have the specified color
  return ((x > 0 && grid[x - 1][y] == colour) || // Left neighbor
         (x < cols - 1 && grid[x + 1][y] == colour) || // Right neighbor
         (y > 0 && grid[x][y - 1] == colour) || // Top neighbor
         (y < rows - 1 && grid[x][y + 1] == colour)); // Bottom neighbor
}

void randomizeGrid() {
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = int(random(2));
    }
  }
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == RED) {
        grid[i][j] = randomColor();
      } else {
        grid[i][j] = BLACK; 
      }
    }
  }
}
