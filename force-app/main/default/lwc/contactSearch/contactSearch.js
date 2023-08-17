import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class ContactSearch extends LightningElement {

    searchName;
    contacts =[];
    error;
    handleChange(event){
        this.searchName = event.target.value;

        getContactList({ name :  this.searchName})
            .then(result => {
                console.log(result);
                this.contacts = result;
            })
            .catch(error => {
                console.log(error);
                this.error= error;
            })
    }
}