# Mule Extensions SOAP Parent POM

This is a parent POM for use in SOAP Based Mule extensions.

## Creating a new Soap Extension

Just create a new maven project and set this pom.xml as parent of your project parent pom

    <parent>
       <groupId>com.mulesoft.mule.extensions</groupId>
       <artifactId>mule-modules-soap-parent</artifactId>
       <version>4.0.0-SNAPSHOT</version>
    </parent>

Now you have everything you need to start the development of the SOAP Based extension.

Begin by creating a new SoapServiceProvider to define the Web Services you want to connect to.
