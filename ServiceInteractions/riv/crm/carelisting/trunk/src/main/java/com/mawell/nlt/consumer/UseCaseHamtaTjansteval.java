package com.mawell.nlt.consumer;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import org.w3._2005._08.addressing.AttributedURIType;

import riv.crm.carelisting._1.Facility;
import riv.crm.carelisting._1.Resource;
import riv.crm.carelisting._1.SubjectOfCare;
import riv.crm.carelisting.getlisting._1.rivtabp20.GetListingResponderInterface;
import riv.crm.carelisting.getlisting._1.rivtabp20.PersonNotFound;
import riv.crm.carelisting.getlisting._1.rivtabp20.TechnicalException;
import riv.crm.carelisting.getlistingresponder._1.GetListingRequestType;
import riv.crm.carelisting.getlistingresponder._1.GetListingResponseType;


/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 * Exempelkod f�r anv�ndningsfallet "H�mta tj�nsteval".
 * 
 * @author Robert Siwerz, www.mawell.com.
 */
public class UseCaseHamtaTjansteval
{

   private void useCaseHamtaVardval() throws MalformedURLException
   {
      // H�mtar referens till SEI (Service Endpoint Interface).
      QName serviceName = new QName("urn:riv:crm:carelisting:GetListing:1:rivtabp20", "GetListingResponderService");
      Service service = Service.create(new URL("http://127.0.0.1:8088/mockGetListingResponderBinding?WSDL"), serviceName);

      GetListingResponderInterface listingSEI = service.getPort(GetListingResponderInterface.class);

      // H�mtar listningsinformation f�r angiven person.
      AttributedURIType logicalAddress = new AttributedURIType();
      logicalAddress.setValue("01"); // Omr�deskod

      GetListingRequestType request = new GetListingRequestType();
      request.setPersonId("195005055005");
      GetListingResponseType response = null;
      
      try
      {
         response = listingSEI.getListing(logicalAddress, request);
      } catch (PersonNotFound e)
      {
         // Anv�nd aff�rsregel f�r att hantera detta.
      } catch (TechnicalException e)
      {
         // G�r ett nytt f�rs�k...
      }

      // Skriver ut debug information
      SubjectOfCare patientData = response.getSubjectOfCare();
      // 1. Personnummer
      System.out.println("1. S�kandes personnummer: " + patientData.getPersonId());

      // 2. Tj�nsteut�varens (t.ex. V�rdenhet) HSAID
      String hsaID = patientData.getListing().get(0).getHealthcareFacility().getFacilityId();
      System.out.println("2. Tj�nsteut�varen (HSAID): " + hsaID);

      // 3. H�mtar mer detaljer om tj�nsteut�varen.
      Facility facility = patientData.getListing().get(0).getHealthcareFacility();
      Resource resource = patientData.getListing().get(0).getResource();
            
      if(facility != null)
      {
         // tj�nsteut�varen �r en v�rdenhet och inneh�ller f�ljande data.

          System.out.println(" V�rdenhet:");
          // 1. Namn.
          System.out.println(" 1. Namn: " + facility.getFacilityName());
         
         // 2. Har v�rdenheten k� just nu.
         String queue = (facility.isHasQueue())? "Ja" : "Nej";
         System.out.println(" 2. �r det k� just nu: " + queue);
      }
      if (resource != null)
      {
         // Tj�nsteut�varen �r en specifik l�kare och inneh�ller f�ljande
         System.out.println(" V�rdgivare:");
         
         // *** H�mtar ut data ***
         // 1. Person id.
         System.out.println(" 1. Person id: " + resource.getResourceId());
         // 1. Namn.
         System.out.println(" 2. Namn: " + resource.getResourceName());

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
         UseCaseHamtaTjansteval exempelkod = new UseCaseHamtaTjansteval();
         exempelkod.useCaseHamtaVardval();
      } catch (Exception e)
      {
         e.printStackTrace();
      }
   }
}
