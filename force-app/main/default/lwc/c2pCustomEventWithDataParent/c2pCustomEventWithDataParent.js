import { LightningElement } from 'lwc';

export default class C2pCustomEventWithDataParent extends LightningElement {
    name;
    age;

    handleYourInfo(event){
        console.log('Info from child' +JSON.stringify(event.detail));
        this.name = event.detail.name;
        this.age = event.detail.age;

    }
}