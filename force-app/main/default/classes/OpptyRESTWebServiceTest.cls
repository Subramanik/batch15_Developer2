    /**
     * @description       : 
     * @author            : Subramani Kumarasamy
     * @group             : 
     * @last modified on  : 07-24-2023
     * @last modified by  : Subramani Kumarasamy
    **/

    /**
     Steps to write test class for REST Web services:
        1. Prepare the RestRequest - URI, Method, Body
        2. Assign the resuest to RestContext.request
        OR Create the required data (Only for paramterised methods)
        3. Call the Method
        4. Verify the result
    **/
    @isTest
    public class OpptyRESTWebServiceTest {

        @TestSetup
        public static void makeData(){

            Account acc = new Account(Name = 'Test Account');
            insert acc;

            Opportunity opp = new Opportunity(Name = 'Test Opportunity', AccountId= acc.Id, StageName= 'Prospecting', CloseDate= Date.newInstance(2023, 02, 01), Amount= 10000);
            insert Opp;  
        }

        @isTest
        public static void getOpptyTest(){
            // Prepare the RestRequest - URI, Method, Body

            RestRequest req = new RestRequest();

            Opportunity opp = [SELECT ID FROM Opportunity LIMIT 1];
            String baseURL = System.URL.getSalesforceBaseUrl().toExternalForm();
            req.requestURI = baseURL +'/services/apexrest/Oppty/'+opp.Id;
            req.httpMethod = 'GET'; 

            // Assign the resuest to RestContext.request
            RestContext.request = req;

            // Call the Method
            Opportunity oppResult = OpptyRESTWebService.getOpptyById();

            // Verify the response
            System.assertEquals('Test Opportunity', oppResult.Name, 'Name not matched');
            System.assertEquals(10000, oppResult.Amount, 'Amount not matched');
        }

        @isTest
        public static void postOpptyTest(){

            // Prepare the RestRequest - URI, Method, Body

            RestRequest req = new RestRequest();
            req.httpMethod ='POST';

            Opportunity oppty = new Opportunity(Name ='POST Opportunity', StageName='Prospecting', CloseDate= Date.newInstance(2023, 01, 01), Amount = 2000);

            String jsonBody = JSON.serializePretty(oppty);
            req.requestBody = Blob.valueOf(jsonBody);

            // Assign the resuest to RestContext.request
            RestContext.request = req;

            // Call the method
            Id opptyId = OpptyRESTWebService.postOppty();

            // Verify the result
            System.assertNotEquals(null, opptyId, 'Not received Opportunity Id');
        }

        @isTest
        public static void putOpptyTest(){

            //Parameterized Method
            //PUT - First Test Update scenerio:

            Opportunity opp = [SELECT ID FROM Opportunity LIMIT 1];

            //Call the method
            Opportunity oppResultUpdate = OpptyRESTWebService.putOppty(opp.Id, 'Updated Opportunity', 'Prospecting', 20000, Date.newInstance(2024, 01, 01));

            // Verify the resposne
            System.assertEquals('Updated Opportunity', oppResultUpdate.Name, 'Name is not matched');

            //PUT - First Test Insert scenerio:

            //Call the method
            Opportunity oppResultInsert = OpptyRESTWebService.putOppty(null, 'Insert Opportunity', 'Prospecting', 20000, Date.newInstance(2024, 01, 01));

            // Verify the resposne
            System.assertEquals('Insert Opportunity', oppResultInsert.Name, 'Name is not matched');

        }





    
}