/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 08-15-2023
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class OpportunityController {

    @AuraEnabled(Cacheable=true)
    public static List<Opportunity> getOpportunityList(){
        return [SELECT ID, Name, StageName, CloseDate, Amount FROM Opportunity LIMIT 5];
    }

    @AuraEnabled
    public static List<Opportunity> getOpptyByStage(String selectedStage){
        return [SELECT ID, Name, StageName, CloseDate, Amount FROM Opportunity WHERE StageName =: selectedStage];   
    }
    
}