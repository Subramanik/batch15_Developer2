/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-20-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
 * Steps to create Inbound REST Web Service in salesforce:
    1. Create a class and annotate the class with @RestResource(urlMapping='/MyRestService/*')
    2. Create a method and annotate the method with @HttpGet or @HttpPost or @HttpDelete or @HttpPut or @HttpPatch
    3. Get the Request
      a. RestRequest Object
      b. Parameters
      c. Wrapper Class (Advanced)
   4. Process the request
   5. Send the response.
**/
@RestResource(urlMapping='/Oppty/*')
global class OpptyRESTWebService {

    /**
        * This method is exposing Opportunity record by their Salesforce Id
        * Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty/0067R00001y07cYQAQ
        * Http Method : GET - @httpGet
        * Return : Opportunity Record
    */
    @HttpGet
    global static Opportunity getOpptyById(){

        //Get the Request
        RestRequest request = RestContext.request;
        // Get the URI
        String URI = request.requestURI;

        Integer startIndexOfId = URI.lastIndexOf('/')+1;
        Id opptyId = URI.substring(startIndexOfId);

        //Process the request
        Opportunity oppty = [SELECT Id, Name, Amount, CloseDate, StageName FROM Opportunity WHERE ID =:opptyId];

        //Send the response
        return oppty;
    }
    
}