import { LightningElement,api } from 'lwc';

export default class P2cCallChildMethodChild extends LightningElement {
    name;
    age;

    @api childMethod(parentName, parentAge){
        this.name = parentName;
        this.age = parentAge
    }
}