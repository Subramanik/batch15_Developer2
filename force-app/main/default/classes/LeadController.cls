/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 08-15-2023
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class LeadController {

    @AuraEnabled
    public static List<Lead> getLeadList(){
        return [SELECT ID, FirstName, LastName, Email, Title, Company FROM LEAD ORDER BY CREATEDDATE DESC LIMIT 5];
    }
    
}