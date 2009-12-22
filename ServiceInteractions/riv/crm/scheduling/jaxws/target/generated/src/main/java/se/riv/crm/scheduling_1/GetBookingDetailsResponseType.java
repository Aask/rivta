
package se.riv.crm.scheduling_1;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import org.w3c.dom.Element;


/**
 * <p>Java class for GetBookingDetailsResponseType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="GetBookingDetailsResponseType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="timeslotDetail" type="{urn:riv:crm:scheduling:1}TimeslotType"/>
 *         &lt;any/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GetBookingDetailsResponseType", namespace = "urn:riv:crm:scheduling:GetBookingDetailsResponder:1", propOrder = {
    "timeslotDetail",
    "any"
})
public class GetBookingDetailsResponseType {

    @XmlElement(required = true)
    protected TimeslotType timeslotDetail;
    @XmlAnyElement(lax = true)
    protected List<Object> any;

    /**
     * Gets the value of the timeslotDetail property.
     * 
     * @return
     *     possible object is
     *     {@link TimeslotType }
     *     
     */
    public TimeslotType getTimeslotDetail() {
        return timeslotDetail;
    }

    /**
     * Sets the value of the timeslotDetail property.
     * 
     * @param value
     *     allowed object is
     *     {@link TimeslotType }
     *     
     */
    public void setTimeslotDetail(TimeslotType value) {
        this.timeslotDetail = value;
    }

    /**
     * Gets the value of the any property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the any property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getAny().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Element }
     * {@link Object }
     * 
     * 
     */
    public List<Object> getAny() {
        if (any == null) {
            any = new ArrayList<Object>();
        }
        return this.any;
    }

}
