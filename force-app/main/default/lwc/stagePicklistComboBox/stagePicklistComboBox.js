import { LightningElement } from 'lwc';

export default class StagePicklistComboBox extends LightningElement {
    value = 'Prospecting';

    get options() {
        return [
            { label: 'Prospecting', value: 'Prospecting' },
            { label: 'Value Proposition', value: 'Value Proposition' },
            { label: 'Negotiation', value: 'Negotiation' },
            { label: 'Closed Won', value: 'Closed Won' },
            { label: 'Closed Lost', value: 'Closed Lost' }
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }
}