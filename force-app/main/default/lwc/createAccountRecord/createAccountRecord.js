import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';


export default class CreateAccountRecord extends LightningElement {

    industryPicklistValues =[];

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountInfo;

    @wire(getPicklistValues, { recordTypeId: '$accountInfo.data.defaultRecordTypeId', fieldApiName: INDUSTRY_FIELD })
    insdustryPicklistHandler({data,error}){
        if(data){
            console.log('Create Account Record');
            console.log(data);
            this.industryPicklistValues = data.values;
        }
    }

}