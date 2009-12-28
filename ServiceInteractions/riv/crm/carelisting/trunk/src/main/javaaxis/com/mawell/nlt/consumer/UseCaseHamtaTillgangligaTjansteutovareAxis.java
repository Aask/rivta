package com.mawell.nlt.consumer;

import java.net.MalformedURLException;

import org.apache.axis2.databinding.types.URI;


import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.TechnicalException;
import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.GetAvailableFacilitiesResponderServiceStub;
import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.GetAvailableFacilitiesResponderServiceStub.AttributedURIType;
import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.GetAvailableFacilitiesResponderServiceStub.CountyCode;
import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.GetAvailableFacilitiesResponderServiceStub.Facility;
import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.GetAvailableFacilitiesResponderServiceStub.GetAvailableFacilities;
import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.GetAvailableFacilitiesResponderServiceStub.GetAvailableFacilitiesRequestType;
import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.GetAvailableFacilitiesResponderServiceStub.GetAvailableFacilitiesResponse;
import rivtabp20._1.getavailablefacilities.carelisting.crm.riv.GetAvailableFacilitiesResponderServiceStub.To;

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
 * Exempelkod f�r anv�ndningsfallet "H�mta tillg�nglia tj�nsteut�vare".
 * Tj�nsteut�vare kan vara en v�rdenhet.
 * @author Robert Siwerz, www.mawell.com.
 */
public class UseCaseHamtaTillgangligaTjansteutovareAxis
{
   /**
    * Exempelkod f�r Use Case "H�mtar tillg�ngliga tj�nsteut�vare".
    * 
    * @author Robert Siwerz,www.mawell.com.
    * @throws Fel vid kommunikation med tj�nsten.
    */
   public void useCaseHamtaTillgangligaVardenheter() throws MalformedURLException
   {
      GetAvailableFacilitiesResponse response = null;
      
      try 
      {
         GetAvailableFacilitiesResponderServiceStub stub = new GetAvailableFacilitiesResponderServiceStub("http://127.0.0.1:8088/mockGetAvailableFacilitiesResponderBinding?WSDL");
         
         GetAvailableFacilities getAvailableServiceProviders0 = new GetAvailableFacilities();
         GetAvailableFacilitiesRequestType data = new GetAvailableFacilitiesRequestType();
         CountyCode countyCode = new CountyCode();
         countyCode.setCountyCode("01");
         data.setCountyCode(countyCode);
         getAvailableServiceProviders0.setGetAvailableFacilities(data);
          
         To to1 = new To();
         AttributedURIType logicalAddress = new AttributedURIType();
         URI uri = new URI();
         uri.setPath("SE239482390-23SAD");
         logicalAddress.setAnyURI(uri); // HSAID till huvudmannen som skall svara p� fr�gan.
         to1.setTo(logicalAddress);
          
         // H�mta tillg�ngliga tj�nsteut�vare.  
         response = stub.getAvailableFacilities(getAvailableServiceProviders0, to1);
      } catch (TechnicalException e) 
      { 
         // G�r ett nytt f�rs�k...
      } catch (Exception e)
      {
         e.printStackTrace();
         return;
      }
 
      // Skriver att tillg�ngliga tj�nsteut�vare. 
      Facility[] hsaIDs = response.getGetAvailableFacilitiesResponse().getHealthcare_facilities();
      System.out.println("Tillg�ngliga v�rdenheter:");

      for (int i =0; i < hsaIDs.length; i++) 
      {  
         Facility serviceProvider = hsaIDs[i]; 
         System.out.println("HSAID: " + serviceProvider.getFacilityId() + ", " + serviceProvider.getName());
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
         UseCaseHamtaTillgangligaTjansteutovareAxis exempelkod = new UseCaseHamtaTillgangligaTjansteutovareAxis();
         exempelkod.useCaseHamtaTillgangligaVardenheter();
      } catch (Exception e)
      {
         e.printStackTrace();
      }
   } 
}
