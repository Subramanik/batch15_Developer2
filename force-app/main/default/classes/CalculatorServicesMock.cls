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
public class CalculatorServicesMock implements WebServiceMock{

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
        System.debug('requestName: '+requestName);
        //Set dummy response - addition
        if(requestName == 'doAdd'){
            calculatorServices.doAddResponse response_add = new calculatorServices.doAddResponse();
            response_add.return_x = 100;
            responseMap.put('response_x', response_add);
        }
        if(requestName == 'doSubtract'){
            calculatorServices.doSubtractResponse response_sub = new calculatorServices.doSubtractResponse();
            response_sub.return_x = 50;
            responseMap.put('response_x', response_sub);
        }
        if(requestName == 'doMultiply'){
            calculatorServices.doMultiplyResponse response_mul = new calculatorServices.doMultiplyResponse();
            response_mul.return_x = 100;
            responseMap.put('response_x', response_mul);
        }
        if(requestName == 'doDivide'){
            calculatorServices.doDivideResponse response_div = new calculatorServices.doDivideResponse();
            response_div.return_x = 10;
            responseMap.put('response_x', response_div);
        }
    }
}