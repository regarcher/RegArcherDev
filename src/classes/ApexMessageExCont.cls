public class ApexMessageExCont{
    Account account;
    String name{ get; set; }
///////////////////////////////////////////////////////////////////////////    
      public ApexMessageExCont(){
      ID myID = null;
       account = [select numberofemployees, numberoflocations__c from Account
            where id = :ApexPages.currentPage().getParameters().get('id')];


       name='CONSTRUCTOR ApexMessageExCont';

   }


////////////////////////////////////////////////////////////////
    public PageReference save() {
    try{
        update account;
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'reggie addMessage');
        ApexPages.addMessage(myMsg);
    }
    catch(DmlException ex){
        ApexPages.addMessages(ex);
    }
    return null;
    }
///////////////////////////////////////////////////
    public String getName() { 
        name='GETTER ApexMessageExCont';
        return name;
    }
///////////////////////////////////////////////////
    public Account getAccount() {
        ID myID = null;
        if(account == null){
            account = [select id, name, numberofemployees, numberoflocations__c from Account
            where id = :ApexPages.currentPage().getParameters().get('id')];

            }
        return account;
    }
//////////////////////////////////////////////////////
 }