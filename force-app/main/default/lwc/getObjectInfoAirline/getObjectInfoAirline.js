import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import AIRLINE_OBJECT from '@salesforce/schema/Airline__c';

export default class GetObjectInfoAirline extends LightningElement {
    isCreate;
    defaultRTId;
    sloganFieldLabel;
    sloganFieldApiName;
    masterRTIdOneLine;

    @wire(getObjectInfo, { objectApiName: AIRLINE_OBJECT })
    objectInfoHandler({data,error}) {
        if(data){
            console.log(data);
            this.isCreate= data.createable;
            this.defaultRTId = data.defaultRecordTypeId;
            this.sloganFieldLabel= data.fields.Slogan__c.label;
            this.sloganFieldApiName= data.fields.Slogan__c.apiName;

            // Retrived International Record Type Id
            const rtInfos= data.recordTypeInfos;
            console.log(rtInfos);
            console.log('Object.keys(rtInfos): '+Object.keys(rtInfos));
            console.log('rtInfos[0122t0000008nYqAAI].name : '+rtInfos['0122t0000008nYqAAI'].name);
            this.masterRTIdOneLine = Object.keys(rtInfos).find(item => rtInfos[item].name === 'International');
        }
        if(error){
            console.error(error);
        }

    }

}