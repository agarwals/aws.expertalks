For use at the meetup as part of Expertalks: http://www.meetup.com/expertalks/events/169153442/

"Cloud Computing with AWS" on 26th April, 2014 at Pune.

This considers a scenario where a web application is deployed and an "elastic" network of large numbers of test agents generates test traffic to the application.

The repository is organised as follows:
app - (called ysrtc) A java web application that exposes a single REST end-point to "book a token". The necessary database scripts are also provided
utility scripts - Utility scripts to work with a larger number of instances. The scripts let the user launch instances, capture information about the instances launched using the reservation-id, run test agents on the instances, and teardown the same later.
testing - installables, configuration, and utility scripts to run Grinder agents and Grinder console.

Typical configuration:
The web application and database server are configured together
The grinder console is setup
An AMI is created for grinder to allow creation of a large number of instances of test agents
The agents resolve the grinder console and the web application through pre-configured /etc/hosts entries
The console and test execution and results gathering can be performed over REST end-points made available on the console

TODO: Postman collection for typical grinder console use to be shared publicly

END-OF-FILE
