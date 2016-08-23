package com.aibang.framework.utils;
import org.jboss.resteasy.client.ClientRequest;
import org.jboss.resteasy.client.ClientResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import static javax.ws.rs.core.MediaType.TEXT_XML;

@SuppressWarnings("deprecation")
@Component
public class RestClient {
    private Logger logger = LoggerFactory.getLogger(getClass());

    public <T> T post(String url, Object data, Class<T> type) {
        ClientRequest request = clientRequest(url);
        request.body(TEXT_XML, data);
        ClientResponse<?> response = null;
        try {
            response = request.post();
        } catch (Exception e) {
            throw new RestClientException("post: " + url, e, Status.INTERNAL_SERVER_ERROR);
        }

        checkStatus(url, response);

        if (response.getResponseStatus().equals(Status.OK)) {
            return response.getEntity(type);
        }
        return null;
    }

    public void post(String url, Object data) {
        ClientRequest request = clientRequest(url);
        request.body(TEXT_XML, data);
        ClientResponse<?> response;
        try {
            response = request.post();
        } catch (Exception e) {
            throw new RestClientException("post: " + url, e, Response.Status.INTERNAL_SERVER_ERROR);
        }

        checkStatus(url, response);
    }

    public <T> T get(String url, Class<T> classType) {
        ClientRequest request = clientRequest(url);
        ClientResponse<?> response;
        try {
            response = request.get();
        } catch (Exception e) {
			throw new RestClientException(url, e,
					Response.Status.INTERNAL_SERVER_ERROR);
        }

        checkStatus(url, response);
        return response.getEntity(classType);
    }

    public <T> T put(String url, Object data, Class<T> type) {
    	ClientRequest request = clientRequest(url);
      if (data != null) {
          request.body(TEXT_XML, data);
      }
      ClientResponse<?> response;
      try {
          response = request.put();
      } catch (Exception e) {
          throw new RestClientException(url, e, Response.Status.INTERNAL_SERVER_ERROR);
      }

      checkStatus(url, response);
      
      if (response.getResponseStatus().equals(Status.OK)) {
	        return response.getEntity(type);
	    }
	    return null;
    }
    
    public void put(String url, Object data) {
        this.put(url, data, TEXT_XML);
    }

    public void put(String url, Object data, String contentType) {
        ClientRequest request = clientRequest(url);
        if (data != null) {
            request.body(contentType, data);
        }
        ClientResponse<?> response;
        try {
            response = request.put();
        } catch (Exception e) {
            throw new RestClientException("put: " + url, e, Response.Status.INTERNAL_SERVER_ERROR);
        }

        checkStatus(url, response);
    }

    
    public void put(String url){
    	ClientRequest request = clientRequest(url);
    	ClientResponse<?> response;
    	try {
			response = request.put();
		} catch (Exception e) {
			throw new RestClientException("put: " + url, e, Response.Status.INTERNAL_SERVER_ERROR);
		}
		checkStatus(url, response);
    }
    
    public void del(String url){
    	ClientRequest request = clientRequest(url);
    	ClientResponse<?> response;
    	try {
			response = request.delete();
		} catch (Exception e) {
			throw new RestClientException("put: " + url, e, Response.Status.INTERNAL_SERVER_ERROR);
		}
		checkStatus(url, response);
    }
    
    protected void checkStatus(String url, ClientResponse<?> response)
            throws RestClientException {
        if (!response.getResponseStatus().equals(Status.OK)
				&& !response.getResponseStatus().equals(Status.NO_CONTENT) && !response.getResponseStatus().equals(Status.CREATED)) {
            throw new RestClientException(url + " "
                    + response.getResponseStatus().toString() + "\n"
					+ response.getEntity(String.class),
					response.getResponseStatus());
        }
    }

    protected ClientRequest clientRequest(String url) throws RestClientException {
        logger.debug("RestClient url:" + url);
        ClientRequest request = new ClientRequest(url);
        request.header("charset", "UTF-8");
        return request;
    }
    
/*
    private static void registerUser(String url, MediaType mediaType) {
        System.out.println("Registering user via " + url);
        User user = new User(1L, "larrypage");
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target(url);
        Response response = target.request().post(Entity.entity(user, mediaType));

        try {
            if (response.getStatus() != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + response.getStatus());
            }
            System.out.println("Successfully got result: " + response.readEntity(String.class));
        } finally {
            response.close();
            client.close();
        }
    }

    private static void getUser(String url) {
        System.out.println("Getting user via " + url);
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target(url);
        Response response = target.request().get();
        try {
            if (response.getStatus() != 200) {
                throw new RuntimeException("Failed with HTTP error code : " + response.getStatus());
            }
            System.out.println("Successfully got result: " + response.readEntity(String.class));
        } finally {
            response.close();
            client.close();
        }
    }*/
    
    
/*
    public <T> T post(String url, Object data, Class<T> type) {
    	 Client client = clientRequest(url);
         WebTarget target = client.target(url);
         Response response=null;
        try {
        	 response = target.request().post(Entity.entity(data, MediaType.TEXT_XML));
        } catch (Exception e) {
            throw new RestClientException("post: " + url, e, Status.INTERNAL_SERVER_ERROR);
        }
        checkStatus(url, response);

        if (response.getStatus() != 200) {
            return response.readEntity(type);
        }
        return null;
    }

    @SuppressWarnings("deprecation")
	public void post(String url, Object data) {
     	 Client client = clientRequest(url);
         WebTarget target = client.target(url);
         Response response=null;
        try {
            response = target.request().post(Entity.entity(data, MediaType.TEXT_XML));
        } catch (Exception e) {
        	response.close();
            client.close();
            throw new RestClientException("post: " + url, e, Response.Status.INTERNAL_SERVER_ERROR);
        }

        checkStatus(url, response);
    }

    public <T> T get(String url, Class<T> classType) {
    	Client client = clientRequest(url);
        WebTarget target = client.target(url);
        Response response=null;
        try {
            response = target.request().get();
        } catch (Exception e) {
        	response.close();
            client.close();
			throw new RestClientException(url, e,
					Response.Status.INTERNAL_SERVER_ERROR);
        }

        checkStatus(url, response);
        return response.readEntity(classType);
    }

    public <T> T put(String url, Object data, Class<T> type) {
    	Client client = clientRequest(url);
        WebTarget target = client.target(url);
        Response response=null;
      try {
    	 	response=target.request().put(Entity.entity(data, MediaType.TEXT_XML));
      } catch (Exception e) {
    	  response.close();
          client.close();
          throw new RestClientException(url, e, Response.Status.INTERNAL_SERVER_ERROR);
      }

      checkStatus(url, response);
      
      if (response.getStatus() != 200) {
          return response.readEntity(type);
      }
	  return null;
    }
    
    public void put(String url, Object data) {
        this.put(url, data, TEXT_XML);
    }

    public void put(String url, Object data, String contentType) {
    	Client client = clientRequest(url);
        WebTarget target = client.target(url);
        Response response=null;
        try {
        	response=target.request().put(Entity.entity(data, contentType));
        } catch (Exception e) {
        	response.close();
            client.close();
            throw new RestClientException("put: " + url, e, Response.Status.INTERNAL_SERVER_ERROR);
        }

        checkStatus(url, response);
    }

    
    public void put(String url){
    	Client client = clientRequest(url);
        WebTarget target = client.target(url);
        Response response=null;
    	try {
    		response=target.request().put(null); 
		} catch (Exception e) {
			response.close();
            client.close();
			throw new RestClientException("put: " + url, e, Response.Status.INTERNAL_SERVER_ERROR);
		}
		checkStatus(url, response);
    }
    
    public void del(String url){
    	Client client = clientRequest(url);
        WebTarget target = client.target(url);
        Response response=null;
    	try {
			response = target.request().delete();
		} catch (Exception e) {
			response.close();
            client.close();
			throw new RestClientException("put: " + url, e, Response.Status.INTERNAL_SERVER_ERROR);
		}
		checkStatus(url, response);
    }
    
    protected void checkStatus(String url, Response response)  {
    	 if (response.getStatus() != 200) {
            throw new RuntimeException(url + " "
                    + response.getStatus() + "\n"
					+ response.readEntity(String.class));
        }
    }

    protected Client clientRequest(String url) throws RestClientException {
    	 Client client = ClientBuilder.newClient();
        logger.debug("RestClient url:" + url);
        return client;
    }*/
}