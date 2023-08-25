import { LightningElement } from 'lwc';

export default class LifeCycleHooksParent extends LightningElement {
    showChild =false;
    constructor(){
        super();
        console.log('Parent Constructor called');
    }

    connectedCallback(){
        console.log('Parent Connected Callback called');
    }

    renderedCallback(){
        console.log('Parent Rendered Callback called');
    }

    disconnectedCallback(){
        console.log('Parent Disconnected Callback called');
    }

    handleClick(){
        console.log('Button Clicked');
        this.showChild = !this.showChild;
    }

}