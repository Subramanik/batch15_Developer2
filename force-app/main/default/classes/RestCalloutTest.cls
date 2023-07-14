/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-14-2023
 * @last modified by  : Subramani Kumarasamy
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