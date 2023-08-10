import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { createRecord } from 'lightning/uiRecordApi';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateAccountRecord extends LightningElement {

    industryPicklistValues =[];
    accInputData ={};

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

    handleChange(event){
        const value = event.target.value;
        const name = event.target.name;
        this.accInputData[name] = value;
        console.log(JSON.stringify(this.accInputData));

    }

    handleSave(){
        //prepare the parameter for createRecord method.
        const recordInput = {
            apiName : ACCOUNT_OBJECT.objectApiName,
            fields: this.accInputData
        };

        createRecord(recordInput)
            .then(result => {
                this.createToastEvent('Success','Account Created Successfully','success');
                //this.template.querySelector("form.accountForm").reset();
                //this.template.querySelector("lightning-combobox").value= undefined;
                //Advanced feature in LWC
                this.handleCancel();
            })
            .catch(error => {
                this.createToastEvent('Error', 'Failed to create the record '+ error.body.message, 'error');
            })
    }

    createToastEvent(title, message, variant){
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }

    handleCancel(){
        this.refs.accForm.reset();
        this.refs.combobox.value = undefined;
    }

}