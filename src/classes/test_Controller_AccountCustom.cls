@istest
private class test_Controller_AccountCustom{

static testMethod void testController(){
    
     Account acct = new Account(Name = 'account test', OwnerId = UserInfo.getUserId());
     ApexPages.StandardController stdController = new ApexPages.StandardController(acct);
     ApexPages.currentPage().getParameters().put('id', acct.Id);
     Controller_AccountCustom CAC = new Controller_AccountCustom(stdController);
     Account myAcct = CAC.getAccount();
     myAcct.phone='1111111111';
     CAC.setAccount(myAcct);
     CAC.save();
     CAC.printCustom();
      
    

}

}