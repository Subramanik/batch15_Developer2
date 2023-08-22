import { LightningElement } from 'lwc';

export default class P2cCallChildMethodParent extends LightningElement {

    yourName;
    yourAge;

    handleChange(event){
        const type = event.target.type;
        if(type === 'text'){
            this.yourName = event.target.value;
        }
        if(type ==='number'){
            this.yourAge = event.target.value;
        }
    }

    handleClick(){
        // Call the child method from child component and pass your name and age as parameters.
        let childMeth = this.template.querySelector('c-p2c-call-child-method-child');
        childMeth.childMethod(this.yourName, this.yourAge);
    }
}