/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-13-2023
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

    //Endpoint: https://api.onlinewebtutorblog.com/employees
    //Method: GET
    public static HttpResponse getEmployees(){

        // Steps to make a REST Outbound Callout
        //1. Prepare the HTTPRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set Endpoint
        request.setEndpoint('callout:Employee');
        //1.b. Set Method
        request.setMethod('GET');
        //1.c Set Header
            //1.c.a Set Content-Type - POST, PUT (create/update)
            //1.c.b Set Authorization
        //1.d Set Body - POST, PUT
        //2. Prepare the Internet Http
        Http http = new Http();
        //3. Send the HTTPRequest over the internet and get the response
        HttpResponse response = http.send(request);
        //4. Process the HTTPResponse
        System.debug('Response Status Code '+ response.getStatusCode());
        System.debug('Response Body '+ response.getBody());
        if(response.getStatusCode()== 200){
            String jsonResponseBody = response.getBody();
            EmployeeResponse empRes = (EmployeeResponse)JSON.deserialize(jsonResponseBody, EmployeeResponse.class);
            System.debug('Employee Response '+ empRes);
            List<EmployeeResponse.EmployeeWrapper> employeesdata = empRes.data;
            List<Employees__C> employeesList = new List<Employees__C>();
            for(EmployeeResponse.EmployeeWrapper wrap : employeesdata){
                Employees__c emp = new Employees__c();
                emp.Name = String.valueOf(wrap.id);
                emp.Name__c = wrap.name;
                emp.User_Name__c = wrap.username;
                emp.Email__c = wrap.email;
                emp.Phone__c = wrap.phone_number;
                emp.Designation__c = wrap.designation;
                emp.Gender__c = wrap.gender;
                emp.Address__c = wrap.complete_address;
                employeesList.add(emp);
            }
            try{
                insert employeesList;
            }
            catch(Exception ex){
                System.debug('Exception '+ ex.getMessage());
            } 
        }
        return response;
    }

    //Endpoint: https://api.restful-api.dev/objects
    //Method: POST
    public static void postObject(){
        // / Steps to make a REST Outbound Callout
        //1. Prepare the HTTPRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set Endpoint
        request.setEndpoint('callout:Object');
        //1.b. Set Method
        request.setMethod('POST');
         //1.c Set Header
            //1.c.a Set Content-Type - POST, PUT (create/update)
        request.setHeader('Content-Type', 'application/json');
            //1.c.b Set Authorization
        //1.d Set Body - POST, PUT
        // 1.d.a Prepare the JSON Body
        ObjectRequest objReq = new ObjectRequest();
        objReq.name= 'Apple 4';
        
        ObjectRequest.DataDetail dataWrap = new ObjectRequest.DataDetail();
        dataWrap.year= 2020;
        dataWrap.price= 2000;
        dataWrap.CPU_model= 'Intel Core i9';
        dataWrap.Hard_disk_size= '1TB';

        objReq.data = dataWrap;
        
        String jsonBody = JSON.serialize(objReq);
        jsonBody = jsonBody.replaceAll('CPU_model', 'CPU model');
        jsonBody = jsonBody.replaceAll('Hard_disk_size','Hard disk size');
        System.debug('jsonBody '+ jsonBody);
        request.setBody(jsonBody);
        //2. Prepare the Internet Http
        Http http = new Http();
        //3. Send the HTTPRequest over the internet and get the response
        HttpResponse response = http.send(request);
        //4. Process the HTTPResponse
        System.debug('Response Status Code '+ response.getStatusCode()); 
        System.debug('Response Body '+ response.getBody());
        if(response.getStatusCode()== 200){
            System.debug('Response Body '+ response.getBody());
        }
        // HomeWork:
        //1. Deserialize the response body
        //2. Print/Debug it each data in the reponse.
    }

    //Endpoint: https://api.instantwebtools.net/v1/airlines
    //Method: POST
    public static void postAirlines(){
        // / Steps to make a REST Outbound Callout
        //1. Prepare the HTTPRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set Endpoint
        request.setEndpoint('callout:Get_Airline');
        //1.b. Set Method
        request.setMethod('POST');
         //1.c Set Header
            //1.c.a Set Content-Type - POST, PUT (create/update)
        request.setHeader('Content-Type', 'application/json');
            //1.c.b Set Authorization
        // 1.d.a Prepare the JSON Body
        Airline__c airline = [SELECT Name, Name__c, country__c, Head_Quarters__c, website__c, Logo_URL__c, Established__c, Slogan__c FROM Airline__c WHERE Id!= NULL AND Callout_Status__c ='Callout Send' LIMIT 1];

        AirlinesWrapper wrapper = new AirlinesWrapper();
        wrapper.id= Integer.valueOf(airline.Name);
        wrapper.name= airline.Name__c;
        wrapper.country= airline.country__c;
        wrapper.head_quaters= airline.Head_Quarters__c;
        wrapper.website= airline.website__c;
        wrapper.logo= airline.Logo_URL__c;
        wrapper.established= airline.Established__c;
        wrapper.slogan= airline.Slogan__c;
        //Serialize the Wrapper
        String jsonBody = JSON.serialize(wrapper);
        //1.d Set Body - POST, PUT
        request.setBody(jsonBody);
        //2. Prepare the Internet Http
        Http http = new Http();
        //3. Send the HTTPRequest over the internet and get the response
        HttpResponse response = http.send(request);
        //4. Process the HTTPResponse
        if(response.getStatusCode()== 200){
            System.debug('Response Body '+ response.getBody());
        }

        //Home Work 2:
        // If it is successful, update the callout status as 'Callout Pass'
        // If it is not successful, update the callout status as 'Callout Fail'
    }
}