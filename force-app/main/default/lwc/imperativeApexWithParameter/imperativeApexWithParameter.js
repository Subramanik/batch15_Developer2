import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import getOpptyByStage from '@salesforce/apex/OpportunityController.getOpptyByStage';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Stage Name', fieldName: 'StageName' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
];

export default class ImperativeApexWithParameter extends LightningElement {
    opptyStageOptions = [];
    selectedStage;
    opptyData;
    columns = COLUMNS;
    @wire(getObjectInfo, { objectApiName: OPPORTUNITY_OBJECT })
    opptyInfo;

    @wire(getPicklistValues, { recordTypeId: '$opptyInfo.data.defaultRecordTypeId', fieldApiName: STAGENAME_FIELD })
    opptyStageHandler({ data, error}){
        if(data){
            this.opptyStageOptions = data.values;
        }
        if(error){
            console.log(error);
        }
    }

    handleChange(event){
        this.selectedStage = event.target.value;
        getOpptyByStage({ selectedStage : this.selectedStage})
            .then(result => {
                console.log(result);
                this.opptyData = result;
            })
            .catch(error => {
                console.log(error);
            })
    }


    

}