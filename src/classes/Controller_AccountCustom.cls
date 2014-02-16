public class Controller_AccountCustom{
private Account lAccount;

public Account getAccount(){
    return lAccount;
}
public void setAccount(Account pAccount){
    lAccount = pAccount;
}
//I need a constructor that returns a pageref
public Controller_AccountCustom(ApexPages.StandardController stdController){
    lAccount = (Account) stdController.getRecord();
  

}
public pagereference sendEmail(){
    System.debug('you are in sendEmail method');
    Messaging.SingleEmailMessage email = new  Messaging.SingleEmailMessage();
    email.setSubject('Hello World');
    email.setHtmlBody('<html><body><h1>Hello World!</h1></body></html>');
    String[] emailAddresses = new String[]{'adagdak@gmail.com'}; 
    email.setToAddresses(emailAddresses);
    Messaging.SingleEmailMessage[] arryMsg = new Messaging.SingleEmailMessage[]{email};
    Messaging.SendEmailResult[] mailResults = Messaging.sendEmail(arryMsg);
    for (Messaging.SendEmailResult mailResult: mailResults){
        if (!mailResult.isSuccess()){
            //process error
        }
    }
  return null;
}


public pagereference save(){
    System.debug('you are in save method');
  return null;
}

public pagereference printCustom(){

    System.debug('you are in printCustom method');
      return null;
}



}