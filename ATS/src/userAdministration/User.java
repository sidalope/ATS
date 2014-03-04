package userAdministration;

public abstract class User {

		private int userID;
		private String role;
		//private String fName;
		//private String lName;
		
		protected User(){
		}
		
		/**
		 *sets and gets userID and role fields. For instantiating a user object with stored data.
		 *
		 *SHOULD THE USER HAVE A UNIQUE USERNAME SEPARATE FROM userID, OR SHOULD userID BE UNIQUE?
		 *SAMAT HAS A USER ID AND A USERNAME.
		*/
		public void setUserID(int id){
			userID = id;
		}
		public int getUserID(){
			return 0;
		}
		public void setUserRole(String role){
			this.role = role;
		}
		public String getUserRole(){
			return null;
		}
		
		
		
}
