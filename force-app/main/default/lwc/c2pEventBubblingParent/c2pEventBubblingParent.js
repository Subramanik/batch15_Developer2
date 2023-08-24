import { LightningElement } from 'lwc';

export default class C2pEventBubblingParent extends LightningElement {

    handleChildEvent(event){
        console.log('PARENT COMPONENT: At child component method');
    }

    handleChildEventAtDiv1(){
        console.log('PARENT COMPONENT: At div 1');
    }

    handleChildEventAtDiv2(){
        console.log('PARENT COMPOENENT: At div 2');
    }

}