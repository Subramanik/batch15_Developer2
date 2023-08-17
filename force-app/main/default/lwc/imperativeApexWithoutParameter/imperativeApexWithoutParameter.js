import { LightningElement } from 'lwc';
import getLeadList from '@salesforce/apex/LeadController.getLeadList';


export default class ImperativeApexWithoutParameter extends LightningElement {
    leads;
    error;
    handleClick(){
        getLeadList()
            .then(result => {
                console.log(result);
                this.leads = result;
            })
            .catch(error => {
                console.log(error);
                this.error = error;
            })
    }

}