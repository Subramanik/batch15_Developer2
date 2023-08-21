import { LightningElement } from 'lwc';

export default class P2cActionAtParent extends LightningElement {

    yourAge;

    handleChange(event){
        this.yourAge = event.target.value;
    }

}