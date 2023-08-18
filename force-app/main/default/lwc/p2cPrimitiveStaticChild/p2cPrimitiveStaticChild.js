import { LightningElement,api } from 'lwc';

export default class P2cPrimitiveStaticChild extends LightningElement {

    @api studentName;
    @api studentAge;
    @api isStudentPassed;
    studentNumber = 1234567890;

}