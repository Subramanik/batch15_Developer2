/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 08-15-2023
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class AccountController {

    @AuraEnabled(Cacheable=true)
    public static List<Account> getAccountList(String customerType){
        return [SELECT ID, Name, Type, Industry, Phone, AnnualRevenue FROM ACCOUNT WHERE Type =:customerType LIMIT 5];
    }
    
}