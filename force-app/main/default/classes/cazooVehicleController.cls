/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 11-02-2021
 * @last modified by  : Sudhir Kumar Thanna
**/
public with sharing class cazooVehicleController {

    /**
    * @description 
    * @author Sudhir Kumar Thanna | 11-02-2021 
    * @return List<AggregateResult> 
    **/
    @AuraEnabled(cacheable=true)
    public static List<AggregateResult> getGroupedData(){
        List<AggregateResult> vehiclesGroupedList = [SELECT make__c,model__c,count(Name),SUM(KM_Driven__c),SUM(Revenue__c),registration_date_earliest__c,registration_date_latest__c FROM Vehicles__c GROUP BY make__c,model__c,registration_date_earliest__c,registration_date_latest__c];
        if(vehiclesGroupedList.size()>0){
            return vehiclesGroupedList;
        }
        return null;
    }

    /**
    * @description 
    * @author Sudhir Kumar Thanna | 11-02-2021 
    * @param make 
    * @param model 
    * @return List<AggregateResult> 
    **/
    @AuraEnabled(cacheable=true)
    public static List<AggregateResult> getGroupedDataByQuery(String make, String model){
        List<AggregateResult> vehiclesGroupedQueryList = [SELECT make__c,model__c,count(Name),SUM(KM_Driven__c),SUM(Revenue__c),registration_date_earliest__c,registration_date_latest__c FROM Vehicles__c 
                                                        WHERE make__c=:make AND model__c=:model
                                                        GROUP BY make__c,model__c,registration_date_earliest__c,registration_date_latest__c ];
        if(vehiclesGroupedQueryList.size()>0){
            return vehiclesGroupedQueryList;
        }
        return null;
    }
}