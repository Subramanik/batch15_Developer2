import { LightningElement,wire } from 'lwc';
import getLeadByName from '@salesforce/apex/LeadController.getLeadByName';

const COLUMNS =[
    {label: 'First Name', fieldName: 'FirstName', type: 'text'},
    {label: 'Last Name', fieldName: 'LastName', type: 'text'},
    {label: 'Company', fieldName: 'Company', type: 'text'},
    {label: 'Email', fieldName: 'Email', type: 'email'}
]

export default class P2cActionAtParentLeadSearch extends LightningElement {

    searchLead;
    leadList;
    error;
    leadColumns= COLUMNS;

    handleChange(event){
        this.searchLead = event.target.value;

        getLeadByName({ LeadName: this.searchLead})
            .then(result => {
                this.leadList = result;
            })
            .catch(error => {
                this.error = error;
            })
    }

}