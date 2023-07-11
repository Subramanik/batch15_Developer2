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

    //Endpoint : https://api.instantwebtools.net/v1/airlines/2
    //Method : GET
    public static HttpResponse getAirlines(){

        // Steps to make a REST Outbound Callout
        //1. Prepare the HTTPRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set Endpoint and add remote site setting
        //request.setEndpoint('https://api.instantwebtools.net/v1/airlines/4');
        //1.b. Set Method
        request.setMethod('GET');
        //1.c Set Header
            //1.c.a Set Content-Type - POST, PUT (create/update)
            //1.c.b Set Authorization
        /*
        //1. Authorization : Bearer <token>
        //request.setHeader('Authorization', 'Bearer sk-K6SfyoUhcdJ8wmda679yT3BlbkFJfXpR1lieYob3foBuHw');
        */
        /*
        //2. Authorization : Username and Password
        String username = 'Subramani@test.com';
        String password = 'Test@123';
        //Subramani@test.com:Test@123
        Blob requestBlob = Blob.valueOf(username + ':' + password);
        String encodedValue = EncodingUtil.base64Encode(requestBlob);
        String usernamePassword= 'BASIC'+ encodedValue;
        // BASIC U3VicmFtYW5pQHRlc3QuY29tOlRlc3RAMTIz
        request.setHeader('Authorization', usernamePassword);

        */

        //3. Authorization : Named Credential
        request.setEndpoint('callout:Get_Airline/5');

        //1.d Set Body - POST, PUT
        //2. Prepare the Internet Http
        Http http = new Http();
        //3. Send the HTTPRequest over the internet and get the response
        HttpResponse response = http.send(request);
        //4. Process the HTTPResponse
        System.debug('Response Status Code '+ response.getStatusCode());
        System.debug('Response Body '+ response.getBody());
        if(response.getStatusCode() == 200){
            String jsonResponseBody = response.getBody();
            AirlinesWrapper wrapper = (AirlinesWrapper)JSON.deserialize(jsonResponseBody, AirlinesWrapper.class);
            Airline__c airline = new Airline__c();
            airline.Name= String.valueOf(wrapper.id);
            airline.Name__c= wrapper.name;
            airline.country__c= wrapper.country;
            airline.Head_Quarters__c= wrapper.head_quaters;
            airline.website__c= wrapper.website;
            airline.Logo_URL__c = wrapper.logo;
            airline.Established__c = wrapper.established;
            airline.slogan__c= wrapper.slogan;

            try{
                insert airline;
            }
            catch(Exception ex){
                System.debug('Exception '+ ex.getMessage());
            }
        }
        else{
            System.debug('Response Status Code '+ response.getStatusCode());
            System.debug('Response Body '+ response.getBody());
        }
        return response;
    }
}