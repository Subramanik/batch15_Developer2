import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class GetPicklistValues extends LightningElement {

    // Retrive Industry field on the Account dynamically into HTML   
    
    accDefaultRecordTypeId;
    industryPicklistValues = [];
    industryValue;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accInfoHandler({data, error}){
        if(data){
            this.accDefaultRecordTypeId= data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValues, { recordTypeId: '$accDefaultRecordTypeId', fieldApiName: INDUSTRY_FIELD })
    industryPickInfoHandler({data, error}){
        if(data){
            console.log(data);
            this.industryPicklistValues = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    handleChange(event){
        this.industryValue= event.target.value;
    }
}