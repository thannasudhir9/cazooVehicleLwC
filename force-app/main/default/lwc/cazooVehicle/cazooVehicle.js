import { LightningElement, track } from 'lwc';
import getGroupedData from '@salesforce/apex/cazooVehicleController.getGroupedData';
import getGroupedDataByQuery from '@salesforce/apex/cazooVehicleController.getGroupedDataByQuery';

export default class CazooVehicle extends LightningElement {
    @track DBdataDefault = [];
    @track DBDataByQuery = [];
    loadSpinner = true;
    data;
    loadedDataFromTable = false;
    make = null;
    model = null;
    totalDriven;
    totalRevenue;
    earliest;
    latest;
    modelName;

    connectedCallback()
    {
      this.getGroupingData();   
    }

    getGroupingData(){
        console.log('In getGroupingData Call....');
        getGroupedData({})
        .then(result => {
            console.log('Result::'+JSON.stringify(result));
            this.data = result;
            for (let j = 0; j < this.data.length; j++) {
                var tmpResponse = JSON.stringify(this.data[j]);
                console.log('tmpResponse::'+ tmpResponse);
                this.DBdataDefault.push(JSON.parse(tmpResponse));
            }
            console.log('this.dBdataDefault::'+ this.DBdataDefault);
            this.loadSpinner = false;
        })
        .catch((error) => {
            this.message = 'Error received: code' + JSON.stringify(error);
        });
    }

    handleClick(event){
        const itemIndex = event.currentTarget.dataset.index;
        console.log('itemIndex::'+itemIndex);
        const rowData = this.DBdataDefault[itemIndex];
        console.log('rowData:::'+JSON.stringify(rowData));
        this.make = this.DBdataDefault[itemIndex].make__c;
        this.model = this.DBdataDefault[itemIndex].model__c;
        this.getGroupingDataByQuery();
    }

    getGroupingDataByQuery(){
        console.log('In getGroupingDataByQuery Call....');
        getGroupedDataByQuery({
            make: this.make,
            model: this.model
        })
        .then(result => {
            console.log('Result::'+JSON.stringify(result));
            this.groupeddata = result;
            for (let j = 0; j < this.groupeddata.length; j++) {
                var tmpResponse = JSON.stringify(this.groupeddata[j]);
                console.log('tmpResponse::'+ tmpResponse);
                this.DBDataByQuery.push(JSON.parse(tmpResponse));
                console.log('Total Driven KM:'+ this.groupeddata[j].expr1);
                console.log('Total Revenue:'+ this.groupeddata[j].expr2);
                console.log('Earliest:'+this.groupeddata[j].registration_date_earliest__c);
                console.log('Latest:'+this.groupeddata[j].registration_date_latest__c);
                this.totalDriven = this.groupeddata[j].expr1;
                this.totalRevenue = this.groupeddata[j].expr2;
                this.earliest = this.groupeddata[j].registration_date_earliest__c;
                this.latest = this.groupeddata[j].registration_date_latest__c;
                this.modelName = this.make + this.model;
            }
            console.log('this.dBdataDefault::'+ JSON.stringify(this.DBDataByQuery));
            this.loadedDataFromTable = true;
        })
        .catch((error) => {
            this.message = 'Error received: code' + JSON.stringify(error);
        });
    }

}