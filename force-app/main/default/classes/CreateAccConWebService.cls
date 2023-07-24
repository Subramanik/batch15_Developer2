/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-24-2023
 * @last modified by  : Subramani Kumarasamy
**/

/**
 * USE CASE: 3rd Party System will send us Account and Contact info on the same request, we need to first create account and then create contact linked to that account. Return Success/Failure Message
 * End Point : baseUrl/services/apexrest/CreateAccouuntContactRecord
 * Method : POST
 */

 /**
 * Steps to create Inbound REST Web Service in salesforce:
    1. Create a class and annotate the class with @RestResource(urlMapping='/MyRestService/*')
    2. Create a method and annotate the method with @HttpGet or @HttpPost or @HttpDelete or @HttpPut or @HttpPatch
    3. Get the Request
      a. RestRequest Object
      b. Parameters - Don't need to deserialize them
      c. Wrapper Class (Advanced)
   4. Process the request
   5. Send the response.
**/
@RestResource(urlMapping='/CreateAccountContactRecord/*')
global class CreateAccConWebService {

    @HttpPost
    global static ResponseWrapper createAccConRecord(){

        // Get the Request
        RestRequest request = RestContext.request;
        //Get the body
        Blob blobBody= request.requestBody;
        //Convert the blob into String
        String reqBody = blobBody.toString();
        //Use JSON class and wrapper class to deserialize
        RequestWrapper requestData = (RequestWrapper)JSON.deserialize(reqBody, RequestWrapper.Class);

        //Process the request
        // Insert Account
        Account acc = new Account();
        acc.Name = requestData.accountData.name;
        acc.Phone = requestData.accountData.phone;
        insert acc;

        //Create Contact
        Contact con = new Contact();
        con.FirstName = requestData.contactData.firstName;
        con.LastName = requestData.contactData.lastName;
        con.Email = requestData.contactData.email;
        con.AccountId= acc.Id;
        insert con;

        //Send the repsonse
        ResponseWrapper response = new ResponseWrapper();
        response.success= true;
        response.message = 'Record Created successfully!';

        return response;
    }


    global class ResponseWrapper{
        public Boolean success {get;set;}
	    public String message {get;set;}
    }

    global class RequestWrapper{
        public AccountData accountData {get;set;}
        public ContactData contactData {get;set;}
    }

    global class AccountData{
        public string name {get;set;}
        public string phone {get;set;}
    }

    global class ContactData{
        public String firstName {get;set;}
		public String lastName {get;set;}	
		public String email {get;set;}
    }

    
}
