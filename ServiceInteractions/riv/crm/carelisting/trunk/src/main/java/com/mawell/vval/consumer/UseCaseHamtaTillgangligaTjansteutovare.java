package com.mawell.vval.consumer;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import org.w3._2005._08.addressing.AttributedURIType;

import riv.crm.carelisting._1.Facility;
import riv.crm.carelisting.getavailablefacilities._1.rivtabp20.GetAvailableFacilitiesResponderInterface;
import riv.crm.carelisting.getavailablefacilities._1.rivtabp20.TechnicalException;
import riv.crm.carelisting.getavailablefacilitiesresponder._1.GetAvailableFacilitiesRequestType;
import riv.crm.carelisting.getavailablefacilitiesresponder._1.GetAvailableFacilitiesResponseType;


/**
 * Exempelkod f�r anv�ndningsfallet "H�mta tillg�nglia tj�nsteut�vare".
 * Tj�nsteut�vare kan vara en v�rdenhet.
 * @author Robert Siwerz, www.mawell.com.
 */
public class UseCaseHamtaTillgangligaTjansteutovare
{
	/**
	 * Exempelkod f�r Use Case "H�mtar tillg�ngliga tj�nsteut�vare".
	 * 
	 * @author Robert Siwerz,www.mawell.com.
	 * @throws Fel vid kommunikation med tj�nsten.
	 */
	public void useCaseHamtaTillgangligaVardenheter() throws MalformedURLException
	{
		// H�mtar referens till SEI (Service Endpoint Interface).                               
		QName serviceName = new QName("urn:riv:crm:carelisting:GetAvailableFacilities:1:rivtabp20", "GetAvailableFacilitiesResponderService");
		Service service = Service.create(new URL("http://127.0.0.1:8088/mockGetAvailableFacilitiesResponderBinding?WSDL"),	serviceName);
  
		GetAvailableFacilitiesResponderInterface listingSEI = service.getPort(GetAvailableFacilitiesResponderInterface.class);
		   
		// H�mta tillg�ngliga tj�nsteut�vare. 
		AttributedURIType logicalAddress = new AttributedURIType();
		logicalAddress.setValue("SE239482390-23SAD"); // HSAID till huvudmannen som skall svara p� fr�gan.
		GetAvailableFacilitiesRequestType request = new GetAvailableFacilitiesRequestType();
		GetAvailableFacilitiesResponseType response = null;
		
		try 
		{
		   response = listingSEI.getAvailableFacilities(logicalAddress, request);
		} catch (TechnicalException e)
		{
		   // G�r ett nytt f�rs�k...
		}
 
		// Skriver att tillg�ngliga tj�nsteut�vare. 
		List<Facility> hsaIDs = response.getHealthcareFacilities();
		System.out.println("Tillg�ngliga v�rdenheter:");
		Iterator<Facility> hsaIterator = hsaIDs.iterator();

		while (hsaIterator.hasNext()) 
		{
		   Facility facility = hsaIterator.next(); 
			System.out.println("HSAID: " + facility.getFacilityId() + ", namn: " + facility.getName());
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
			UseCaseHamtaTillgangligaTjansteutovare exempelkod = new UseCaseHamtaTillgangligaTjansteutovare();
			exempelkod.useCaseHamtaTillgangligaVardenheter();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
