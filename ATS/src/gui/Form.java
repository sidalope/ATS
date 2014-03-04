/**March 4th.
	 * Authored: Ale Bisiani and Het Parikh
	 */

package gui;

import javax.swing.*;
import dbConnectivity.DBConnection;
import userAdministration.User;


public abstract class Form extends JFrame{

	private static final long serialVersionUID = 1L;
	private int backgroundColor;
	private int xSize;
	private int ySize;
	//TITLE SHOULD BE A TEXTFIELD OR OTHER FORM ELEMENT
	private String title;
	private JButton LogoutButton;
	//ref User object for the session
	public static User user;
	//ref connection object used throughout the session.
	public static DBConnection connection;
	
	private Form(){
		
	}
	
	//get horizontal and vertical window size
	public int getxSize(){
		return xSize;
	}
	public int getySize(){
		return ySize;
	}
	
	//set window size.
	public void setWindowSize(int x, int y){
		xSize = x;
		ySize = y;
	//HOW WILL THIS ACTUALLY RESIZE?
	}
	
	public void destroy(){
		
	}
}
