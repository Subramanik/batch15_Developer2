import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {

    //Array
    favoriteFoods =["Chicken Biriyani", "Veg Meals", "Mandi", "Kebab", "Shirdan"];

    firstFoodVar = this.favoriteFoods[0];

    num1 = 10;
    num2 = 20;

    //Getter for the first item in the array
    get firstFood(){
        
        return this.favoriteFoods[0];
    }

    get sum(){
        return this.num1  + this.num2;
    }

    get sub(){
        return this.num1  - this.num2;
    }

}