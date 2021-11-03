/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 11-02-2021
 * @last modified by  : Sudhir Kumar Thanna
**/
@isTest
public class TestDataFactory1 {
    
    public static List<Vehicles__c> createVehiclesData() {
        List<Vehicles__c> vhs = new List<Vehicles__c>();
        
        Vehicles__c a1 = new Vehicles__c(Name='BMW1',make__c='BMW',model__c='720d',KM_Driven__c=Decimal.valueof('1000.0'),Revenue__c=Decimal.valueof('1000.0'),registration_date_earliest__c=Date.valueof('2000-10-01'),registration_date_latest__c=Date.valueof('2021-10-01'));
        Vehicles__c a2 = new Vehicles__c(Name='BMW2',make__c='BMW',model__c='720d',KM_Driven__c=Decimal.valueof('1000.0'),Revenue__c=Decimal.valueof('5000.0'),registration_date_earliest__c=Date.valueof('2000-10-01'),registration_date_latest__c=Date.valueof('2021-10-01'));
        Vehicles__c a3 = new Vehicles__c(Name='BMW3',make__c='BMW',model__c='520d',KM_Driven__c=Decimal.valueof('4000.0'),Revenue__c=Decimal.valueof('8000.0'),registration_date_earliest__c=Date.valueof('2009-10-16'),registration_date_latest__c=Date.valueof('2021-10-15'));
        Vehicles__c a4 = new Vehicles__c(Name='BMW4',make__c='BMW',model__c='320d',KM_Driven__c=Decimal.valueof('5000.0'),Revenue__c=Decimal.valueof('10000.0'),registration_date_earliest__c=Date.valueof('2011-10-01'),registration_date_latest__c=Date.valueof('2021-10-01'));
        Vehicles__c a5 = new Vehicles__c(Name='BMW5',make__c='BMW',model__c='320d',KM_Driven__c=Decimal.valueof('2000.0'),Revenue__c=Decimal.valueof('6000.0'),registration_date_earliest__c=Date.valueof('2011-10-01'),registration_date_latest__c=Date.valueof('2021-10-01'));
        Vehicles__c a6 = new Vehicles__c(Name='Opel1',make__c='Opel',model__c='Corsa',KM_Driven__c=Decimal.valueof('3000.0'),Revenue__c=Decimal.valueof('6000.0'),registration_date_earliest__c=Date.valueof('2007-10-10'),registration_date_latest__c=Date.valueof('2021-10-22'));
        vhs.add(a1);
        vhs.add(a2);
        vhs.add(a3);
        vhs.add(a4);
        vhs.add(a5);
        vhs.add(a6);
        insert vhs;
        
        return vhs;
    }
}