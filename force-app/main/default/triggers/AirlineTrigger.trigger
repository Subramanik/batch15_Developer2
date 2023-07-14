/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 07-14-2023
 * @last modified by  : Subramani Kumarasamy
**/
trigger AirlineTrigger on Airline__c (after insert) {
    //check the event type
    if(trigger.isAfter && trigger.isInsert){
        // Call @future method for sending the airline details to the external Airline system.
        for(Airline__c airline : trigger.new){
            if(airline.Callout_Status__c == 'Callout Send'){
                RestCallout.postAirlines(airline.Id);
            }
        }
    }

}