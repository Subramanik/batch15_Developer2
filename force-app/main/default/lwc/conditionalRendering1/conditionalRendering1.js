import { LightningElement } from 'lwc';

export default class ConditionalRendering1 extends LightningElement {
    showContent=[];
    // If it is not defined, it will considered as false
    // If it is defined as empty array/empty object, it will considered as true
}