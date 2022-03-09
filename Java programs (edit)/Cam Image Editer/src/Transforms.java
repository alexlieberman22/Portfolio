public class  Transforms implements ImageInterface {
    
    PictureLibrary pic;
    int width = 0;
    int height= 0;
    int [][] data;
    
    public Transforms(){
        pic = new PictureLibrary();
    }
    
    
    @Override
    public void readImage(String inFile) {
        try {
            pic.readPGM(inFile);
            height= pic.getHeight();
            width= pic.getWidth();
            data= pic.getData();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    
    @Override
    public void writeImage(String outFile) {
        pic.setData(data);
        try {
            pic.writePGM(outFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    
    @Override
    public int[][] imageData() {
        return data;
    }


    @Override
    public void decode() {
        int upper, lower;
    	
        for (int i=0; i< data.length; i++){
            for(int j=0; j< data[0].length ; j++){
        		upper= data[i][j]/ 16;
        		lower= data[i][j]% 16;
        		upper= 15- upper;
        		data[i][j]= (upper * 16) + lower; 
        	}
        }
        
    }


    @Override
    public void swap() {
    	int upper, lower, middle;
    	
    	 for (int i=0; i< data.length; i++){
             for(int j=0; j< data[0].length ; j++){
            	 upper= data[i][j] & 0b11000000;
            	 middle= data[i][j] & 0b00111100;
            	 lower= data[i][j] & 0b00000011;
            	 data[i][j]= (lower << 6) | middle | (upper >> 6); 
             }   
         }
        
    }


    @Override
    public void mirror() {
    	int[] temp = new int[data[0].length];
    	
        for (int i=0; i< data.length/2; i++){
        	for(int j=0; j< data[0].length ; j++){
        		temp[j]= data[data.length-1 -i][j];
        		data[data.length-1 -i][j]= data[i][j];	
        	}
        	for(int j=0; j< data[0].length ; j++){
        		data[i][j]= temp[j];	
        	}
        }  
    }	
       

    @Override
    public void exchange() {
    	int row= 10;	
    	int column1= 10;
    	int column2= 310;
    	int rowEnd= 310;
    	int columnEnd1= 160;
    	int columnEnd2= 460;
    	int[][] clip = new int[300][150];
    	

		for (int i=row; i< rowEnd; i++){
        	for(int j=column1; j< columnEnd1; j++){
        		clip[i-row][j-column1]= data[i][j];	
        	}
    	}
		
		for (int i= row; i< rowEnd; i++){
        	for(int j= column2; j< columnEnd2; j++){
        		data[i][j-300]= data[i][j];
        	}
		}
		
		for (int i= row; i< rowEnd; i++){
        	for(int j= column2; j< columnEnd2; j++){
        		data[i][j]= clip[i-row][j-column2];
        	}
		}
    }
    
}
