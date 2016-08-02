package model;

public class Member {
	  private String firstName;
	  private String lastName;
	  private String email;
	  private String mailaddr;
	  private String password1;
	  private String password2;
	  private Integer contactno;
	  private String error;
	  private boolean errorflag;
	  
	public boolean passwordChecker() {
		  	boolean strongPasswd=false;
		  	int len = password1.length();
		    int digit = 0;
		    int lowerCase = 0;
		    int upperCase = 0;
		    int count = 0;

		    char ch;


		      if(len >= 8 && len <= 16)
		      {
		        while(count < len)
		        {
		          ch = password1.charAt(count);
		          if(Character.isDigit(ch))
		          {
		            digit = digit + 1;
		          }
		          if(Character.isLowerCase(ch))
		          {
		            lowerCase = lowerCase + 1;
		          }
		          if(Character.isUpperCase(ch))
		          {
		            upperCase = upperCase + 1;
		          }
		            count = count + 1;
		        }
		      }

		    if(digit >=1 && lowerCase >=1 && upperCase >= 1){
		    	strongPasswd=true;
		    }
		    return strongPasswd;


	  }
	  public boolean validate() {
		  boolean allOk=true;
		  if (firstName.equals("")){
			  error=error+"Please enter your first name\n";
			  firstName="";
			  allOk=false;
		  }
		  if (lastName.equals("")){
			  error=error+"Please enter your last name\n";
			  lastName="";
			  allOk=false;
		  }
		  if (email.equals("") || (email.indexOf('@') == -1) || (email.indexOf('.')==-1)) {
		      error=error+"Please enter a valid email address";
		      email="";
		      allOk=false;
		    }
		  if (mailaddr.equals("")){
			  error=error+"Please enter your mailing address\n";
			  mailaddr="";
			  allOk=false;
		  }
		  if (contactno==0){
			  error=error+"Please enter your contact number\n";
			  contactno=0;
			  allOk=false;
		  }
		  if (password1.equals("") ) {
		      error=error+"Please enter a valid password";
		      password1="";
		      allOk=false;
		    }
		  if (!password1.equals("") && (password2.equals("") || 
		        !password1.equals(password2))) {
		      error=error+"Please confirm your password";
		      password2="";
		      allOk=false;
		    }
		  if (passwordChecker()==false){
			  error=error+"Please enter a password consisting of"
			  		+ " both alphabets and numbers and be of length 8 to 16";
		  }
		  return allOk;
	  }
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMailaddr() {
		return mailaddr;
	}
	public void setMailaddr(String mailaddr) {
		this.mailaddr = mailaddr;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public Integer getContactno() {
		return contactno;
	}
	public void setContactno(Integer contactno) {
		this.contactno = contactno;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public boolean isErrorflag() {
		return errorflag;
	}
	public void setErrorflag(boolean errorflag) {
		this.errorflag = errorflag;
	}
}

