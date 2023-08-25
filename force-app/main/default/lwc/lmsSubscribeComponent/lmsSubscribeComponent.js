import { LightningElement, wire } from 'lwc';

import {
    APPLICATION_SCOPE,
    MessageContext,
    subscribe,
    unsubscribe,
} from 'lightning/messageService';
import LEARN_LMS from '@salesforce/messageChannel/LearnLMS__c';

export default class LmsSubscribeComponent extends LightningElement {

    receivedMessage;
    subscription = null;
    SubStatus ='Not Subscribed';

    @wire(MessageContext)
    messageContext;

    handleClick(){
        if(!this.subscription){
            this.subscription= subscribe(this.messageContext, LEARN_LMS, (message) => this.handleMessage(message), {scope: APPLICATION_SCOPE});
        }
        this.SubStatus= 'Subscribed';
        console.log('Subscription is: ' + this.subscription);
    }

    handleMessage(message){
        console.log(message);
        //{ message: {publishedMessage : 'Hello World'}}
        this.receivedMessage = message.publishedMessage;
    }

    handleUnSubscribe(){
        unsubscribe(this.subscription);
        this.SubStatus ='Un-Subscribed';
        this.receivedMessage = null;
    }

}