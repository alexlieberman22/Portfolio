
public class P6 {

		// Class variables
	    public static Maze maze;
	    public static int mazeWidth;
	    public static int mazeHeight;

	    public static void main(String[] args) {

	        // Create maze
	        String fileName = "HardMaze.txt";
	        System.err.println("Maze name: " + fileName);

	        // Get dimensions
	        maze = new Maze(fileName);
	        mazeWidth = maze.getWidth();
	        mazeHeight = maze.getHeight();
	        System.err.println("Maze width: " + mazeWidth);
	        System.err.println("Maze height: " + mazeHeight);
	        
	        
	        while(true){
	        	
	        	while(maze.getColumn() < mazeWidth-1){
	        	
	        		if (maze.moveRight() == false){
	        			maze.moveDown();
	        			maze.moveRight();
	        			maze.moveRight();
	        			maze.moveUp();
	        		}
	        	}
	        	
	        	maze.moveDown();
	        	
	        	while(maze.getColumn() > 0){
		       
	        		if (maze.moveLeft() == false){
	        			maze.moveDown();
	        			maze.moveLeft();
	        			maze.moveLeft();
	        			maze.moveUp();
	        		}
	        	}
	        	
	        	maze.moveDown();
	        }
	        
	    }
}   




