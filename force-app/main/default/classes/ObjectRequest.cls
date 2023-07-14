/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-14-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class ObjectRequest{
	public String name {get;set;}	//Apple MacBook Pro 16
	public DataDetail data  {get;set;}
	public class DataDetail {
		public Integer year  {get;set;}	//2019
		public Double price  {get;set;}	//1849.99
		public String CPU_model  {get;set;}	//Intel Core i9
		public String Hard_disk_size  {get;set;}	//1 TB
	}
}