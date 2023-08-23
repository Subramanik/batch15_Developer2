import { LightningElement } from 'lwc';

export default class C2pCustomEventWithDataChild extends LightningElement {
    yourInfo={};
    handleChange(event){
        this.yourInfo[event.target.name] = event.target.value;
        //{"name": "John", "age": 30};
        //create the event with paramete
        //dispatch/publish the event
        this.dispatchEvent(new CustomEvent('yourinfo', {detail: this.you}))

    }

}