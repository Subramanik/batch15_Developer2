import { LightningElement, wire } from 'lwc';

import { MessageContext,publish } from 'lightning/messageService';
import LEARN_LMS from '@salesforce/messageChannel/LearnLMS__c';

export default class LmsPublishComponent extends LightningElement {

    messageToPublish;

    @wire(MessageContext)
    messageContext;

    handleChange(event){
        this.messageToPublish = event.target.value;
    }

    handleClick(){

        const message ={
            publishedMessage : this.messageToPublish
        };

        publish(this.messageContext, LEARN_LMS, message);
    }

}