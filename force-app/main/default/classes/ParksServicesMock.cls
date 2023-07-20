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
public class ParksServicesMock implements WebServiceMock {
    //Create doInvoke() method
    public void doInvoke(Object stub,
                        Object request,
                        Map<String, Object> responseMap,
                        String endpoint,
                        String soapAction,
                        String requestName,
                        String responseNS,
                        String responseName,
                        String responseType){
    // set dummy response
    parksServices.byCountryResponse response_x = new parksServices.byCountryResponse();
    response_x.return_x = new List<String>{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
    responseMap.put('response_x', response_x);
    }
    
}