/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-11-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class RestCallout {

    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Method: GET
    public static HttpResponse getAnimal(){

        // Steps to make a REST Outbound Callout
        //1. Prepare the HTTPRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set Endpoint
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        //1.b. Set Method
        request.setMethod('GET');
        //1.c Set Header
            //1.c.a Set Content-Type
            //1.c.b Set Authorization
        //1.d Set Body - POST, PUT
        //2. Prepare the Internet Http
        Http http = new Http();
        //3. Send the HTTPRequest over the internet and get the response
        HttpResponse response = http.send(request);
        //4. Process the HTTPResponse
        System.debug('Response Status Code '+ response.getStatusCode());
        System.debug('Response Body '+ response.getBody());
        return response;
    }
    
}