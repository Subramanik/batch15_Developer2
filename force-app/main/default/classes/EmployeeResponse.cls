/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-19-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class EmployeeResponse {
    public Integer error {get; set;}
    public String msg {get; set;}
    public List<EmployeeWrapper> data {get; set;}

    public class EmployeeWrapper{
        public Integer id {get; set;}	//1
		public String username {get; set;}	//ebahringer
		public String name {get; set;}	//Braulio Luettgen
		public String email {get; set;}	//kaela.turner@example.net
		public String gender {get; set;}	//Female
		public String designation {get; set;}	//Mean Stack Developer
		public String phone_number {get; set;}	//781.322.7616
		public String complete_address {get; set;}	
    }
}