import { LightningElement } from 'lwc';

export default class C2pEventBubblingGrandParent extends LightningElement {

    handleChildEvent(){
        console.log('GRAND PARENT COMPONENT: At parent compoent method');
    }

    handleChildEventDiv1(){
        console.log('GRAND PARENT COMPONENT : At div 1');
    }

}