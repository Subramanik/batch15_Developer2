/**
// Steps to create SOAP Callout:
   1. Get the WSDL file from the SOAP service provider and generate the apex class.
   2. Create an instance for the apex class.
   3. Identify the method to be called/invoked.
   4. Invoke the method and get the response.

**/

// SOAP API:

// It uses XML as the data format.
// You need WSDL file.
// You need to whitelist the endpoint URL.


/**
* Steps to write test class for SOAP Callout:
   1. Create a mock class that implements the WebServiceMock Interface.
      1.a. Create doInvoke() method
      1.b. Set dummy response
   2. Create a test class and annotate the class with @isTest
      2.a. Use Test.setMock() method and pass webServiceMock class and mock class as parameters. //est.setMock(WebServiceMock.class, new CalculatorCalloutMock());
      2.b. Make the callout.
   3. Verify the response with assertion.
**/