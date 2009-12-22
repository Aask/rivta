package com.mawell.vval.consumer;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import org.w3._2005._08.addressing.AttributedURIType;

import riv.crm.carelisting.createlisting._1.rivtabp20.CreateListingResponderInterface;
import riv.crm.carelisting.createlisting._1.rivtabp20.InvalidFacilityException;
import riv.crm.carelisting.createlisting._1.rivtabp20.PersonNotFoundException;
import riv.crm.carelisting.createlisting._1.rivtabp20.TechnicalException;
import riv.crm.carelisting.createlistingresponder._1.CreateListingRequestType;
import riv.crm.carelisting.createlistingresponder._1.CreateListingResponseType;

/**
 * Exempelkod f�r anv�ndningsfallet "G�ra Tj�nsteval".
 * 
 * @author Robert Siwerz,www.mawell.com.
 */
public class UseCasePerformAListing
{

   private void useCasePerformASpecificListing() throws MalformedURLException
   {
      // H�mtar referens till SEI (Service Endpoint Interface).
      QName serviceName = new QName("urn:riv:crm:carelisting:CreateListing:1:rivtabp20",
            "CreateListingResponderService");
      Service service = Service.create(new URL( "http://127.0.0.1:8088/mockCreateListingResponderBinding?WSDL"),
            serviceName);

      CreateListingResponderInterface listingSEI = service.getPort(CreateListingResponderInterface.class);

      try
      {
         AttributedURIType logicalAddress = new AttributedURIType();
         logicalAddress.setValue("SE239482390-23SAD"); // HSAID till huvudmannen
                                                       // som skall svara p�
                                                       // fr�gan.

         // Skapar ett fr�ge objekt.
         CreateListingRequestType request = new CreateListingRequestType();
         request.setPersonId("195005055005");
         request.setHealthcareFacility("SE345345-ASD323");

         // Utf�r tj�nstevalet.
         CreateListingResponseType response = listingSEI.createListing(logicalAddress, request);

         String status = (response.getCode() == 1) ? "OK" : "FEL";
         System.out.println("Listnings status: " + status);
         System.out.println("Aff�rsregel som kan f�rekomma vid listning: " + response.getBusinessRule());
      } catch (PersonNotFoundException e)
      {
         System.out.println("Felkod:" + e.getFaultInfo().getCode());
      } catch (InvalidFacilityException e)
      {
         System.out.println("Felkod:" + e.getFaultInfo().getCode());
      } catch (TechnicalException e)
      {
         // G�r ett nytt f�rs�k...
      }
   }

   /**
    * Entry point i Java applikationen.
    * 
    * @param args
    *           kommando-prompt argument.
    */
   public static void main(String[] args)
   {
      try
      {
         UseCasePerformAListing exempelkod = new UseCasePerformAListing();
         exempelkod.useCasePerformASpecificListing();
      } catch (Exception e)
      {
         e.printStackTrace();
      }
   }
}
