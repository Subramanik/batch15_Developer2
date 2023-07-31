import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    showContent=true;

    handleClick(){
        this.showContent =! this.showContent
    }

}