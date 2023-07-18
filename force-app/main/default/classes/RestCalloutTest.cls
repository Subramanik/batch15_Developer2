/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-18-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
 * Steps to write test class for REST Outbound callout classes and its wrapper classes
    1. Create a mock response class that implements HttpCalloutMock interface.
        1.a. Create repsond method that returns HttpsResponse.
        1.b. Set dummy response, body, status code and status.
    2. Create a test class.
        2.a. Set the mock callout class.
        2.b. Test the callout.
        2.c. Verify the response.
**/
@isTest
public with sharing class RestCalloutTest {
    //Step 3: Create a test class and test the callout using the mock class. (Assert)

    @isTest
    public static void getAnimalTest(){

        //1. Set the Mock Callout class
        RestCalloutMock mock = new RestCalloutMock();
        Test.setMock(HttpCalloutMock.Class, mock);

        //2. Test the callout
        HttpResponse response = RestCallout.getAnimal();

        //3. Verify reponse received using Assert Statements
        System.assertEquals(200, response.getStatusCode(), 'Expected response Code is 200 but received '+response.getStatusCode());
        System.assertEquals('OK', response.getStatus(), 'Expected response status is not matched');
        System.assertEquals('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}', response.getBody(), 'Expected response body is not matched');
    }
}