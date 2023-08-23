import { LightningElement } from 'lwc';

export default class C2pSimpleEventParent extends LightningElement {
    counter =0;

    handleSubtract(){
        this.counter--;
    }

    handleAdd(){
        this.counter++;
    }
}