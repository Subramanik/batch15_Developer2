import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {

    //String
    name = "Subramani Kumarasamy";
    //Number
    age= 18;
    //Boolean
    isMarried = false;
    //Object
    location = {
        city: "Helsinki",
        country: "Finland",
        postalCode: "00550"
    }
    //Array
    favoriteFoods =["Chicken Biriyani", "Veg Meals", "Sweets", "Chat"];

}