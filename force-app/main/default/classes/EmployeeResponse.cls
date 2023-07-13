/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-13-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class EmployeeResponse {
    public Integer error;
    public String msg;
    public List<EmployeeWrapper> data;

    public class EmployeeWrapper{
        public Integer id;	//1
		public String username;	//ebahringer
		public String name;	//Braulio Luettgen
		public String email;	//kaela.turner@example.net
		public String gender;	//Female
		public String designation;	//Mean Stack Developer
		public String phone_number;	//781.322.7616
		public String complete_address;	
    }
}