
/*
 * 
 */

package se.riv.ehr.accesscontrol.assertcareengagement.v1.rivtabp21;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

/**
 * This class was generated by Apache CXF 2.2.2
 * Sun May 04 00:17:35 CEST 2014
 * Generated source version: 2.2.2
 * 
 */


@WebServiceClient(name = "AssertCareEngagementResponderService", 
                  wsdlLocation = "file:/Users/johan/Documents/Development/Projects/SKL/rivta/ServiceInteractions/riv/ehr/accesscontrol/trunk/code_gen/jaxws/../../schemas/./interactions/AssertCareEngagementInteraction/AssertCareEngagementInteraction_1.0_RIVTABP21.wsdl",
                  targetNamespace = "urn:riv:ehr:accesscontrol:AssertCareEngagement:1:rivtabp21") 
public class AssertCareEngagementResponderService extends Service {

    public final static URL WSDL_LOCATION;
    public final static QName SERVICE = new QName("urn:riv:ehr:accesscontrol:AssertCareEngagement:1:rivtabp21", "AssertCareEngagementResponderService");
    public final static QName AssertCareEngagementResponderPort = new QName("urn:riv:ehr:accesscontrol:AssertCareEngagement:1:rivtabp21", "AssertCareEngagementResponderPort");
    static {
        URL url = null;
        try {
            url = new URL("file:/Users/johan/Documents/Development/Projects/SKL/rivta/ServiceInteractions/riv/ehr/accesscontrol/trunk/code_gen/jaxws/../../schemas/./interactions/AssertCareEngagementInteraction/AssertCareEngagementInteraction_1.0_RIVTABP21.wsdl");
        } catch (MalformedURLException e) {
            System.err.println("Can not initialize the default wsdl from file:/Users/johan/Documents/Development/Projects/SKL/rivta/ServiceInteractions/riv/ehr/accesscontrol/trunk/code_gen/jaxws/../../schemas/./interactions/AssertCareEngagementInteraction/AssertCareEngagementInteraction_1.0_RIVTABP21.wsdl");
            // e.printStackTrace();
        }
        WSDL_LOCATION = url;
    }

    public AssertCareEngagementResponderService(URL wsdlLocation) {
        super(wsdlLocation, SERVICE);
    }

    public AssertCareEngagementResponderService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public AssertCareEngagementResponderService() {
        super(WSDL_LOCATION, SERVICE);
    }

    /**
     * 
     * @return
     *     returns AssertCareEngagementResponderInterface
     */
    @WebEndpoint(name = "AssertCareEngagementResponderPort")
    public AssertCareEngagementResponderInterface getAssertCareEngagementResponderPort() {
        return super.getPort(AssertCareEngagementResponderPort, AssertCareEngagementResponderInterface.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns AssertCareEngagementResponderInterface
     */
    @WebEndpoint(name = "AssertCareEngagementResponderPort")
    public AssertCareEngagementResponderInterface getAssertCareEngagementResponderPort(WebServiceFeature... features) {
        return super.getPort(AssertCareEngagementResponderPort, AssertCareEngagementResponderInterface.class, features);
    }

}
