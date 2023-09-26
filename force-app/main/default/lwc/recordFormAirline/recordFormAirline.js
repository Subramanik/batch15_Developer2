import { LightningElement } from 'lwc';
import AIRLINE_OBJECT from '@salesforce/schema/Airline__c';
import AIR_ID_FIELD from '@salesforce/schema/Airline__c.Name';
import COUNTRY_FIELD from '@salesforce/schema/Airline__c.Country__c';
import ESTB_FIELD from '@salesforce/schema/Airline__c.Established__c';
import HEAD_QUARTER_FIELD from '@salesforce/schema/Airline__c.Head_Quarters__c';
import NAME_FIELD from '@salesforce/schema/Airline__c.Name__c';
import SLOGAN_FIELD from '@salesforce/schema/Airline__c.Slogan__c';
import URL_FIELD from '@salesforce/schema/Airline__c.Logo_URL__c';
import LOGO_FIELD from '@salesforce/schema/Airline__c.Logo__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordFormAirline extends LightningElement {

    objectApiName= AIRLINE_OBJECT;
    recordId= "a002t00000WIfPgAAL";
    fields= [AIR_ID_FIELD,NAME_FIELD,COUNTRY_FIELD,ESTB_FIELD,HEAD_QUARTER_FIELD,SLOGAN_FIELD,URL_FIELD,LOGO_FIELD];

    successHandler() {
        const event = new ShowToastEvent({ 
            title: 'Success',
            message:'Airline Details are saved successfully',
            variant: 'success'
        });
        this.dispatchEvent(event);
    }
}