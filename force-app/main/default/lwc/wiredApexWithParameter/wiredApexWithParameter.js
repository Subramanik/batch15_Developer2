import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

const COLUMNS = [
    { label: 'Account Name', fieldName: 'Name' },
    { label: 'Type', fieldName: 'Type'  },
    { label: 'Industry', fieldName: 'Industry'},
    { label: 'Phone', fieldName: 'Phone' ,  type: 'phone'},
    { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency' },
];

export default class WiredApexWithParameter extends LightningElement {
    
    type= 'Customer - Direct';
    columns= COLUMNS;
    
    @wire(getAccountList, { customerType : '$type' })
    accounts;
}