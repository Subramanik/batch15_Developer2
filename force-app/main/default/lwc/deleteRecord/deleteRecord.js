import { LightningElement,wire } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class DeleteRecord extends LightningElement {

    recordId;

    handleChange(event){
        this.recordId = event.target.value;
    }

    handleClick(){
        deleteRecord(this.recordId)
            .then(() => {
                this.createToastMessage('Success','Record deleted successfully','success');
            })
            .catch(error => {
                this.createToastMessage('Error','Record deleted '+error.body.message,'error');
            })
    }

    createToastMessage(title,message,variant){
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }
}