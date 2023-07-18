/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-18-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
* Steps to create SOAP Callout:
   1. Get the WSDL file from the SOAP service provider and generate the apex class.
   2. Create an instance for the apex class.
   3. Identify the method to be called/invoked.
   4. Invoke the method and get the response.
**/
public with sharing class SoapCallouts {

    public static String[] parksCallout(String country){

        // Instantiate the SOAP Service Class
        parksServices.ParksImplPort parksService = new parksServices.ParksImplPort();
        // identify the method and invoke it
        String[] parks= parksService.byCountry(country);
        // Process the response.
        return parks;
    }

    public static Double doAddCallout(Double num1, Double num2){

        // Instantiate the SOAP Service Class
        calculatorServices.CalculatorImplPort calculatorService = new calculatorServices.CalculatorImplPort();
        // Identify the Addition callout method and invoke it.
        Double result = calculatorService.doAdd(num1, num2);
        // Process the response.
        System.debug('Addition Result: '+result);
        return result;
    }

    public static Double doSubtractCallout(Double num1, Double num2){
        // Instantiate the SOAP Service Class
        calculatorServices.CalculatorImplPort calculatorService = new calculatorServices.CalculatorImplPort();
        // Identify the Subtraction callout method and invoke it.
        Double result = calculatorService.doSubtract(num1, num2);
        // Process the response.
        System.debug('Subtraction Result: '+result);
        return result;
    }

    public static Double doMultiplyCallout(Double num1, Double num2){
        // Instantiate the SOAP Service Class
        calculatorServices.CalculatorImplPort calculatorService = new calculatorServices.CalculatorImplPort();
        // Identify the Multiplication callout method and invoke it.
        Double result = calculatorService.doMultiply(num1, num2);
        // Process the response.
        System.debug('Multiplication Result: '+result);
        return result;
    }

    public static Double doDivideCallout(Double num1, Double num2){
        // Instantiate the SOAP Service Class
        calculatorServices.CalculatorImplPort calculatorService = new calculatorServices.CalculatorImplPort();
        // Identify the Division callout method and invoke it.
        Double result = calculatorService.doDivide(num1, num2);
        // Process the response.
        System.debug('Division Result: '+result);
        return result;
    }
    
}