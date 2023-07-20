/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-19-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
* Steps to write test class for SOAP Callout:
   1. Create a mock class that implements the WebServiceMock Interface.
      1.a. Create doInvoke() method
      1.b. Set dummy response
   2. Create a test class and annotate the class with @isTest
      2.a. Use Test.setMock() method and pass webServiceMock class and mock class as parameters. //Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());
      2.b. Make the callout.
   3. Verify the response with assertion.
**/
@isTest
public  class SoapCalloutsTest {

    @isTest
    public static void parksCalloutTest(){
        //Use Test.setMock() method and pass webServiceMock class and mock class as parameters.
        Test.setMock(webServiceMock.class, new ParksServicesMock());
        //Make the callout.
        String[] parks = SoapCallouts.parksCallout('India');
        //Verify the response with assertion.
        System.assertEquals(3, parks.size(), 'The number of parks returned is incorrect');
    }

    @isTest
    public static void doAddCalloutTest(){
        //Use Test.setMock() method and pass webServiceMock class and mock class as parameters.
        Test.setMock(webServiceMock.class, new CalculatorServicesMock());
        //Make the callout.
        Double result = SoapCallouts.doAddCallout(50,50);
        //Verify the response with assertion.
        System.assertEquals(100, result, 'The result is incorrect!');
    }

    @isTest
    public static void doSubCalloutTest(){
        //Use Test.setMock() method and pass webServiceMock class and mock class as parameters.
        Test.setMock(webServiceMock.class, new CalculatorServicesMock());
        //Make the callout.
        Double result = SoapCallouts.doSubtractCallout(100, 50);
        //Verify the response with assertion.
        System.assertEquals(50, result, 'The result is incorrect!');
    }
    @isTest
    public static void doMulCalloutTest(){
        //Use Test.setMock() method and pass webServiceMock class and mock class as parameters.
        Test.setMock(webServiceMock.class, new CalculatorServicesMock());
        //Make the callout.
        Double result = SoapCallouts.doMultiplyCallout(10, 10);
        //Verify the response with assertion.
        System.assertEquals(100, result, 'The result is incorrect!');
    }

    @isTest
    public static void doDivCalloutTest(){
        //Use Test.setMock() method and pass webServiceMock class and mock class as parameters.
        Test.setMock(webServiceMock.class, new CalculatorServicesMock());
        //Make the callout.
        Double result = SoapCallouts.doDivideCallout(100, 10);
        //Verify the response with assertion.
        System.assertEquals(10, result, 'The result is incorrect!');
    }

    
}