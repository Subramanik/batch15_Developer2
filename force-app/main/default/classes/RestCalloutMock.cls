/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-20-2023
 * @last modified by  : Subramani Kumarasamy
**/
@isTest
public with sharing class RestCalloutMock implements HttpCalloutMock{
    // step 1: Create a Mock Class and implement the HttpCalloutMock interface
    // Step 2: Create a fake response inside the respond method.
    // Step 3: Create a test class and test the callout using the mock class. (Assert)

    public HttpResponse respond(HttpRequest request){
        
        if(request.getEndpoint()=='https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod()=='GET'){
            HttpResponse response = new HttpResponse();
            response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
            response.setStatusCode(200);
            response.setStatus('OK');
            return response;
        }else if(request.getEndpoint()=='callout:Get_Airline/5' && request.getMethod()=='GET'){
            HttpResponse response = new HttpResponse();
            response.setBody('{"id":5,"name":"Sri Lankan Airways 667","country":"Sri Lanka","logo":"https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png","slogan":"From Sri Lanka","head_quaters":"Katunayake, Sri Lanka","website":"www.srilankaairways.com","established":"1990"}');
            response.setStatus('OK');
            response.setStatusCode(200);
            return response;
        } else if(request.getEndpoint()=='callout:Employee' && request.getMethod()=='GET'){
            HttpResponse response = new HttpResponse();
            response.setBody('{"error":0,"msg":"data found","data":[{"id":1,"username":"ebahringer","name":"Braulio Luettgen","email":"kaela.turner@example.net","gender":"Female","designation":"Mean Stack Developer","phone_number":"781.322.7616","complete_address":"298 Edythe Harbors Suite 697 Lake Mathiasburgh, MN 28564-6386"},{"id":2,"username":"moore.samanta","name":"Christian Kessler","email":"summer.koepp@example.com","gender":"Male","designation":"Freelancer","phone_number":"509-549-9565","complete_address":"8947 Howell Mountains South Kavon, VT 89670-8443"}]}');
            response.setStatusCode(200);
            response.setStatus('OK');
            return response;
        }else if(request.getEndpoint()== 'callout:Object' && request.getMethod()=='POST'){
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            return response;
        }
        return null;
        
    }

}