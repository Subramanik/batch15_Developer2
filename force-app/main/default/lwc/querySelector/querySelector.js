import { LightningElement } from 'lwc';

export default class QuerySelector extends LightningElement {


    favoriteFruit = ['Apple', 'Banana', 'Orange', 'Mango', 'Grapes'];

    handleClick(){

        const h1element = this.template.querySelector('h1');
        h1element.style.color ="red";
        h1element.style.background ="blue";

        const pelement = this.template.querySelector('p');
        pelement.style.color ="green";
        pelement.style.background ="yellow";

        const divElement = this.template.querySelectorAll('div.fruit');
        divElement.forEach(element => {
            element.style.color ="white";
            element.style.background ="black";
        })

    }

}