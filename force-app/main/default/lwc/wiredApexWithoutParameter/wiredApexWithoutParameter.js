import { LightningElement,wire } from 'lwc';
import getOpportunityList from '@salesforce/apex/OpportunityController.getOpportunityList';

const COLUMNS = [
    { label: 'Oppty Name', fieldName: 'Name' },
    { label: 'Stage Name', fieldName: 'StageName'},
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' }
];

export default class WiredApexWithoutParameter extends LightningElement {
    opptyList;
    coumnName = COLUMNS;
    error;
    @wire(getOpportunityList)
    opptyHandler({data,error}){
        if(data){
            console.log(data);
            this.opptyList = data;
        }
        if(error){
            console.log(error);
            this.error = error;
        }
    }
}