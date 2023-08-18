import { LightningElement } from 'lwc';

export default class P2cNonPrimitiveOpptyParent extends LightningElement {

    oppList = [
        {
            Id : 1,
            Name : 'Test Opportunity 1',
            StageName : 'Prospecting',
            Amount : 10000
        },
        {
            Id : 2,
            Name : 'Test Opportunity 2',
            StageName : 'Discovery',
            Amount : 20000
        },
        {
            Id : 3,
            Name : 'Test Opportunity 3',
            StageName : 'Contracting',
            Amount : 30000
        },
        {
            Id : 4,
            Name : 'Test Opportunity 4',
            StageName : 'Closed Won',
            Amount : 40000
        }

    ]

}