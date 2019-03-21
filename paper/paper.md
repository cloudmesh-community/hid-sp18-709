# Big Data  Security and Privacy :o:  hid-sp18-709, hid-sp18-710
| Andres Castro, Uma M Kugan
| andrescastro@iu.edu, umakugan@iu.edu
| Indiana University
| hid: sp18-709, sp18-710
| github: [:cloud:](https://github.com/cloudmesh-community/hid-sp18-709/tree/master/paper/paper.md)

---

Keywords: big data, security, privacy

---


Each organization has unique needs when it comes to Big Data. These
needs cannot be described with one defined structure alone, and
likewise, the information that they use does not come with defined data
types. Because of this, there is the need for the Big Data Platform. Big
Data is gaining more popularity because of its ability to connect to a
number of devices in the so-called *Internet of Things*  (IoT), producing
a huge dump of data that needs to be transformed into information
assets. It is also very popular to buy additional on-demand computing
power and storage from public and private clouds to perform intensive
data-parallel processing. These things not only create the way for Big
Data expansion but also boosts security and privacy issues. Big Data
security is the process of securing data and their processes both within
and outside the organization. Big Data deployments are valuable targets
for intruders and, because of this, security becomes a never ending
concern for any organization. A single unauthorized user gaining access
to an organization's big data could in and of itself acquire all the
valuable information that the company possesses which could result not
only in monetary loss but also be detrimental to its business and to its
brand name. In current trends, security teams work towards continuously
monitoring networks, hosts and application behavior across their
organization's data. Traditional methods of securing firewalls are no
longer enough to secure a company's data assets and Big Data platforms
need to be secured with a mix of both traditional and newly developed
security tools, as well as big data analytics for monitoring security
throughout the life of the platform [@moura2016].

## What is Big Data

Big Data, by definition of its name, is an extensive variety and heavy
volume of data that can be entered or transferred at high velocity, and
include data sets coming from dynamic sources of data and applies
technologies to analyze these data sets. It is a term usually used to
define huge and complex data sets that do not fit into any traditional
system. Most recently, the term *Big Data* tends to refer to the use of
predictive, user behavior analytics, or certain other advanced data
analytics that extract value from data sets. These analytics provide
more insights about the data which indeed help businesses understand
their trends which will eventually, in good theory, help their growth
 [@hey2009fourth].

For example, a company that works with waste management, can collect
data on the waste production and human activities from very diverse
sources, then interpret the findings of Big Data to make optimal
decisions [@yenkar2014review].

## Big Data Needs Big Security

The amount of data collected by organizations and individuals around the
world is growing on a daily basis, and the volume of the data being
collected is expected to continue to grow exponentially. It is believed
that the 90% of the data we have currently have in the world has been
collected in the past few years. Velocity, volume and variety of Big
Data comes results in privacy, security and compliance issues as well.
Some of the data stored in Big Data platforms is very sensitive and
regulations need be put in place, strictly controlling specific aspects
of the data and who has access to the data. Proper measures have to be
taken to control any weaknesses to cyber threats.

There are requirements for security measures already in place. Big Data
platforms are subject to compliance mandates by government and industry
regulations, including GDPR, PCI, Sarbanes-Oxley (SOX), and
HIPAA [@imperva]. These measures place regulations on company practices
and implementations that ensure proper data security and monitoring.
These regulations are mandatory, and failing to comply could result in
severe penalties, from heavy fines to legal actions.

While these requirements are important, traditional security mechanisms
that have been in place for securing structured static data are no
longer sufficient. With technological advances also comes a need to
continually assess weaknesses in the new systems, to protect itself from
new cyber threats and hacking strategies, and to create user friendly
platforms for client that do not compromise the data being collected or
stored. These developments are often far ahead of regulation, and
individual entities need to be continually monitoring and enhancing
their platforms to ensure protection of its data and systems. Big Data
needs bigger security to protect its data, applications and
infrastructure. Securing data not only protects the brand, reduces costs
and avoids any legal issues, it also helps in retaining the brand name
and increases revenue and growth [@csasecurity].

## Big Data Security Challenges

Recent adoption of cloud storage has increased the amount of data
collected by organizations and hence it has become of vital importance
to secure these data platforms as well. Data security issues are
generally caused by the lack of proper tools and measures provided by
traditional anti-virus software. Routine security checks to detect
patches are no longer enough to handle real time influxes of data.
Streaming real time data demands a great amount of attention focused on
security and privacy solutions. Databases are no longer static. Big Data
security's motto is to restrict unauthorized users and intruders from
getting into a platform and also to block the encryption of data both
in-transit and at-rest. The adoption of cloud storage creates a need to
pay particular attention to the in-transit, or the continually expanding
and modifying databases. Big Data security tools must be in place at all
stages of data i.e. on incoming data, data stored in the platform and
also on the data that goes out to other applications or outside
party [@datamation].

### Access Control

Access control, in the context of Big Data, is controlling who can
access data by using security settings. The different platforms that use
Big Data need to be able to identify critical data, data origination and
also who has access to the data. In this capacity, data access is not
only protecting from external access, but also protecting data from
those who have internal access as well [@rahmaniamathematical].

User access should be controlled via a policy-based approach that
automates access based on user and role-based settings. This manages
different level of approvals in order to regulate who has access to the
critical data and to protect the big data platform against inside
attacks [@dataconomy].

### Audit Control

Big Data analytics can be used to analyze different types of logs in
order to identify malicious activity. It also can regularly audit all
the working directories inside the organization in order to check for
any unauthorized access to any sensitive or privacy data. In reality,
not all attacks are identified in the exact moment when the attack
occurs. In order to perform a root cause analysis of the incident, data
security professionals need to have access to audit logs which allow
them to trace attacks back to the point of entry, exact time,
modifications or weaknesses. In case of data breach, some firms are
required to turn over their audit logs to stakeholders and possibly
affected companies and heavy fines are imposed for failure to
comply [@csasecurity].

### Real Time Compliance Control

Real time security monitoring is always very challenging due to the
number of false positive alerts generated by security programs. Because
of the frequency of false positive alerts, they are usually ignored. Big
Data analytics may help provide more meaningful insights that could
result in real time detection .

### Non Relational Databases Privacy

Non Relational Databases are still not fully matured. This poses a
severe threat to securing the data and it is often difficult for
security and governance team to keep up with the demand. NoSQL databases
primarily focus on how to handle high volume of data without paying much
attention to their security needs.

### End-Point Input Validation

Many organizations collect their data from End-Point devices. It is very
important to ensure that data coming from these devices is not infected.
Proper steps must be taken to make sure data is coming from an authentic
source and it is legitimate. Incoming data from End-Point devices such
as smart phones is growing tremendously and filtering or validating data
from these sources is a very big challenge [@csasecurity].

### Securing Transaction Logs and Data

Data in any organization many be stored at various levels (tiers) of the
storage structure depending on the need and usage of the data. Increase
in the transfer of data within the organization enforce for the need of
auto-tiering for Big Data storage whereas auto-tiering does not maintain
the log of where the data is stored and hence security is a big concern.

### Securing Distributed Framework

Distributed framework enforces parallelism. This means that data is
distributed across multiple nodes to achieve faster processing of large
volumes of data. This increases the security concern of the framework
and the data that exists there. Most companies use a distributed
framework like MapReduce in which mappers read and compute and reducers
combine the output from each mapper. If mappers are not secured, there
is the chance of data being compromised [@dataconomy].

### Data Provenance

It is very important to know the original data that is coming to the
platform so that we can better classify them. Data Origin should be
consistently monitored but in reality due to the high volume it is
becoming a big concern for data security. Provenance metadata is growing
significantly as well and protecting metadata is very crucial for any
organization [@dataconomy].

## Big Data Security Stakeholders

In the digital era, the traditional way of securing the data, changing
passwords frequently, firewall protection is just not enough to keep up
with the growth of data produced by Internet of Things(IoT), Smart
Devices, Bring Your Own Devices (BYOD) and several customer friendly
apps that is coming out everyday. "Even though end user has the biggest
responsibility with securing his own data, unfortunately, end users are
not fully aware of the cyber security issues and they do not have the
appropriate knowledge to discover the world wide web in complete
safety" [@realdolmen].

Big Data deployment is not possible to handle by any single business
unit or with single tech team. It involves several business units,
infrastructure, information technology, security, compliance,
programmers, testers and product owners are all involved in big data
deployment. They are all responsible for Big Data Security. Information
Technology and Security team is responsible for drawing the policies and
procedures. Compliance officers together with security team will protect
compliance, such as automatically encrypting personally identifiable
information before it is easily accessible. Administrators will automate
these process to protect their environment. Even though every
organizations have their policies and control laid in place to protect
their biggest asset, phishing attacks can come in any form as a simple
email. Frequent internal audit within the company can help us
periodically check if all privacy, security and compliance are all in
place.If not, proper measures can be taken right away to avoid any legal
issues.

"The average annualized cost of cyber crime based upon a representative
sample of 237 organizations in six countries by Ponemon Institute in
their 2016 Cost of Cyber Crime Study and the Risk of Business Innovation
sponsored by Hewlett Packard Enterprise is 9.5million U.S.
dollars" [@ponemon]. In any organization, loss of information is the
most expensive consequence of a cyber crime. The cyber attack may
results in business disruptions, data or information loss, loss of
revenue, damage to equipment and last but not the least it damages the
brand. So it is big time to protect and secure the big data and the
environment from all angles.

## Best Practices for securing Big Data

There are three fundamental principles used in defining security goals:
confidentiality, integrity, and availability. Confidentiality is the
ability to keep sensitive data safe from third parties and unauthorized
access. Integrity in this context means to avoid unauthorized
modification of the data. Finally, availability means always being able
to access the data and resources. These three concepts are known as the
CIA triad, and is used as base principles when discussing and designing
security practices [@hamlin2016cryptography].

To meet these goals, there are four main branches of security that apply
to Big Data: Authentication, Encryption, Data Masking and Access
Control [@abouelmehdi201773].

### Authentication

Because of its nature (large sizes of data, linking different sources,
sharing access with third parties, etc), some of Big Data's features are
highly susceptible to different privacy, security and welfare
risks [@kshetri2014big].

Privacy can be defined as the condition of confidentiality, protecting
information from third parties. To support privacy, there have been
different Authentication methods that both verify and validate entities
who attempt to access the information. This ensures that only authorized
entities are able to access the data or resources.

With Big Data, it is important to choose a proper authentication method,
with the least computation complexity as possible, to allow dynamic
security solutions within large Data Centers and also to avoid
incrementing the traffic unnecessarily. Choosing an overbearing
authentication method can cause both delay and storage issues. Because
of this, it is important to tailor the security to the needs of the
specific network [@Thayananthan2015big].

### Cryptography

There are multiple understandings of how data moves through stages, also
known as Data Life cycles. Cryptography- define in terms of security.
CITA.

From the perspective of cryptography, there are three phases in the Data
Life Cycle: Data in Transit, Data in Storage, and Data in Use. Different
cryptography techniques will be implemented depending on which stage of
the life cycle the data is in  [@hamlin2016cryptography].

There are different cryptographic tools that not only keep data secure
at each point in its life-cycle, but also enable richer use of the data.
The main tool is Encryption. Encryption takes pieces of data in plain
text and use a cryptographic key to produce a version of the data that
can only be read using the cryptographic key. Without the key, the
information is illegible. There are two types of encryption: secret key
encryption and public key encryption. Secret key encryption is when the
same key is used for both encrypting and decrypting data. There are
scenarios when one of the keys can be made public. For instance, if the
locking key is kept private but the unlocking one is made public, this
security can be used to prove authenticity [@hamlin2016cryptography].

There are different standards for encryption. The most well known and
commonly used is Advanced Encryption Standard (AES). This standard sets
guiding principles to ensure that data is encrypted in a manner that
meets security needs and allows the recovery of original
data [@hamlin2016cryptography].

### Data Masking

By definition, Big Data works with large volumes of heterogeneous data
sets using software to manage the data and to provide predictive
analysis. Data masking works by replacing sensitive data with
non-sensitive values, yet preserves the data integrity. For instance,
replacing names with code names, or social security numbers with a key
number. By doing this, different parties can access information without
putting sensitive data at risk [@archana2017big].

Five laws for data masking have been developed by Securosis Research.
The first law is that data masking should not be reversible. This means
that the data should not be unmasked easily using reverse engineering.
The second law is that data that has been masked has to represent the
original data set. For example, it has to belong in the same context.
The third law states that data masking should maintain application and
database integrity. This means that the process of data masking should
not modify or affect the data in the databases in a negative way. The
fourth law emphasizes that non-sensitive data can be masked, but it
should not be masked if it can not be used to make sensitive data
vulnerable. For instance, when masking information about a person, it is
correct to mask the person's name, email address and social security
number, but other information like gender, or favorite colour, would be
useless to mask. Finally, data masking must be a repeatable process,
using a standard to reproduce the steps taken to mask the data, allowing
to troubleshoot possible problems in the process [@archana2017big].

### Access Control

As it was explained in the Challenges section, Access control, allows
some entities to access the data or resources, while denying its use to
other entities. Through security settings.

Some authors add that the inferences drawn from data should also be a
cause for concern, because they can identify traits and patterns that
could expose vulnerabilities. They propose that organizations who use
the protected data should disclose their decisions criteria in order to
apply access control in a broader spectrum. By doing so, it would be
sufficient to diminish privacy concerns by de-identifying the data, or
denying access to certain parts of the data that coul be used to make
entities or data vulnerable. Some of these authors say that by doing
this, it would not only reduce the privacy risk, it would also salvage
large amounts of data for alternative use. This de-identification can
also be achieved through data masking, pseudonymization, aggregation,
among other methods [@tene2012big].

### Physical Security

It is always better to build and deploy Big Data platforms in their own
data center. If deployed in a cloud, the organization must diligent to
ensure that the cloud provider's data center is physically well secured.
Access should be restricted to strangers and staff who have no official
responsibilities in the designated areas or interacting with the data
sources. Data centers should be properly monitored at all times and
video surveillance and security logs are important tools to achieve
this.

## Future of Big Data Security

To think about Future of Big Data Security, it is necessary to engage
the conversation of what the trends are in Big Data and what
technologies are expanding and changing the horizon. There are many new
technologies and solutions that are shaping the future of the Big Data,
but because of the length and focus of this document, there are three
main areas that will be covered: Virtualization and Cloud Computing, IOT
Security, External Password Vaults and Penetration Tests.

### Virtualization and Cloud Computing

Virtualization is a way of deploying resources at multiple levels, such
as hardware, network infrastructure, application and desktop centralized
managing and using dynamically the physical resources. This makes the
system flexible and less costly than traditional environments and giving
management new tools to optimize the use of
resources [@padmini2015securing].

Since virtualization can be developed in so many levels, including cloud
computing and by multiple service providers, it is natural that the
system requirements of users and organizations move towards a variety of
solutions that may include Infrastructure as a Service (IaaS) frameworks
from public clouds such as the ones offered by Amazon, Microsoft,
Google, Rackspace, HP, among others, or even Private clouds, maintained
and many times even set up by internal IT
departments [@von2014accessing].

These cloud computing technologies are being used to solve
data-intensive problems on large-scale infrastructure. Thus, integrating
big data technologies and cloud computing for data mining, knowledge
discovery, and decision-making [@kune2016anatomy].

### IOT Security

The Internet of Things (IoT) is the name given to the large network of
physical devices that does not match the typical concept of computer
networks, this includes all kinds of objects. The large and growing
amount of devices and diverse uses given to them, makes IoT generates
very important Big Data streams. Making it necessary to develop new
systems and data mining techniques for this new
paradigm [@bifet2016mining].

In this IoT paradigm, each new opportunity opens doors to new threats as
well. This makes it necessary to develop techniques to ensure trust,
security and privacy. Different Authors write about the possible ways to
face these challenges, and some, they consider three main axes to
articulate the solutions: Effective security - used in very small
embedded networks, context-aware privacy and user-centric privacy, and
the third one is the systemic and cognitive approach for IoT security -
where the interaction between people and the IoT can be envisioned as a
set of nodes and tensions [@riahi2014systemic].

All this to say that in order to approach privacy and security in this
new paradigm, many new theories and techniques have been developed since
old security products and techniques may not suffice the needs of the
different IoT users and communications.

### External Password Vaults

Password vaults are applications that store multiple passwords and
encrypt them storing them in a database [@chatterjee2015cracking].

There are small Password Vaults that can be stored locally on a system,
or larger options that can be integrated into larger systems, providing
additional security options, like generating real time temporary
passwords for effective password rotation (I.E. Cyberark External
Password Vault)  [@nelson2015practical].

These techniques are key to articulate authentication and a proper data
access while using multiple services such as Cloud infrastructure and
IoT.

### Penetration Tests

After applying all the security techniques and strategies, and after
putting in place all necessary security and privacy policies, the most
important step is validating the strength of the security of the system.
For some time, companies have started to perform tests that consist on
simulating an attack from the perspective of an attacker, this method is
known as Penetration test and it allows to actively evaluate and assess
the security of a system [@shivayogimathoverview].

The tester identifies the threats faced by an organization from hackers
and suggest changes to improve the security and minimize the
vulnerabilities and close the possible loop holes in the
network [@shivayogimathoverview].

## Conclusions

Big Data as a constantly evolving and ever changing branch of
information technologies resembles an ecosystem that since it covers
gathering data from so many sources, processing it and generating new
information, there will be many entities and interests involved that
will need to be protected. The features of Big Data such as Volume,
Variety and Velocity bring new challenges to security and privacy
protection. To protect the integrity and availability, security
providers and local IT departments, will have to diversify their
security and privacy strategies and policies, in order to keep pace with
the growth and evolution of this new ecosystem.

## Acknowledgement

The authors would like to thank Dr. Gregor von Laszewski for his support
and suggestions in writing this paper. Gregor also edited the paper.
