import { LightningElement } from 'lwc';
import signIn from './signIn.html';
import signUp from './signUp.html';
import defaultPage from './lifecycleHooksRender.html';

export default class LifecycleHooksRender extends LightningElement {

    selectedOption;

    clickHandler(event){
        this.selectedOption = event.target.label;
    }

    render(){
        return this.selectedOption === 'SignIn' ? signIn : this.selectedOption=== 'SignUp' ? signUp : defaultPage;
    }

}