/**March 4th.
	 * Authored: Ale Bisiani and Het Parikh
	 */

package GUI;

import javax.swing.*;

public abstract class Form extends JFrame{

	
	private static final long serialVersionUID = 1L;
	private int backgroundColor 	= 0;
	private int xSize 				= 0;
	private int ySize 				= 0;
	//SHOULD BE A TEXTFIELD OR OTHER FORM ELEMENT
	private String title 			= null;
	private JButton LogoutButton 	= null;
	private User user 				= null;
	
	public Form(){
		
	}
	
	//get and set horizontal window size
	public int getxSize(){
		return xSize;
	}
	public void setxSize(int x){
		xSize = x;
	}
	//get and set vertical window size
	public int getySize(){
		return ySize;
	}
	public void setySize(int y){
		ySize = y;
	}
	
	public void destroy(){
		
	}
}
