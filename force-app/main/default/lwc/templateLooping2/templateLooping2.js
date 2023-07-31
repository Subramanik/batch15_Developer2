import { LightningElement } from 'lwc';

export default class TemplateLooping2 extends LightningElement {

    products= [
        {
            Id : 1,
            Name : "Apple",
            Price: 100
        },
        {
            Id: 2,
            Name: "Orange",
            Price: 200
        },
        {
            Id: 3,
            Name: "Banana",
            Price: 300
        },
        {
            Id: 4,
            Name: "Karpuz",
            Price: 400
        },
        {
            Id: 5,
            Name: "Duryan",
            Price: 500
        },
        {
            Id: 6,
            Name: "Cherry",
            Price: 600
        }
    ];
}