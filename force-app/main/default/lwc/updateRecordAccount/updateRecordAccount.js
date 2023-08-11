import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { getRecord, getFieldValue, updateRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import { ShowToastEvent } from "lightning/platformShowToastEvent";



export default class UpdateRecordAccount extends LightningElement {
    industryPicklistValues =[];
    recordId = "0012t00000TltRCAAZ";
    accObj= {};

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountInfo;

    @wire(getPicklistValues, { recordTypeId: "$accountInfo.data.defaultRecordTypeId", fieldApiName: INDUSTRY_FIELD })
    industryPicklistHandler({ data, error}){
        if(data){
            console.log('Update Account Record');
            console.log(data);
            this.industryPicklistValues = data.values;
        }
    }

    @wire(getRecord, {
        recordId: '$recordId',
        fields: [NAME_FIELD, INDUSTRY_FIELD, WEBSITE_FIELD,REVENUE_FIELD]
    })
    accountData;

    get name() {
        return getFieldValue(this.accountData.data, NAME_FIELD);
    }
    get industry() {
        return getFieldValue(this.accountData.data, INDUSTRY_FIELD);
    }
    get website() {
        return getFieldValue(this.accountData.data, WEBSITE_FIELD);
    }
    get annualRevenue() {
        return getFieldValue(this.accountData.data, REVENUE_FIELD);
    }

    handleChange(event){
        const name = event.target.name;
        const value = event.target.value;
        this.accObj[name] = value;
        console.log(JSON.stringify(this.accObj));
    }

    updateHandler(){

        //prepare the parameter to updateRecord Method
        this.accObj["Id"]= this.recordId;
        console.log(JSON.stringify(this.accObj));

        const recordInput ={
            fields : this.accObj
        };
        //Call the updateRecord Method
        updateRecord(recordInput)
            .then(result => {
                console.log('Account Updated Successfully');
                this.createToastEvent('Success', 'Account Updated Successfully', 'success');
            })
            .catch(error =>{
                console.log(error);
                this.createToastEvent('Error', 'Error '+error.body.message, 'error');
            })
        //Dispaly the toast message based on success/error
    }

    createToastEvent(title, message, variant){
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }
}