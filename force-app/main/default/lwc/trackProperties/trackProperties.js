import { LightningElement, track } from 'lwc';

export default class TrackProperties extends LightningElement {

    //Object
    @track
    location ={
        city: "Helsinki",
        country: "Finland"
    }

    changeHandler(event){
        this.location.city= event.target.value;
    }

}