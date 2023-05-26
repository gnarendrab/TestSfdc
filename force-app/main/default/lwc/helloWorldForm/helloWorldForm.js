import { LightningElement } from 'lwc';

export default class HelloWorldForm extends LightningElement {
    whoom = 'Narendra';

    handlechange(event)
    {
     this.whoom = event.target.value;
    }
}