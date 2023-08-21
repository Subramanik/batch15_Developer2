/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 08-21-2023
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class LeadController {

    @AuraEnabled
    public static List<Lead> getLeadList(){
        return [SELECT ID, FirstName, LastName, Email, Title, Company FROM LEAD ORDER BY CREATEDDATE DESC LIMIT 5];
    }

    @AuraEnabled
    public static List<Lead> getLeadByName(String LeadName){
        if(String.isNotBlank(LeadName)){
            LeadName = '%'+LeadName+'%';
            return [SELECT ID, FirstName, LastName, Email, Title, Company FROM LEAD WHERE NAME LIKE : LeadName];
        }
        return null;
        
    }
    
}