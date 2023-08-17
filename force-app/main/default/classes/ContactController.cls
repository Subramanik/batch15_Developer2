/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 08-17-2023
 * @last modified by  : Subramani Kumarasamy
**/
public with sharing class ContactController {

    @AuraEnabled
    public static List<Contact> getContactList(String name){

        if(string.isNotBlank(name)){
            name = '%'+name+'%';
        }
        return [SELECT ID, Name, Email, Phone, Title FROM Contact WHERE Name LIKE  :name];

    }
    
}