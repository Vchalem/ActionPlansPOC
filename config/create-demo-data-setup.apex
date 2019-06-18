// Pre-setup

//Reset the default admin user password because Scratch orgs don't supply password to be able to login directly
User u = [select id, name, UserPermissionsInteractionUser, LastName, FirstName, username, ProfileId,  alias, email, TimeZoneSidKey, LanguageLocaleKey, EmailEncodingKey, LocaleSidKey
          from User where IsActive=true and Profile.Name='System Administrator' limit 1];

//create user as flows user
u.UserPermissionsInteractionUser=true;

update u;

//reset pwd
System.resetPassword (u.Id, true);

