global with sharing class AccountEditor {
    // Stub controller
    // We're only using RemoteActions, so this never runs
    public AccountEditor(ApexPages.StandardController ctl){ }
	@RemoteAction
	global static Account getAccount(String name) {
        // Clean up the Id parameter, in case there are spaces
        name = name.trim();
        Account res = [
            SELECT Id, Name, Phone, Type, Website
            FROM Account
            WHERE name = :name];
        return(res);
    }

    @RemoteAction
    global static Boolean setAccount(
        String name, String type, String webSite, String phone) {
        // Get the warehouse record for the Id
		Account acnt = AccountEditor.getAccount(name);
        acnt.Type = type.trim();
        acnt.Website = website.trim();
        acnt.Phone = phone.trim();
        update acnt;
        return true;
    }
}