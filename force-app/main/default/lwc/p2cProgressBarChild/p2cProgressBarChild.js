import { LightningElement,api } from 'lwc';

export default class P2cProgressBarChild extends LightningElement {

    @api progressValue;
    @api progressSize;

    @api childResetMethod(){
        this.progressValue = 50;
        this.progressSize = 'medium';
    }

}