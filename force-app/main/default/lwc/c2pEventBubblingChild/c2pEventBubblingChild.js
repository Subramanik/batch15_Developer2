import { LightningElement } from 'lwc';

export default class C2pEventBubblingChild extends LightningElement {

    handleClick(){
        console.log('CHID COMPONENT: Before dispatching the event');
        //1. create a custom event

        // Default Behaviour: (bubbles: false, composed: false)
        // It will reach parent and its DOM- { bubbles: true, composed: false}
        // It will reach parent and its DOM, also grand parent and its DOM- { bubbles: true, composed: true}
        // Invalid Combo: {bubbles: false, composed: true}
        const custEvent = new CustomEvent('mycustomevent', {
            bubbles: false,
            composed: true
        });

        //2. publish/dispatch the event
        this.dispatchEvent(custEvent);
        console.log('CHILD COMPONENT: After dispatching the event');
    }

}