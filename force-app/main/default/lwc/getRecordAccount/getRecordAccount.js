import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldDisplayValue,getFieldValue  } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import OWNER_NAME_FIELD from '@salesforce/schema/Account.Owner.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class GetRecordAccount extends LightningElement {

    recordId= "0012t00000TltRCAAZ";
    accountData;

    @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD, INDUSTRY_FIELD, PHONE_FIELD, OWNER_NAME_FIELD, REVENUE_FIELD]})
    accountInfo({data,error}){
        if(data){
            console.log('Get Record Account');
            console.log(data);
            this.accountData= data;
        }
        if(error){
            console.error(error);
        }
    }

    get revenue() {
        return getFieldDisplayValue(this.accountData, REVENUE_FIELD);
    }
    get name() {
        return getFieldValue(this.accountData, NAME_FIELD);
    }
    get industry() {
        return getFieldValue(this.accountData, INDUSTRY_FIELD);
    }
    get phone() {
        return getFieldValue(this.accountData, PHONE_FIELD);
    }
    get ownerName() {
        return getFieldValue(this.accountData, OWNER_NAME_FIELD);
    }
}