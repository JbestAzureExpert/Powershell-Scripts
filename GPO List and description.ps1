## Firewall rules for a domain control 
## see Inbound and Outbound CSV Called inbound and outbound 

## group policy from Domain controller 
## default domain level policies for authenticated users, domain admins, enterprise admins, enterpise dcs, and system. 
# 1.) All: Cryptolocker Protection (restricts users from opening software files they are not allowed to.) 
# 2.) All: Deny Removeable Storage (stops people from using CD/DVD/Removable disks, tapes WDP devices) 
# 3.) (enforced) All: General Settings Drives shortcuts, printers ( IE Settings for allowed URLs like for internal servers.Assign Drive Letters, desktop shortcuts, shared printers.
# 4.) CA Certificate (no settings defined? maybe a default setting?) 
# 5.) Default domain Policy (password policy, Account lockout policy, Kerberos Policy, local polices / audit policy, local policies / security options, network access, Network Security, NTLM Audit enabled, Public Key Policies / Encrupting file system. 
# Public Key Policies / GTrust Root CA, Public Key Policies / intermediate cert authority certs. Public Key Polices (esxi hosts mostly) ADMX, google chrome, microsoft edge, IE,(automatically select client cert for these sites (specifically okta) 
# 6.) Integra.org_ADAuditPlusPolicy (allows a lot more audit for logs and diagnostics) 
# 7.) Remove Domain Admins from WS Administrators group (Disables Local Admins inside of the domain) 
# 8.) Remove Store (ADMX templates from the central store, removes offer to update windows latest version and turn off the store application) 
# 9.) WSUS -active (setup to USE WSUS server for updates inside of the domain. used from admx templates from the central store) 
# 10.) (enforced)Z-Block worksation OS Upgrade. (this seems redundant to the remove store policy it has two settings. 1 turn off the offer to update to the latest version of windows (enabled) 2.) which windows product version would you like to recieve feature updates for? eg windows 10. Target Version for Feature Updates 21H2
# 11.) (enforced) Z-RDP CA Cert - V3 WS Version  Require use of security security layer for remote RDP connections (RDP) Server authentication cert template RDS Encryption level high level. 
# 12.) (enforced) Z-Session Inactivity timeout WS Only. logs users out of their machines after 15 minutes, Change the max time idle. enables workstation  screensaver and forces specific Screen saver, Also sets timer for idle remote desktop service sessions to be enabled. 

# DOMAIN CONTROLLER Polcies 
# 1.) Auto Enrollment for computer Cert policy (automates the enrolment for new certificates from the CA. ADMX settings from the central store. that involve set group policy refresh interval for comps, set group policy refresh interval for dcs, require use of speicifc security layer for remote RDP connections.Server Authentication cert template. 
# 2.) Default DC policy (Allows audit events) Local Polices . user right assignment. Local policy / security options, event log, advanced audit config, 
# 3.) Powershell logs and transcription Turn on module logging, turn on powerhsell script block logging, log script block invocation start / stop events. turn on powershell transscirption, logged on polaris enabled
# 4.) RDP Restricted Logon (Local Policies / user rights assignment, allow log on through terminal services (domain\rdp accessto servers, Restricted groups builtin\remote desktop users members domain\rdp access to servers.

# MACHINE ACCOUNTS, location, appliances(cisco fp or ISE) laptops, servers. 

# workstations Desktops mini pcs etc 
# 1.) Audit policy workstations 
# 2.) auto enrollment for computer cert policy 
# 3.) Block Windows 11 Upgrade (again really?
# 4.) Disable Bluetooth 
# 5.) Chrome - Tanium 
# 6.) Chrome Extensions.
# 7.) Customize desktops 
# 8.) Default apps 
# 9.) Desktop local Administrators 
# 10.) disable NTLM Authentication 
# 11.) DNS registration refresh interval 
# 12.) Enable Services 
# 13.) Enable wireless 
# 14.) Firewall (block all inblound connections) allow agents, allow port 445,139,
# 15.) Integrated TLS/Hash Config (disables triple des, disables NUll cipher, Des 56/56, disable r2 40/128, rc56/128, rc2 128/128, rc4 40/128, tc4 56/128, rc4 64/128, AES 128/128,AES 256/256,RC4 128/128, md5 is enabled, SHA is enabled, SHA256 is enabled, SHA384, SHA512,Disable hello client?. 
# 16.) Laps-Policy 
# 17.)Network Discovery Firewall Rules (Nothing is defined?)
# 18.) PDQ Deploy (nothing is enabled?)
# 19.) Power Options