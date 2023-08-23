import { LightningElement } from 'lwc';

export default class P2cProgressBarParent extends LightningElement {

    selectedValue;
    selectedSize;

    get barOptions() {
        return [
            { label: 'Small', value: 'small' },
            { label: 'Medium', value: 'medium' },
            { label: 'Large', value: 'large' },
        ];
    }

    handleChange(event){
        
        if(event.target.type === 'number'){
            this.selectedValue = event.target.value;
        }else{
            this.selectedSize = event.target.value;
        }
    }

    handleReset(){
        this.selectedValue = 50;
        this.selectedSize = 'medium';
        let childCmp= this.template.querySelector('c-p2c-progress-bar-child');
        childCmp.childResetMethod();
    }

}