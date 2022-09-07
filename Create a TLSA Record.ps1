Add-DnsServerResourceRecord -TLSA -ZoneName nuggetlab.com -Name _443._tcp -CertificateUsage DomainIssuedCertificate -MatchingType Sha256Hash -Selector SubjectPublicKeyInfo -CertificateAssociationData 4462c107c485dd6a5443f5e7a1604416034a374c3f4d10875f1c3715027563af -TimeToLive 600

