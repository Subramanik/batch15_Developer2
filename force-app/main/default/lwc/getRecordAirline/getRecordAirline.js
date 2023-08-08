import { LightningElement,wire } from 'lwc';
import { getRecord ,getFieldValue,getFieldDisplayValue} from 'lightning/uiRecordApi';
import AIR_ID_FIELD from '@salesforce/schema/Airline__c.Name';
import COUNTRY_FIELD from '@salesforce/schema/Airline__c.Country__c';
import ESTB_FIELD from '@salesforce/schema/Airline__c.Established__c';
import HEAD_QUARTER_FIELD from '@salesforce/schema/Airline__c.Head_Quarters__c';
import NAME_FIELD from '@salesforce/schema/Airline__c.Name__c';

export default class GetRecordAirline extends LightningElement {

    recordId= "a002t00000WIfPgAAL";
    airlineData;

    @wire(getRecord, { recordId: '$recordId', fields: [AIR_ID_FIELD, COUNTRY_FIELD, ESTB_FIELD, HEAD_QUARTER_FIELD, NAME_FIELD]})
    airlineInfoHandler({data,error}){
        if(data){
            console.log(data);
            this.airlineData= data;
        }
    }

    get airId() {
        return getFieldValue(this.airlineData, AIR_ID_FIELD);
    }
    get name() {
        return getFieldValue(this.airlineData, NAME_FIELD);
    }
    get country() {
        return getFieldValue(this.airlineData, COUNTRY_FIELD);
    }
    get estb() {
        return getFieldValue(this.airlineData, ESTB_FIELD);
    }
    get headQuarter() {
        return getFieldValue(this.airlineData, HEAD_QUARTER_FIELD);
    }



}