import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import AIRLINE_OBJECT from "@salesforce/schema/Airline__c";
import CALLOUT_STATUS_FIELD from '@salesforce/schema/Airline__c.Callout_Status__c';
import { createRecord } from 'lightning/uiRecordApi';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateAirlineRecord extends LightningElement {
    calloutStatusValues =[];
    airlineInputData ={};

    @wire(getObjectInfo, { objectApiName: AIRLINE_OBJECT })
    airlineInfo;

    @wire(getPicklistValues, { recordTypeId: '$airlineInfo.data.defaultRecordTypeId', fieldApiName: CALLOUT_STATUS_FIELD })
    insdustryPicklistHandler({data,error}){
        if(data){
            console.log(data);
            this.calloutStatusValues = data.values;
        }
    }

    handleChange(event){
        const value = event.target.value;
        const name = event.target.name;
        this.airlineInputData[name] = value;
        console.log(JSON.stringify(this.airlineInputData));
    }

    handleSave(){
        //prepare the parameter for createRecord method.
        const recordInput = {
            apiName : AIRLINE_OBJECT.objectApiName,
            fields: this.airlineInputData
        };

        createRecord(recordInput)
            .then(result => {
                this.createToastEvent('Success','Airline Created Successfully','success');
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
        this.refs.airForm.reset();
        this.refs.combobox.value = undefined;
    }
}