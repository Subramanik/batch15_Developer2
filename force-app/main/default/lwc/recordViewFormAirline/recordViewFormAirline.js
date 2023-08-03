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

export default class RecordViewFormAirline extends LightningElement {
    objectApiName= AIRLINE_OBJECT;
    recordId="a002t00000WIfPgAAL";
    fields={
        airIdField: AIR_ID_FIELD,
        nameField: NAME_FIELD,
        countryField: COUNTRY_FIELD,
        estField: ESTB_FIELD,
        headQuaField: HEAD_QUARTER_FIELD,
        sloganField: SLOGAN_FIELD,
        urlField: URL_FIELD,
        logoField: LOGO_FIELD,
    }

}