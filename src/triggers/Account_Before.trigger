trigger Account_Before on Account (before insert, before update) {

Account[] accountList = Trigger.New;
for (Account lAcct : accountList ){
        lAcct.Activity_Date_Time__c = Datetime.now();
}    

}