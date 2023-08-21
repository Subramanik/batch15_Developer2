import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_NAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import getOpptyByStage from '@salesforce/apex/OpportunityController.getOpptyByStage';

const COLUMNS = [
    { label: 'Opportunity Name', fieldName: 'Name' },
    { label: 'Stage Name', fieldName: 'StageName'},
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
]

export default class P2cActionAtParentSearchOpptyParent extends LightningElement {
    StageOptions;
    selectedStage;
    oppColumns= COLUMNS;
    oppData;
    error;

    @wire(getObjectInfo, { objectApiName: OPPORTUNITY_OBJECT })
    oppInfo;

    @wire(getPicklistValues, { recordTypeId: '$oppInfo.data.defaultRecordTypeId', fieldApiName: STAGE_NAME_FIELD })
    stagePicklistHandler({ data, error}){
        if(data){
            this.StageOptions = data.values;
        }
        if(error){
            console.log(error);
        }
    }

    handleChange(event){
        this.selectedStage = event.target.value;

        getOpptyByStage({ selectedStage : this.selectedStage })
            .then(result => {
                this.oppData = result;
            })
            .catch(error => {
                this.error = error;
            })
    }

}