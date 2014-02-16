global class InboundEmailHandler implements Messaging.InboundEmailHandler {

global messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail pEmail, Messaging.InboundEnvelope env){

    messaging.InboundEmailResult lRes = new messaging.InboundEmailResult();
       
    String strPlainText = '';
    strPlainText = pEmail.plainTextBody;
    //perform various operations...perhaps create a new Task object row?
    Task[] newTask = new Task[0];
     try {
      Contact vCon = [SELECT Id, Name, Email
        FROM Contact
        WHERE Email = :pEmail.fromAddress
        LIMIT 1];
        
     newTask.add(new Task(Description =  strPlainText ,
           Priority = 'Normal',
           Status = 'Inbound Email',
           Subject = pEmail.subject,
           IsReminderSet = true,
           ReminderDateTime = System.now()+1,
           WhoId =  vCon.Id));
           
     insert newTask;
     }catch(Exception e){
         system.debug('reggie, caught exception: '+e);
     }
    lRes.success = true;
    return lRes;


}
}