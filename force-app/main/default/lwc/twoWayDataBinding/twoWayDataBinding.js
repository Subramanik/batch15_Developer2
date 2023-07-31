import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {

    name= "Subramani Kumarasamy";
    age= 18;
    value = 'Architect';

    proOptions = [
            { label: 'Admin', value: 'Admin' },
            { label: 'Developer', value: 'Developer' },
            { label: 'Architect', value:'Architect' }
    ];

    nameChangeHandler(event){
        this.name = event.target.value;
        console.log('Name: '+this.name);
    }

    ageChangeHandler(event){
        this.age = event.target.value;
        console.log('Age: '+this.age);
    }

    handleChange(event){
        this.value = event.target.value;
    }

}