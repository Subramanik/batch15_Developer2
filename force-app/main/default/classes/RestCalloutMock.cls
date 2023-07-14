/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-14-2023
 * @last modified by  : Subramani Kumarasamy
**/
@isTest
public with sharing class RestCalloutMock implements HttpCalloutMock{
    // step 1: Create a Mock Class and implement the HttpCalloutMock interface
    // Step 2: Create a fake response inside the respond method.
    // Step 3: Create a test class and test the callout using the mock class. (Assert)

    public HttpResponse respond(HttpRequest request){

        HttpResponse response = new HttpResponse();
        response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
        response.setStatusCode(200);
        response.setStatus('OK');
        
        return response;
    }

}