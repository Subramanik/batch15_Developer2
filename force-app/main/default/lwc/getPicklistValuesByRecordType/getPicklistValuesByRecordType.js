import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetPicklistValuesByRecordType extends LightningElement {

    industryPicklistValues = [];
    typePicklistValues = [];
    industryValue;
    typeValue;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accInfo;

    @wire(getPicklistValuesByRecordType, { objectApiName: ACCOUNT_OBJECT, recordTypeId: '$accInfo.data.defaultRecordTypeId' })
    picklistHandler({data,error}){
        if(data){
            console.log(data);
            this.industryPicklistValues = data.picklistFieldValues.Industry.values;
            this.typePicklistValues = data.picklistFieldValues.Type.values;
        }
        if(error){
            console.error(error);
        }
    }

    handleChange(event){
        if(event.target.name === 'industry'){
            this.industryValue= event.target.value;
        }else{
            this.typeValue= event.target.value;
        }
    }

}