/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-24-2023
 * @last modified by  : Subramani Kumarasamy
**/
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
    /**
        * Use case: Receive the opportunity info from 3rd party system and create an opportunity and then return the created opportunity Id.
        * Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty
        * Http Method : POST - @httpPost
        * Return : Opportunity ID
    */
    @HttpPost
    global static Id postOppty(){

        //Get the Request
        RestRequest request = RestContext.request;
        //Get the body
        String jsonbody = request.requestBody.toString();
        // Convert JSON into SF Data
        Opportunity oppObj= (Opportunity)JSON.deserialize(jsonbody, Opportunity.class);

        //Process the request
        insert oppObj;
        
        //Send the response
        return oppObj.Id;
    }

    /**
        * Use case: Receive the opportunity info from 3rd party system and UPDATE the opportunity and then return the updated opportunity Info.
        * Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty
        * Http Method : PATCH - @httpPatch
        * Return : Opportunity
    */
    @HttpPatch
    global static Opportunity patchOppty(){

        //Get the request
        RestRequest request = RestContext.request;
        //Get the body
        String jsonbody = request.requestBody.toString();
        // Convert the JSON into SF Data of Opportunity
        Opportunity oppObj = (Opportunity)JSON.deserialize(jsonbody, Opportunity.class);

        //process the request
        update oppObj;

        return oppObj;
    }

    /**
        * Use case: Receive the opportunity info from 3rd party system and UPSERT the opportunity and then return the opportunity.
        * Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty
        * Http Method : PUT - @httpPut
        * Return : Opportunity
        * While receiving the JSON as a parameter, make sure your parameter name is same as the JSON key name. It is also case sensitive.
    */
    @HttpPut
    global static Opportunity putOppty(String id, String name, String stage, Decimal Amount, Date closeDate){

        //Get the request - Not Required
        //Get the body - Not Required

        //Process the request
        Opportunity oppObj = new Opportunity();
        oppObj.Id = id;
        oppObj.Name = name;
        oppObj.StageName = stage;
        oppObj.Amount = Amount;
        oppObj.CloseDate = closeDate;
        upsert oppObj;

        //Send the response
        return oppObj;
    }

    /**
        * Use case: Receive the opportunity ID from 3rd party system and DELETE that opportunity and then return the success message.
        * Endpoint : https://batch-13-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty/0067R00001y07cYQAQ
        * Http Method : DELETE - @httpDelete
        * Return : Opportunity
    */
    @HttpDelete
    global static String deleteOppty(){

        //Get the request
        RestRequest request = RestContext.request;
        //Get the URI
        String URI = request.requestURI;

        //Get the index of first digit of the ID
        Integer startIndexOfId = URI.lastIndexOf('/')+1;
        //Get the ID
        String opptyId = URI.substring(startIndexOfId);

        //Process the request
        try{
            Opportunity oppObj = [SELECT ID FROM Opportunity WHERE ID =:opptyId];
            delete oppObj;
        }catch(Exception ex){
            return ex.getMessage();
        }
        return 'Opportunity Deleted Successfully';
    }

}
