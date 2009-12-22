package com.mawell.vval.consumer;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import org.w3._2005._08.addressing.AttributedURIType;

import riv.crm.carelisting.getlistingtypes._1.rivtabp20.GetListingTypesResponderInterface;
import riv.crm.carelisting.getlistingtypes._1.rivtabp20.TechnicalException;
import riv.crm.carelisting.getlistingtypesresponder._1.GetListingTypesRequestType;
import riv.crm.carelisting.getlistingtypesresponder._1.GetListingTypesResponseType;

/**
 * Exempelkod f�r anv�ndningsfallet "H�mta tillg�nglia listningstyper, t.ex {BVC, HLM}".
 * @author Robert Siwerz, www.mawell.com.
 */
public class UseCaseGetListingTypes
{
   
   public void useCaseGetListingTypes() throws MalformedURLException
   {
      // H�mtar referens till SEI (Service Endpoint Interface).                               
      QName serviceName = new QName("urn:riv:crm:carelisting:GetListingTypes:1:rivtabp20", "GetListingTypesResponderService");
      Service service = Service.create(new URL("http://127.0.0.1:8088/mockGetListingTypesResponderBinding?WSDL"),   serviceName);
  
      GetListingTypesResponderInterface listingSEI = service.getPort(GetListingTypesResponderInterface.class);
         
      // H�mta tillg�ngliga tj�nsteut�vare. 
      AttributedURIType logicalAddress = new AttributedURIType();
      logicalAddress.setValue("SE239482390-23SAD"); // HSAID till huvudmannen som skall svara p� fr�gan.
      GetListingTypesRequestType request = new GetListingTypesRequestType();
      GetListingTypesResponseType response = null;
      
      try 
      {
         response = listingSEI.getListingTypes(logicalAddress, request);
      } catch (TechnicalException e)
      {
         // G�r ett nytt f�rs�k...
      }     
      
      // Itererar �ver listan med listningstyper.
      System.out.println("M�jliga listingsval f�r personen");
      List<String> listingTypes = response.getListingType();
      
      for(String type : listingTypes)
      {
         System.out.println("Listningstyp: " + type);
      }
   }
   
   /**
    * Entry point i Java applikationen.
    * 
    * @param args kommando-prompt argument.
    */
   public static void main(String[] args)
   {
      try
      {
         UseCaseGetListingTypes exempelkod = new UseCaseGetListingTypes();
         exempelkod.useCaseGetListingTypes();
      } catch (Exception e)
      {
         e.printStackTrace();
      }
   }
}
