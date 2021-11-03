/**
 * @description       : 
 * @author            : Sudhir Kumar Thanna
 * @group             : 
 * @last modified on  : 11-02-2021
 * @last modified by  : Sudhir Kumar Thanna
**/
@IsTest
public with sharing class testCazooVehicleController {
   
    @IsTest
    public static void testGetGroupedData()
    {
        List<Vehicles__c> vhs = TestDataFactory1.createVehiclesData();
        Test.startTest();   
        cazooVehicleController.getGroupedData();
        Test.stopTest();
        List<AggregateResult> vehiclesGroupedList = [SELECT make__c,model__c,count(Name),SUM(KM_Driven__c),SUM(Revenue__c),registration_date_earliest__c,registration_date_latest__c
                                                     FROM Vehicles__c GROUP BY make__c,model__c,registration_date_earliest__c,registration_date_latest__c];
        System.assertEquals(4, vehiclesGroupedList.size());      
    }

    @IsTest
    public static void testGetGroupedData_nullCase()
    {
        Test.startTest();   
        cazooVehicleController.getGroupedData();
        Test.stopTest();
        List<AggregateResult> vehiclesGroupedList = [SELECT make__c,model__c,count(Name),SUM(KM_Driven__c),SUM(Revenue__c),registration_date_earliest__c,registration_date_latest__c
                                                     FROM Vehicles__c GROUP BY make__c,model__c,registration_date_earliest__c,registration_date_latest__c];
        System.assertEquals(0, vehiclesGroupedList.size());      
    }

    @IsTest
    public static void testGetGroupedDataByQuery()
    {
        List<Vehicles__c> vhs = TestDataFactory1.createVehiclesData();
        Test.startTest();   
        cazooVehicleController.getGroupedDataByQuery('BMW','720d');
        Test.stopTest();
        List<Vehicles__c> vehiclesList = [SELECT Id,make__c,model__c,registration_date_earliest__c,registration_date_latest__c 
                                            FROM Vehicles__c
                                            WHERE make__c='BMW' AND model__c='720d'];
        System.assertEquals(2, vehiclesList.size());      
    }

    @IsTest
    public static void testGetGroupedDataByQuery_nullCase()
    {
        List<Vehicles__c> vhs = TestDataFactory1.createVehiclesData();
        Test.startTest();   
        cazooVehicleController.getGroupedDataByQuery('XYZ','ABC');
        Test.stopTest();
        List<Vehicles__c> vehiclesList = [SELECT Id,make__c,model__c,registration_date_earliest__c,registration_date_latest__c 
                                            FROM Vehicles__c
                                            WHERE make__c='XYZ' AND model__c='ABC'];
        System.assertEquals(0, vehiclesList.size());      
    }
}