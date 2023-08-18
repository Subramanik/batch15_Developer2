import { LightningElement } from 'lwc';

export default class P2cPrimitiveDynamicParent extends LightningElement {

    name;
    age;
    isPassed;

    handleChange(event){
        const type = event.target.type;

        if(type === 'text'){
            this.name = event.target.value;
        }
        if(type === 'number'){
            this.age= event.target.value;
        }
        if(type === 'checkbox'){
            this.isPassed = event.target.checked;
        }

    }

}