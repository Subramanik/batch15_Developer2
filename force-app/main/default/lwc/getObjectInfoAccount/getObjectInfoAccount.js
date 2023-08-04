import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetObjectInfoAccount extends LightningElement {

    isCreate;
    defaultRTId;
    accNumFieldLabel;
    accNumFieldApiName;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfoHandler({data,error}) {
        if(data){
            console.log(data);
            this.isCreate= data.createable;
            this.defaultRTId = data.defaultRecordTypeId;
            this.accNumFieldLabel= data.fields.AccountNumber.label;
            this.accNumFieldApiName= data.fields.AccountNumber.apiName;
        }
        if(error){
            console.error(error);
        }

    }
}