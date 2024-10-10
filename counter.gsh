import com.sap.gateway.ip.core.customdev.util.Message
import java.util.HashMap

def Message processData(Message message) {
    // Retrieve the OData response
    def body = message.getBody(String.class)
    
    // Parse the JSON response (assuming the response is in JSON format)
    def jsonSlurper = new groovy.json.JsonSlurper()
    def response = jsonSlurper.parseText(body)
    
    // Count the number of records (assuming records are under 'value' key)
    def recordCount = response.value.size()
    
    // Store the count in a variable
    message.setProperty("recordCount", recordCount)
    
    return message
}
