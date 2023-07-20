/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-20-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
 * Steps to write test class for REST Outbound callout classes and its wrapper classes
    1. Create a mock response class that implements HttpCalloutMock interface.
        1.a. Create repsond() method that returns HttpsResponse.
        1.b. Set dummy response, body, status code and status.
    2. Create a test class.
        2.a. use Test.setMock to set the mock callout class.
        2.b. Make the callout.
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

        //2. Make the callout
        HttpResponse response = RestCallout.getAnimal();

        //3. Verify received  reponse using Assert Statements
        System.assertEquals(200, response.getStatusCode(), 'Expected response Code is 200 but received '+response.getStatusCode());
        System.assertEquals('OK', response.getStatus(), 'Expected response status is not matched');
        System.assertEquals('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}', response.getBody(), 'Expected response body is not matched');
    }

    @isTest
    public static void getAirlineTest(){
        //1. Set the Mock Callout class
        Test.setMock(HttpCalloutMock.Class, new RestCalloutMock());

        //2. Make the callout
        HttpResponse response = RestCallout.getAirlines();

        //3. Verify received reponse using Assert Statements
        System.assertEquals(200, response.getStatusCode(), 'Status Code is not matched');
        System.assertEquals('{"id":5,"name":"Sri Lankan Airways 667","country":"Sri Lanka","logo":"https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png","slogan":"From Sri Lanka","head_quaters":"Katunayake, Sri Lanka","website":"www.srilankaairways.com","established":"1990"}', response.getBody(), 'Body is not matched');
        Airline__c airline = [SELECT ID, Name FROM Airline__c LIMIT 1];
        System.assertEquals('5', airline.Name, 'Name is not matched');
    }

    @isTest
    public static void getEmployeeTest(){
        //1. Set the Mock Callout class
        Test.setMock(HttpCalloutMock.Class, new RestCalloutMock());

        //2. Make the callout
        HttpResponse response = RestCallout.getEmployees();

        //3. Verify received reponse using Assert Statements
        System.assertEquals(200, response.getStatusCode(), 'Status Code is not matched');
        System.assertEquals('{"error":0,"msg":"data found","data":[{"id":1,"username":"ebahringer","name":"Braulio Luettgen","email":"kaela.turner@example.net","gender":"Female","designation":"Mean Stack Developer","phone_number":"781.322.7616","complete_address":"298 Edythe Harbors Suite 697 Lake Mathiasburgh, MN 28564-6386"},{"id":2,"username":"moore.samanta","name":"Christian Kessler","email":"summer.koepp@example.com","gender":"Male","designation":"Freelancer","phone_number":"509-549-9565","complete_address":"8947 Howell Mountains South Kavon, VT 89670-8443"}]}', response.getBody(), 'Body is not matched');

        Employees__c employee = [SELECT ID, Name FROM Employees__c WHERE Name ='2' LIMIT 1];
        System.assertEquals('2', employee.Name, 'Name is not matched');
    }

    @isTest
    public static void postObjectTest(){
        //1. Set the Mock Callout class
        Test.setMock(HttpCalloutMock.Class, new RestCalloutMock());

        //2. Make the callout
        HttpResponse response = RestCallout.postObject();

        //3. Verify received reponse using Assert Statements
        System.assertEquals(200, response.getStatusCode(), 'Status Code is not matched');
    }

    @isTest
    public static void postAirlineTest(){
        //1. Set the Mock Callout class
        Test.setMock(HttpCalloutMock.Class, new RestCalloutMock());

        //2. Make the callout
        Test.startTest();
        Airline__c airline = new Airline__c();
        airline.Name = '124';
        airline.Name__c= 'Test Airline';
        airline.Country__c= 'Finland';
        airline.Logo_URL__c= 'https://en.wikipedia.org/wiki/Airplane!#/media/File:Airplane!_(1980_film).jpg';
        airline.Slogan__c= 'Test Slogan';
        airline.Head_Quarters__c= 'Test Head Quaters';
        airline.Website__c= 'https://www.google.com/';
        airline.Established__c= '2023';
        airline.Callout_Status__c = 'Callout Send';
        insert airline;
        Test.stopTest();

        //3. Verify received reponse using Assert Statements
        Airline__c updatedAirline = [SELECT Id, Callout_Status__c FROM Airline__c LIMIT 1];
        System.assertEquals('Callout Pass', updatedAirline.Callout_Status__c, 'Callout Status is not matched');
    }

}